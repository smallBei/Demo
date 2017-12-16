//
//  TableView.m
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/15.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import "TableView.h"
#import "TableItemView.h"
#import "SwipeMenuViewConfig.h"

@interface TableView(Extend)
@property (nonatomic, strong, readonly) TableItemView *currentItem;
@property (nonatomic, strong, readonly) TableItemView *nextItem;
@property (nonatomic, strong, readonly) TableItemView *proItem;
@end


@interface TableView()
@property (nonatomic, strong) NSMutableArray<TableItemView *> *itemsM;
@property (nonatomic, strong) UIView *underlineView;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, strong) SwipeMenuViewConfig *config;
@end

@implementation TableView

- (void)reload:(SwipeMenuViewConfig *) config {
    self.config = config;
    [self setup];
}

- (void)setup {
    [self reset];
    [self setScrollInfo];
    [self setTableItems];
    [self setupUnderlineView];
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    [self setContentSize:CGSizeMake(CGRectGetMaxX(self.itemsM.lastObject.frame), self.bounds.size.height)];
}

- (void)updateToIndex:(NSInteger) index {
    if (self.currentIndex == index) {return;}
    self.currentIndex = index;
    [self updateSelectedItem:index];
}

- (void)updateSelectedItem:(NSInteger) index {
    [self.itemsM enumerateObjectsUsingBlock:^(TableItemView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.isSelected = idx == index;
    }];
}


- (void)reset {
    [self.itemsM enumerateObjectsUsingBlock:^(TableItemView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    [self.underlineView removeFromSuperview];
    [self.itemsM removeAllObjects];
}

- (void)setTableItems {
    NSInteger count = [self.dataSource numberOfItem:self];
    CGFloat pointX = self.config.margin;
    for (NSInteger i = 0; i < count; i += 1) {
        CGRect frame = CGRectZero;
        TableItemView *item = [[TableItemView alloc] init];
        NSString *title = [self.dataSource tableView:self titleForIndex:i];
        [item.titleLabel setText:title];
        item.config = self.config;
        item.isSelected = i == self.currentIndex;
        
        CGSize size = [item.titleLabel sizeThatFits:CGSizeMake(CGFLOAT_MAX, self.config.tableViewHeight)];
        frame.origin.x = pointX;
        frame.size.width = size.width;
        frame.size.height = self.config.tableViewHeight;
        item.frame = frame;
        
        [self.itemsM addObject:item];
        [self addSubview:item];
        pointX += size.width + self.config.margin;
    }
}

- (void)setupUnderlineView {
    [self addSubview:self.underlineView];
    CGRect frame = self.currentItem.frame;
    [self.underlineView setFrame:CGRectMake(frame.origin.x, frame.size.height - 1, frame.size.width, 1)];
}

- (void)setScrollInfo {
    self.backgroundColor = [UIColor clearColor];
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    self.scrollEnabled = YES;
    self.directionalLockEnabled = YES;
    self.alwaysBounceHorizontal = NO;
    self.scrollsToTop = YES;
    self.bouncesZoom = NO;
}

- (void)focusonTarget:(UIView *) target animated:(BOOL) animated {
    CGFloat offset = target.center.x - self.frame.size.width / 2 + self.config.margin;
    CGFloat contentWidth = self.frame.size.width + self.config.margin * 2;
    
    if (offset < 0 || self.frame.size.width > contentWidth) {
        [self setContentOffset:CGPointMake(0, 0) animated:animated];
    } else if (contentWidth - self.frame.size.width < offset) {
        [self setContentOffset:CGPointMake(contentWidth - self.frame.size.width, 0) animated:animated];
    } else {
        [self setContentOffset:CGPointMake(offset, 0) animated:animated];
    }
}

- (void)moveUnderlineViewIndex:(NSInteger) index ratio:(CGFloat) ratio direction:(Direction) direction {
    [self updateToIndex:index];
    if (nil == self.currentItem) {return;}
    CGRect underFrame = self.underlineView.frame;
    switch (direction) {
        case DirectionForward:
        {
            underFrame.origin.x = self.currentItem.frame.origin.x +
            (self.nextItem.frame.origin.x - self.currentItem.frame.origin.x) * ratio + self.config.underlineMargin;
            underFrame.size.width = self.currentItem.frame.size.width + (self.nextItem.frame.size.width - self.currentItem.frame.size.width) * ratio - 2 * self.config.underlineMargin;
        }
            break;
        case DirectionReverse:
        {
            underFrame.origin.x = self.proItem.frame.origin.x + (self.currentItem.frame.origin.x - self.proItem.frame.origin.x) * ratio + self.config.underlineMargin;
            underFrame.size.width = self.proItem.frame.size.width + (self.currentItem.frame.size.width - self.proItem.frame.size.width) * ratio - 2 * self.config.underlineMargin;;
        }
            break;
        default:
            break;
    }
    self.underlineView.frame = underFrame;
    [self focusonTarget:self.underlineView animated:NO];
}



- (UIView *)underlineView {
    if (nil == _underlineView) {
        _underlineView = [UIView new];
        _underlineView.backgroundColor = [UIColor blackColor];
    }
    return _underlineView;
}

- (NSMutableArray<TableItemView *> *)itemsM {
    if (nil == _itemsM) {
        _itemsM = [NSMutableArray array];
    }
    return _itemsM;
}
@end

@implementation TableView(Extend)
- (void)jumpToIndex:(NSInteger) index {
    [self updateToIndex:index];
    [self focusonTarget:self.currentItem animated:NO];
}

- (TableItemView *)currentItem {
    return  self.currentIndex < self.itemsM.count ? self.itemsM[self.currentIndex] : 0;
}

- (TableItemView *)nextItem {
    if (self.currentIndex < self.itemsM.count - 1) {
        return self.itemsM[self.currentIndex + 1];
    }
    return self.itemsM[self.currentIndex];
}

- (TableItemView *)proItem {
    if (self.currentIndex > 0) {
        return self.itemsM[self.currentIndex - 1];
    }
    return self.itemsM[self.currentIndex];
}
@end

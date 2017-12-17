//
//  SwipeMenuView.m
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/15.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import "SwipeMenuView.h"
#import "SwipeMenuView+DataSource.h"
#import "SwipeMenuViewConfig.h"
#import "TableItemView.h"

@interface SwipeMenuView()<UIScrollViewDelegate>
@property (nonatomic, strong) TableView *tabView;
@property (nonatomic, strong) ContentScrollView *contentView;
@property (nonatomic, strong) SwipeMenuViewConfig *config;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, assign, getter=isJumping) BOOL jumping;
@end

@interface SwipeMenuView (TabViewEvent)
- (void)addTabItemGestures;
@end

@implementation SwipeMenuView

- (void)layoutSubviews {
    [super layoutSubviews];
    self.tabView.frame = CGRectMake(0, 0, self.bounds.size.width, self.config.tableViewHeight);
    self.contentView.frame = CGRectMake(0, CGRectGetMaxY(self.tabView.frame), self.bounds.size.width, self.config.contenViewHeight);
}

- (void)reload:(SwipeMenuViewConfig *) config {
    self.config = config;
    [self.tabView reload:config];
    [self.contentView reload:config];
    
    [self addTabItemGestures];
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)updateFromIndex:(NSInteger) formIndex toIndex:(NSInteger) toIndex {
    [self.tabView updateToIndex:toIndex];
    [self.contentView updateIndex:toIndex];
    self.currentIndex = toIndex;
    
    if ([self.delegate respondsToSelector:@selector(swipeMenuView:didChangeIndexFrom:toIndex:)]) {
        [self.delegate swipeMenuView:self didChangeIndexFrom:formIndex toIndex:toIndex];
    }
}

- (TableView *)tabView {
    if (nil == _tabView) {
        _tabView = [[TableView alloc] init];
        _tabView.dataSource = self;
        [self addSubview:_tabView];
    }
    return _tabView;
}

- (ContentScrollView *)contentView {
    if (nil == _contentView) {
        _contentView = [[ContentScrollView alloc] init];
        _contentView.dataSource = self;
        _contentView.delegate = self;
        [self addSubview:_contentView];
    }
    return _contentView;
}
@end

@implementation SwipeMenuView (TabViewEvent)
- (void)addTabItemGestures {
    __weak typeof(self) weakSelf = self;
    [self.tabView.tabItemViews enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [weakSelf addTapGestureRecognizer:obj];
    }];
}

- (void)addTapGestureRecognizer: (UIView *) item {
    [item addGestureRecognizer:[self tapGestureRecognizer]];
}

-(UITapGestureRecognizer *)tapGestureRecognizer {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapItemView:)];
    tap.numberOfTapsRequired = 1;
    tap.cancelsTouchesInView = NO;
    return tap;;
}

- (void)tapItemView:(UITapGestureRecognizer *) recognizer {
    NSInteger index = [self.tabView.tabItemViews indexOfObject:recognizer.view];
    if (index == self.currentIndex) {return;}
    
    [self updateFromIndex:self.currentIndex toIndex:index];
    [self.contentView jumpToIndex:index animated:NO];
    [self.tabView animateUnderlineViewIndex:index completion:nil];
}
@end


@implementation SwipeMenuView (ScrollViewDelegate)
- (void)scrollViewDidScroll:(UIScrollView *) scrollView {
    if (scrollView.contentOffset.x >= self.bounds.size.width * (self.currentIndex + 1)) {
        [self updateFromIndex:self.currentIndex toIndex:self.currentIndex + 1];
    } else if (scrollView.contentOffset.x <= self.bounds.size.width * (self.currentIndex - 1)) {
        [self updateFromIndex:self.currentIndex toIndex:self.currentIndex - 1];
    }
    
    if (self.isJumping == NO) {
        self.jumping = YES;
        if (scrollView.contentOffset.x > self.bounds.size.width * (self.currentIndex)) {
            if ([self.delegate respondsToSelector:@selector(swipeMenuView:willChangeIndexFrom:toIndex:)]) {
                [self.delegate swipeMenuView:self willChangeIndexFrom:self.currentIndex toIndex:(self.currentIndex + 1)];
            }
        } else if (scrollView.contentOffset.x < self.bounds.size.width * (self.currentIndex)) {
            if ([self.delegate respondsToSelector:@selector(swipeMenuView:willChangeIndexFrom:toIndex:)]) {
                [self.delegate swipeMenuView:self willChangeIndexFrom:self.currentIndex toIndex:(self.currentIndex - 1)];
            }
        }
    }
    
    [self updateTabViewAdditionByScrollView:scrollView];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.jumping = NO;
}

- (void)updateTabViewAdditionByScrollView:(UIScrollView *) scrollView {
    [self moveUnderlineViewByScrollView:scrollView];
}

- (void)moveUnderlineViewByScrollView:(UIScrollView *) scrollView {
    CGFloat ratio = [@(scrollView.contentOffset.x) integerValue] % [@(self.contentView.bounds.size.width) integerValue];
    ratio = ratio / self.contentView.bounds.size.width;
    
    if (scrollView.contentOffset.x >= self.bounds.size.width * self.currentIndex) {
        [self.tabView moveUnderlineViewIndex:self.currentIndex ratio:ratio direction:DirectionForward];
    } else if(scrollView.contentOffset.x < self.bounds.size.width * self.currentIndex) {
        [self.tabView moveUnderlineViewIndex:self.currentIndex ratio:ratio direction:DirectionReverse];
    }
}
@end

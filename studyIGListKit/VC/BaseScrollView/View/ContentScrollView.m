//
//  ContentScrollView.m
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/15.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import "ContentScrollView.h"
#import "SwipeMenuViewConfig.h"
@interface ContentScrollView(Extend)
@property (nonatomic, strong, readonly) UIView *currentPage;
@property (nonatomic, strong, readonly) UIView *nextPage;
@property (nonatomic, strong, readonly) UIView *proPage;
@end


@interface ContentScrollView()
@property (nonatomic, strong) NSMutableArray<UIView *> *pageItemsM;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, strong) SwipeMenuViewConfig *config;

@end

@implementation ContentScrollView

- (void)reload:(SwipeMenuViewConfig *) config {
    self.config = config;
    [self reset];
    [self setup];
}
- (void)setup {
    [self setupScrollView];
    [self setupPages];
}

- (void)reset {
    [self.pageItemsM enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    
    [self.pageItemsM removeAllObjects];
}

- (void)updateIndex:(NSInteger) index {
    self.currentIndex = index;
}

- (void)setupScrollView {
    self.backgroundColor = [UIColor clearColor];
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    self.scrollEnabled = YES;
    self.pagingEnabled = YES;
    self.directionalLockEnabled = NO;
    self.alwaysBounceHorizontal = NO;
    self.scrollsToTop = NO;
    self.bounces = NO;
    self.bouncesZoom = NO;
    [self setContentOffset:CGPointZero animated:NO];
}

- (void)setupPages {
    NSInteger count = [self.dataSource numberOfPages:self];
    CGFloat pointX = 0;
    for (NSInteger i = 0; i < count; i += 1) {
        UIView *viewOfVC = [self.dataSource contentScrollView:self atIndex:i];
        viewOfVC.frame = CGRectMake(pointX, 0, self.bounds.size.width, self.config.contenViewHeight);
        [self.pageItemsM addObject:viewOfVC];
        [self addSubview:viewOfVC];
        pointX += viewOfVC.bounds.size.width;
    }
    [self setContentSize:CGSizeMake(self.bounds.size.width * count, self.bounds.size.height)];
}

- (NSMutableArray<UIView *> *)pageItemsM {
    if (nil == _pageItemsM) {
        _pageItemsM = [NSMutableArray array];
    }
    return _pageItemsM;
}
@end



@implementation ContentScrollView(Extend)
- (void)jumpToIndex:(NSInteger) index animated:(BOOL) animated {
    [self updateIndex:index];
    [self setContentOffset:CGPointMake(self.frame.size.width * index, 0) animated:animated];
}

- (UIView *)currentPage {
    if (!(self.currentIndex < self.pageItemsM.count && self.currentIndex >= 0)) { return nil; }
    return self.pageItemsM[self.currentIndex];
}

- (UIView *)nextPage {
    if (!(self.currentIndex < self.pageItemsM.count - 1)) { return nil; }
    return self.pageItemsM[self.currentIndex + 1];
}

- (UIView *)proPage {
    if (!(self.currentIndex > 0)) { return nil; }
    return self.pageItemsM[self.currentIndex - 1];
}
@end

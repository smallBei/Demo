//
//  SwipeMenuView.h
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/15.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableView.h"
#import "ContentScrollView.h"
@class SwipeMenuViewConfig;
@class SwipeMenuView;
@protocol SwipeMenuViewDataSource <NSObject>
- (NSInteger)numberOfPages:(SwipeMenuView *) swipeMenuView;

- (NSString *)swipeMenuView:(SwipeMenuView *) swipeMenuView titleForPageAt:(NSInteger) index;

- (UIView *)swipeMenuView:(SwipeMenuView *)swipeMenuView viewControllerForPageAt:(NSInteger) index;
@end

@protocol SwipeMenuViewDelegate <NSObject>
- (void)swipeMenuView:(SwipeMenuView *) swipeMenuView willChangeIndexFrom:(NSInteger) fromIndex toIndex:(NSInteger) toIndex;

- (void)swipeMenuView:(SwipeMenuView *) swipeMenuView didChangeIndexFrom:(NSInteger) fromIndex toIndex:(NSInteger) toIndex;
@end

@interface SwipeMenuView : UIView
@property (nonatomic, weak) id<SwipeMenuViewDataSource> dataSource;
@property (nonatomic, weak) id<SwipeMenuViewDelegate> delegate;
- (void)reload:(SwipeMenuViewConfig *) config;
@end

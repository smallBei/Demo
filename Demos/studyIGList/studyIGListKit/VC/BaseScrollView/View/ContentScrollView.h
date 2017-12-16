//
//  ContentScrollView.h
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/15.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ContentScrollView;
@class SwipeMenuViewConfig;

@protocol ContentScrollViewDataSource <NSObject>
- (NSInteger)numberOfPages:(ContentScrollView *) content;
- (UIView *)contentScrollView:(ContentScrollView *) content atIndex:(NSInteger) index;

@end

@interface ContentScrollView : UIScrollView
@property (nonatomic, weak) id<ContentScrollViewDataSource> dataSource;
- (void)updateIndex:(NSInteger) index;
- (void)reload:(SwipeMenuViewConfig *) config;
@end

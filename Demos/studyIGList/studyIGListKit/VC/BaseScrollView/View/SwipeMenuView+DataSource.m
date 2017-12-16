//
//  SwipeMenuView+DataSource.m
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/16.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import "SwipeMenuView+DataSource.h"

@implementation SwipeMenuView (DataSource)
#pragma mark - TableViewDelegate
- (NSInteger)numberOfItem:(TableView *)tableView {
    return [self.dataSource numberOfPages:self];
}

- (NSString *)tableView:(TableView *)tableView titleForIndex:(NSInteger)index {
    return [self.dataSource swipeMenuView:self titleForPageAt:index];
}

#pragma mark - ContentViewDelegate
- (NSInteger)numberOfPages:(ContentScrollView *)content {
    return [self.dataSource numberOfPages:self];
}
- (UIView *)contentScrollView:(ContentScrollView *) content atIndex:(NSInteger) index {
    return [self.dataSource swipeMenuView:self viewControllerForPageAt:index];
}
@end

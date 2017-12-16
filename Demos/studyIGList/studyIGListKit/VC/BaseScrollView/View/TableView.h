//
//  TableView.h
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/15.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, Direction) {
    DirectionForward        = 1,
    DirectionReverse        = 2,
};

@class TableView;
@class SwipeMenuViewConfig;
@protocol TableViewDelegate <NSObject>

- (NSInteger)numberOfItem:(TableView *) tableView;
- (NSString *)tableView:(TableView *) tableView titleForIndex:(NSInteger) index;

@end

@interface TableView : UIScrollView
@property (nonatomic, weak) id<TableViewDelegate> dataSource;
- (void)reload:(SwipeMenuViewConfig *) config;
- (void)updateToIndex:(NSInteger) index;
- (void)moveUnderlineViewIndex:(NSInteger) index ratio:(CGFloat) ratio direction:(Direction) direction;
@end

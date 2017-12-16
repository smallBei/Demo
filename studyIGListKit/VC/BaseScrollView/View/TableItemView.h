//
//  TableItemView.h
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/15.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SwipeMenuViewConfig;
@interface TableItemView : UIView
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, assign) BOOL isSelected;
@property (nonatomic, strong) SwipeMenuViewConfig *config;
@end

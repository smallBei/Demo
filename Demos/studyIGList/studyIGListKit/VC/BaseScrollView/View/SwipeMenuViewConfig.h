//
//  SwipeMenuViewConfig.h
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/16.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SwipeMenuViewConfig : NSObject
@property (nonatomic, assign) NSInteger tableViewHeight;
@property (nonatomic, assign) NSInteger margin;
@property (nonatomic, assign) NSInteger selectFont;
@property (nonatomic, strong) UIColor *selectedTextColor;

@property (nonatomic, assign) NSInteger textFont;
@property (nonatomic, strong) UIColor *textColor;

@property (nonatomic, assign) NSInteger contenViewHeight;

@property (nonatomic, strong) UIColor *underlineColor;

@property (nonatomic, assign) NSInteger underlineMargin;
@end

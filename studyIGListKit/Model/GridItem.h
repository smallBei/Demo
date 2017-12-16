//
//  GridItem.h
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/13.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GridItem : NSObject
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) NSInteger itemCount;
+ (instancetype)itemColor:(UIColor *) color itemCount:(NSInteger) count;
@end


@interface GridItemSectionController : IGListSectionController
@property (nonatomic, assign) BOOL isFull;
@end

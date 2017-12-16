//
//  UserItem.h
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/13.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserItem : NSObject
@property (nonatomic, assign) NSInteger pk;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *handle;

+ (instancetype)itemPk:(NSInteger) pk name:(NSString *) name handle:(NSString *) handle;
@end


@interface UserItemSectionController : IGListSectionController
@end

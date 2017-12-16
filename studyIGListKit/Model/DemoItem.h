//
//  DemoItem.h
//  TestListKit
//
//  Created by youzhenbei on 2017/12/12.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListKit.h>
@interface DemoItem : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) Class className;
@property (nonatomic, strong) NSString *controllerIdentifier;

+ (instancetype)itemName:(NSString *) name className:(Class) className;
+ (instancetype)itemName:(NSString *) name
               className:(Class) className
              identifier:(NSString *) identifier;
@end


@interface DemoSectionController: IGListSectionController

@end

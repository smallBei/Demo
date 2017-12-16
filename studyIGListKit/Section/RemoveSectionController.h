//
//  RemoveSectionController.h
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/14.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import <IGListKit/IGListKit.h>

@class RemoveSectionController;

@protocol RemoveSectionControllerDelegate <NSObject>
@optional
- (void)removeSectionWant2Remove:(RemoveSectionController *) section;
@end

@interface RemoveSectionController : IGListSectionController
@property (nonatomic, weak) id<RemoveSectionControllerDelegate> delegate;
@end

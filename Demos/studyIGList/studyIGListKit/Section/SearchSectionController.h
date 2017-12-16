//
//  SearchSectionController.h
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/13.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import <IGListKit/IGListKit.h>
@class SearchSectionController;
@protocol SearchSectionControllerDelegate <NSObject>

@optional
- (void)searchSectionController:(SearchSectionController *) section didChangeStr:(NSString *) str;

@end

@interface SearchSectionController : IGListSectionController
@property (nonatomic, weak) id<SearchSectionControllerDelegate> delegate;
@end

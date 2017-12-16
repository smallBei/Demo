//
//  RemoveCell.h
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/14.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RemoveCell;
@protocol RemoveCellDelegate <NSObject>
@optional
- (void)removeCellEvent:(RemoveCell *) cell;

@end

@interface RemoveCell : UICollectionViewCell
@property (nonatomic, strong) NSString *test;
@property (nonatomic, weak) id<RemoveCellDelegate> delegate;
@end

//
//  RemoveSectionController.m
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/14.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import "RemoveSectionController.h"
#import "RemoveCell.h"
@interface RemoveSectionController() <RemoveCellDelegate>
@property (nonatomic, strong) NSNumber *number;
@end

@implementation RemoveSectionController

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 55);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    RemoveCell *cell = [self.collectionContext dequeueReusableCellOfClass:[RemoveCell class] forSectionController:self atIndex:index];
    cell.test = [self.number stringValue];
    cell.delegate = self;
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.number = object;
}

- (void)removeCellEvent:(RemoveCell *)cell {
    if ([self.delegate respondsToSelector:@selector(removeSectionWant2Remove:)]) {
        [self.delegate removeSectionWant2Remove:self];
    }
}

@end

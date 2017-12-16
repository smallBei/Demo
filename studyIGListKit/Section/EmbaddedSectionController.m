//
//  EmbaddedSectionController.m
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/14.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import "EmbaddedSectionController.h"
#import "CenterLabelCell.h"

@interface EmbaddedSectionController()
@property (nonatomic, strong) NSNumber *number;
@end

@implementation EmbaddedSectionController

- (instancetype)init {
    if (self = [super init]) {
        self.inset = UIEdgeInsetsMake(0, 0, 0, 10);
    }
    return self;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.height, self.collectionContext.containerSize.height);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    CenterLabelCell *cell = [self.collectionContext dequeueReusableCellOfClass:[CenterLabelCell class] forSectionController:self atIndex:index];
    cell.text = [self.number stringValue];
    [cell.contentView setBackgroundColor:[UIColor colorWithRed:237/255.f green:73/255.f blue:86/255.f alpha:1]];
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.number = object;
}

@end

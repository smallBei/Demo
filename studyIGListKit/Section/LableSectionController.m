//
//  LableSectionController.m
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/13.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import "LableSectionController.h"
#import "DemoLableCell.h"

@interface LableSectionController()
@property (nonatomic, copy) NSString *model;
@end

@implementation LableSectionController

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 55);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    DemoLableCell *cell = [self.collectionContext dequeueReusableCellOfClass:[DemoLableCell class] forSectionController:self atIndex:index];
    cell.text = self.model;
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.model = object;
}

@end

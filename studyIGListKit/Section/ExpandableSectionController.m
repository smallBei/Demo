//
//  ExpandableSectionController.m
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/13.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import "ExpandableSectionController.h"
#import "DemoLableCell.h"

@interface ExpandableSectionController()
@property (nonatomic, assign) BOOL expanded;
@property (nonatomic, strong) NSString *object;
@end

@implementation ExpandableSectionController
- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 55);
}
- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    DemoLableCell *cell = [self.collectionContext dequeueReusableCellOfClass:[DemoLableCell class] forSectionController:self atIndex:index];
    cell.text = self.object;
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.object = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    self.expanded = !self.expanded;
    [UIView animateWithDuration:0.3 animations:^{
        [self.collectionContext invalidateLayoutForSectionController:self completion:nil];
    }];
}
@end

//
//  GridItem.m
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/13.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import "GridItem.h"
#import "CenterLabelCell.h"

@implementation GridItem
+ (instancetype)itemColor:(UIColor *) color itemCount:(NSInteger) count {
    GridItem *item = [GridItem new];
    item.color = color;
    item.itemCount = count;
    return item;
}
@end


@interface GridItem (Extend)<IGListDiffable>
@end
@implementation GridItem(Extend)
- (id<NSObject>)diffIdentifier {
    return self;
}
- (BOOL)isEqualToDiffableObject:(id<IGListDiffable>)object {
    if (self == object) {
        return YES;
    }
    return [self isEqual:object];
}
@end


@interface GridItemSectionController()
@property (nonatomic, strong) GridItem *item;
@end

@implementation GridItemSectionController

- (instancetype)init {
    if (self = [super init]) {
        self.minimumLineSpacing = 4;
//        self.minimumInteritemSpacing = 4;
    }
    return self;
}

- (NSInteger)numberOfItems {
    return self.item.itemCount;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat width = self.collectionContext.containerSize.width;
    if (self.isFull) {
        width = width/2.f - 4;
    }
    return CGSizeMake(width, 100);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    CenterLabelCell *cell = [self.collectionContext dequeueReusableCellOfClass:[CenterLabelCell class] forSectionController:self atIndex:index];
    [cell.contentView setBackgroundColor:self.item.color];
    cell.text = [@(index) stringValue];
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.item = object;
}

@end


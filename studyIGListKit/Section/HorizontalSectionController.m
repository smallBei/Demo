//
//  HorizontalSectionController.m
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/14.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import "HorizontalSectionController.h"
#import "EmbaddedSectionController.h"
#import "EmbeddedCell.h"
@interface HorizontalSectionController() <IGListAdapterDataSource>
@property (nonatomic, strong) NSNumber *number;
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) NSMutableArray *items;
@end

@implementation HorizontalSectionController

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 100);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    EmbeddedCell *cell = [self.collectionContext dequeueReusableCellOfClass:[EmbeddedCell class] forSectionController:self atIndex:index];
    self.adapter.collectionView = cell.collectionView;
    return cell;
}
- (void)didUpdateToObject:(id)object {
    self.number = object;
}

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.items;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    return [EmbaddedSectionController new];
}

- (IGListAdapter *)adapter {
    if (nil == _adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self.viewController];
        _adapter.dataSource = self;
    }
    return _adapter;
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

- (void)setNumber:(NSNumber *)number {
    _number = number;
    [self.items removeAllObjects];
    for (NSInteger i = 0; i < [number integerValue]; i += 1) {
        [self.items addObject:@(i)];
    }
}

- (NSMutableArray *)items {
    if (nil == _items) {
        _items = [NSMutableArray array];
    }
    return _items;
}
@end

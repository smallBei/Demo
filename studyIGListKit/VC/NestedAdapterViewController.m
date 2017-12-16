//
//  NestedAdapterViewController.m
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/14.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import "NestedAdapterViewController.h"
#import "LableSectionController.h"
#import "HorizontalSectionController.h"
@interface NestedAdapterViewController ()<IGListAdapterDataSource>
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *items;
@end

@implementation NestedAdapterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
}

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.items;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    if([object isKindOfClass:[NSString class]]) {
        return [LableSectionController new];
    }
    return [HorizontalSectionController new];
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

- (IGListAdapter *)adapter {
    if (nil == _adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self];
    }
    return _adapter;
}
- (UICollectionView *)collectionView {
    if (nil == _collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionView.backgroundColor = [UIColor lightGrayColor];
    }
    return _collectionView;
}

- (NSArray *)items {
    if (nil == _items) {
        _items = @[
                   @"Ridiculus Elit Tellus Purus Aenean",
                   @"Condimentum Sollicitudin Adipiscing",
                   @(14),
                   @"Ligula Ipsum Tristique Parturient Euismod",
                   @"Purus Dapibus Vulputate",
                   @(6),
                   @"Tellus Nibh Ipsum Inceptos",
                   @(2)
                   ];
    }
    return _items;
}
@end


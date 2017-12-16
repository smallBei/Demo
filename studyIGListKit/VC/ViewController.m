//
//  ViewController.m
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/13.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import "ViewController.h"
#import "DemoItem.h"

@interface ViewController ()<IGListAdapterDataSource>
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *items;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Demos";
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
    return [DemoSectionController new];
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
                   [DemoItem itemName:@"Tail Loading"
                            className:NSClassFromString(@"LoadMoreViewController")],
                   [DemoItem itemName:@"Search Autocomplete"
                            className:NSClassFromString(@"SearchViewController")],
                   [DemoItem itemName:@"Mixed Data"
                            className:NSClassFromString(@"MixedDataViewController")],
                   [DemoItem itemName:@"Nested Adapter"
                            className:NSClassFromString(@"NestedAdapterViewController")],
                   [DemoItem itemName:@"Emty View"
                            className:NSClassFromString(@"EmptyViewController")],
                   [DemoItem itemName:@"the cell change 2"
                            className:NSClassFromString(@"One2TwoViewController")],
                   [DemoItem itemName:@"scroll Page"
                            className:NSClassFromString(@"PageBaseVC")]
                   ];
    }
    return _items;
}
@end

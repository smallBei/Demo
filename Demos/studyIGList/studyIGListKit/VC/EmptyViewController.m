//
//  EmptyViewController.m
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/14.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import "EmptyViewController.h"
#import "RemoveSectionController.h"

@interface EmptyViewController ()<IGListAdapterDataSource, RemoveSectionControllerDelegate>
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) UILabel *emtyLabe;
@end

@implementation EmptyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    self.adapter.collectionView = self.collectionView;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onAdd)];
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
}

- (void)onAdd {
    [self.items addObject:@(self.items.count)];
    [self.adapter performUpdatesAnimated:YES completion:nil];
}

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.items;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    RemoveSectionController *section = [RemoveSectionController new];
    section.delegate = self;
    return section;
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return self.emtyLabe;
}


- (void)removeSectionWant2Remove:(RemoveSectionController *)section {
    NSInteger index = [self.adapter sectionForSectionController:section];
    [self.items removeObjectAtIndex:index];
    [self.adapter performUpdatesAnimated:YES completion:nil];
}

- (IGListAdapter *)adapter {
    if (nil == _adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self];
        _adapter.dataSource = self;
    }
    return _adapter;
}

- (UICollectionView *)collectionView {
    if (nil == _collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        [_collectionView setBackgroundColor:[UIColor lightGrayColor]];
    }
    return _collectionView;
}
- (UILabel *)emtyLabe {
    if (nil == _emtyLabe) {
        _emtyLabe = [UILabel new];
        _emtyLabe.textAlignment = NSTextAlignmentCenter;
        _emtyLabe.numberOfLines = 0;
        _emtyLabe.backgroundColor = [UIColor clearColor];
        [_emtyLabe setText:@"No more data!"];
    }
    return _emtyLabe;
}

- (NSMutableArray *)items {
    if (nil == _items) {
        _items = [NSMutableArray array];
    }
    return _items;
}
@end

//
//  MixedDataViewController.m
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/13.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import "MixedDataViewController.h"
#import "ExpandableSectionController.h"
#import "GridItem.h"
#import "UserItem.h"

@interface MixedDataViewController ()<IGListAdapterDataSource>
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSArray *segment;
@property (nonatomic, assign) NSInteger selectedSegmentIndex;
@property (nonatomic, strong) IGListAdapterUpdater *updayer;

@property (nonatomic, assign) BOOL isOne;
@end

@implementation MixedDataViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:self.segment];
    [segment addTarget:self action:@selector(segmentChange:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = segment;
    self.selectedSegmentIndex = 0;
    segment.selectedSegmentIndex = self.selectedSegmentIndex;
    
    [self.view addSubview:self.collectionView];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(onChange)];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
}

- (void)onChange {
    self.isOne = !self.isOne;
    IGListSectionController *section = [self.adapter sectionControllerForObject:_items[0]];
    if ([section isKindOfClass:[GridItemSectionController class]]) {
        ((GridItemSectionController *)section).isFull = self.isOne;
    }

    [self.adapter performUpdatesAnimated:YES completion:nil];
}

- (void)segmentChange:(UISegmentedControl *) segment {
    self.selectedSegmentIndex = segment.selectedSegmentIndex;
}

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.items;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    if ([object isKindOfClass:[NSString class]]) {
        return [ExpandableSectionController new];
    }else if ([object isKindOfClass:[GridItem class]]) {
        GridItemSectionController *grid = [GridItemSectionController new];
        grid.isFull = self.isOne;
        return grid;
    }else {
        return [UserItemSectionController new];
    }
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

- (IGListAdapterUpdater *)updayer {
    if (nil == _updayer) {
        _updayer = [IGListAdapterUpdater new];
    }
    return _updayer;
}

- (IGListAdapter *)adapter {
    if (nil == _adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:self.updayer viewController:self];
    }
    return _adapter;
}
- (UICollectionView *)collectionView {
    if (nil == _collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        //        layout.estimatedItemSize = CGSizeMake(100, 40);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor lightGrayColor];
    }
    return _collectionView;
}

- (NSArray *)items {
    if (nil == _items) {
        _items = @[
                   @"Maecenas faucibus mollis interdum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.",
                   [GridItem itemColor:[UIColor colorWithRed:237/255.0 green:73/255.0 blue:86/255.0 alpha:1] itemCount:16],
                   [UserItem itemPk:2 name:@"Ryan Olson" handle:@"ryanolsonk"],
                   @"Praesent commodo cursus magna, vel scelerisque nisl consectetur et.",
                   [UserItem itemPk:4 name:@"Oliver Rickard" handle:@"ocrickard"],
                   [GridItem itemColor:[UIColor colorWithRed:56/255.0 green:151/255.0 blue:240/255.0 alpha:1] itemCount:5],
                   @"Nullam quis risus eget urna mollis ornare vel eu leo. Praesent commodo cursus magna, vel scelerisque nisl consectetur et.",
                   [UserItem itemPk:3 name:@"Jesse Squires" handle:@"jesse_squires"],
                   [GridItem itemColor:[UIColor colorWithRed:112/255.0 green:192/255.0 blue:80/255.0 alpha:1] itemCount:3],
                   @"Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.",
                   [GridItem itemColor:[UIColor colorWithRed:163/255.0 green:42/255.0 blue:186/255.0 alpha:1] itemCount:7],
                   [UserItem itemPk:1 name:@"Ryan Nystrom" handle:@"_ryannystrom"],
                   ];
    }
    return _items;
}

- (NSArray *)segment {
    if (nil == _segment) {
        _segment = @[@"All",
                     @"Colors",
                     @"Text",
                     @"Users"];
    }
    return _segment;
}

- (void)setSelectedSegmentIndex:(NSInteger)selectedSegmentIndex {
    _selectedSegmentIndex = selectedSegmentIndex;
    switch (selectedSegmentIndex) {
        case 1:
            _items = @[
                       [GridItem itemColor:[UIColor colorWithRed:237/255.0 green:73/255.0 blue:86/255.0 alpha:1] itemCount:16],
                       [GridItem itemColor:[UIColor colorWithRed:56/255.0 green:151/255.0 blue:240/255.0 alpha:1] itemCount:5],
                       [GridItem itemColor:[UIColor colorWithRed:112/255.0 green:192/255.0 blue:80/255.0 alpha:1] itemCount:3],
                       [GridItem itemColor:[UIColor colorWithRed:163/255.0 green:42/255.0 blue:186/255.0 alpha:1] itemCount:7],
                       ];
            break;
        case 2:
            _items = @[
                       @"Maecenas faucibus mollis interdum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.",
                       @"Praesent commodo cursus magna, vel scelerisque nisl consectetur et.",
                       @"Nullam quis risus eget urna mollis ornare vel eu leo. Praesent commodo cursus magna, vel scelerisque nisl consectetur et.",
                       @"Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.",
                       ];
            break;
        case 3:
            _items = @[
                       [UserItem itemPk:2 name:@"Ryan Olson" handle:@"ryanolsonk"],
                       [UserItem itemPk:4 name:@"Oliver Rickard" handle:@"ocrickard"],
                       [UserItem itemPk:3 name:@"Jesse Squires" handle:@"jesse_squires"],
                       [UserItem itemPk:1 name:@"Ryan Nystrom" handle:@"_ryannystrom"],
                       ];
            break;
            
        default:
            _items = @[
                       @"Maecenas faucibus mollis interdum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.",
                       [GridItem itemColor:[UIColor colorWithRed:237/255.0 green:73/255.0 blue:86/255.0 alpha:1] itemCount:16],
                       [UserItem itemPk:2 name:@"Ryan Olson" handle:@"ryanolsonk"],
                       @"Praesent commodo cursus magna, vel scelerisque nisl consectetur et.",
                       [UserItem itemPk:4 name:@"Oliver Rickard" handle:@"ocrickard"],
                       [GridItem itemColor:[UIColor colorWithRed:56/255.0 green:151/255.0 blue:240/255.0 alpha:1] itemCount:5],
                       @"Nullam quis risus eget urna mollis ornare vel eu leo. Praesent commodo cursus magna, vel scelerisque nisl consectetur et.",
                       [UserItem itemPk:3 name:@"Jesse Squires" handle:@"jesse_squires"],
                       [GridItem itemColor:[UIColor colorWithRed:112/255.0 green:192/255.0 blue:80/255.0 alpha:1] itemCount:3],
                       @"Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.",
                       [GridItem itemColor:[UIColor colorWithRed:163/255.0 green:42/255.0 blue:186/255.0 alpha:1] itemCount:7],
                       [UserItem itemPk:1 name:@"Ryan Nystrom" handle:@"_ryannystrom"],
                       ];
            break;
    }
    [self.adapter performUpdatesAnimated:YES completion:nil];
}
@end


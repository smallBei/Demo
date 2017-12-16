//
//  SearchViewController.m
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/13.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchSectionController.h"
#import "LableSectionController.h"

@interface SearchViewController ()<IGListAdapterDataSource, SearchSectionControllerDelegate>
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) NSString *fillterStr;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fillterStr = @"";
    [self.view addSubview:self.collectionView];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
}

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.dataSource;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    if ([object isKindOfClass:[NSNumber class]]) {
        SearchSectionController *search = [SearchSectionController new];
        search.delegate = self;
        return search;
    }
    return [LableSectionController new];
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

#pragma mark - customDelegate
- (void)searchSectionController:(SearchSectionController *) section didChangeStr:(NSString *) str {
    self.fillterStr = str;
    [self.adapter performUpdatesAnimated:YES completion:nil];
}


#pragma mark - getter
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
        NSString *str = @"Humblebrag skateboard tacos viral small batch blue bottle, schlitz fingerstache etsy squid. Listicle tote bag helvetica XOXO literally, meggings cardigan kickstarter roof party deep v selvage scenester venmo truffaut. You probably haven't heard of them fanny pack austin next level 3 wolf moon. Everyday carry offal brunch 8-bit, keytar banjo pinterest leggings hashtag wolf raw denim butcher. Single-origin coffee try-hard echo park neutra, cornhole banh mi meh austin readymade tacos taxidermy pug tattooed. Cold-pressed +1 ethical, four loko cardigan meh forage YOLO health goth sriracha kale chips. Mumblecore cardigan humblebrag, lo-fi typewriter truffaut leggings health goth.";
        
        _items = [str componentsSeparatedByString:@" "];
    }
    return _items;
}

- (NSArray *)dataSource {
    NSMutableArray *data = [NSMutableArray array];
    if ([self.fillterStr isEqualToString:@""]) {
        [data addObject:@(1)];
        [data addObjectsFromArray:_items];
        return [NSArray arrayWithArray:data];
    }
    [data addObject:@(1)];
    [self.items enumerateObjectsUsingBlock:^(NSString* obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([[obj lowercaseString] containsString:[self.fillterStr lowercaseString]]) {
            [data addObject:obj];
        }
    }];
    return [NSArray arrayWithArray:data];
}
@end


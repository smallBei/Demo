//
//  LoadMoreViewController.m
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/13.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import "LoadMoreViewController.h"
#import "SpinnerCell.h"
#import "LableSectionController.h"

@interface LoadMoreViewController ()<IGListAdapterDataSource, UIScrollViewDelegate>
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) NSString *spinToken;
@property (nonatomic, assign) BOOL loading;
@end

@implementation LoadMoreViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
    self.adapter.scrollViewDelegate = self;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
}

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.items;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    if ([object isKindOfClass:[NSString class]] && [object isEqualToString:self.spinToken]) {
        return [SpinnerCell spinnerSectionController];
    }
    return [LableSectionController new];
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    CGFloat distance = scrollView.contentSize.height - (targetContentOffset->y + scrollView.bounds.size.height);
    if (self.loading == NO && distance < 200) {
        self.loading = YES;
        [self.items addObject:self.spinToken];
        [self.adapter performUpdatesAnimated:YES completion:nil];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.loading = NO;
            [self.items removeLastObject];
            for (NSInteger i = 0; i < 5; i += 1) {
                [self.items addObject:[@(self.items.count + i) stringValue]];
            }
            [self.adapter performUpdatesAnimated:YES completion:nil];
        });
    }
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

- (NSMutableArray *)items {
    if (nil == _items) {
        _items = [NSMutableArray arrayWithCapacity:20];
        for(NSInteger i = 0; i < 20; i += 1) {
            [_items addObject:[@(i) stringValue]];
        }
    }
    return _items;
}
- (NSString *)spinToken {
    return @"spinner";
}
@end


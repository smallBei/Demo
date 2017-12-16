//
//  EmbeddedCell.m
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/14.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import "EmbeddedCell.h"
@interface EmbeddedCell()
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation EmbeddedCell
- (void)layoutSubviews {
    [super layoutSubviews];
    self.collectionView.frame = self.contentView.bounds;
}

- (UICollectionView *)collectionView {
    if (nil == _collectionView) {
        IGListCollectionViewLayout *layout = [[IGListCollectionViewLayout alloc] initWithStickyHeaders:YES scrollDirection:UICollectionViewScrollDirectionHorizontal topContentInset:20 stretchToEdge:NO];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor lightGrayColor];
        _collectionView.alwaysBounceVertical = NO;
        _collectionView.alwaysBounceHorizontal = NO;
        [self.contentView addSubview:_collectionView];
    }
    return _collectionView;
}
@end

//
//  SpinnerCell.m
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/13.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import "SpinnerCell.h"
@interface SpinnerCell()
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;
@end

@implementation SpinnerCell
+(IGListSingleSectionController *)spinnerSectionController {
    
    return [[IGListSingleSectionController alloc] initWithCellClass:self configureBlock:^(id  _Nonnull item, __kindof SpinnerCell * _Nonnull cell) {
        [cell.activityIndicator startAnimating];
    } sizeBlock:^CGSize(id  _Nonnull item, id<IGListCollectionContext>  _Nullable collectionContext) {
        return CGSizeMake(collectionContext.containerSize.width, 100);
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.activityIndicator.frame = self.contentView.bounds;
    self.activityIndicator.center = self.contentView.center;
}

- (UIActivityIndicatorView *)activityIndicator {
    if (nil == _activityIndicator) {
        _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [self.contentView addSubview:_activityIndicator];
    }
    return _activityIndicator;
}
@end

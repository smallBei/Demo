//
//  SearchCell.m
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/13.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import "SearchCell.h"

@interface SearchCell()
@property (nonatomic, strong) UISearchBar *searchBar;
@end

@implementation SearchCell


- (void)layoutSubviews {
    [super layoutSubviews];
    self.searchBar.frame = self.contentView.bounds;
    self.searchBar.center = self.contentView.center;
}

- (UISearchBar *)searchBar {
    if (nil == _searchBar) {
        _searchBar = [UISearchBar new];
        [self.contentView addSubview:_searchBar];
    }
    return _searchBar;
}
@end

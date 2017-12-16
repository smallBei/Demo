//
//  SearchSectionController.m
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/13.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import "SearchSectionController.h"
#import "SearchCell.h"
@interface SearchSectionController()<IGListScrollDelegate, UISearchBarDelegate>

@end

@implementation SearchSectionController
- (instancetype)init {
    if (self = [super init]) {
        self.scrollDelegate = self;
    }
    return self;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 44);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    SearchCell *cell = [self.collectionContext dequeueReusableCellOfClass:[SearchCell class]
                                                     forSectionController:self atIndex:index];
    cell.searchBar.delegate = self;
    return cell;
}


- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    if ([self.delegate respondsToSelector:@selector(searchSectionController:didChangeStr:)]) {
        [self.delegate searchSectionController:self didChangeStr:searchBar.text];
    }
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if ([self.delegate respondsToSelector:@selector(searchSectionController:didChangeStr:)]) {
        [self.delegate searchSectionController:self didChangeStr:searchText];
    }
}

- (void)listAdapter:(nonnull IGListAdapter *)listAdapter didScrollSectionController:(nonnull IGListSectionController *)sectionController {
    if ([self.collectionContext cellForItemAtIndex:0 sectionController:self]) {
        SearchCell *cell = [self.collectionContext cellForItemAtIndex:0 sectionController:self];
        [cell.searchBar resignFirstResponder];
    }
}

- (void)listAdapter:(nonnull IGListAdapter *)listAdapter willBeginDraggingSectionController:(nonnull IGListSectionController *)sectionController {}
- (void)listAdapter:(nonnull IGListAdapter *)listAdapter didEndDraggingSectionController:(nonnull IGListSectionController *)sectionController willDecelerate:(BOOL)decelerate {}
@end





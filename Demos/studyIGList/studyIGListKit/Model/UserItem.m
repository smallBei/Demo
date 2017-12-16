//
//  UserItem.m
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/13.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import "UserItem.h"
#import "DetailLabelCell.h"

@implementation UserItem
+ (instancetype)itemPk:(NSInteger) pk name:(NSString *) name handle:(NSString *) handle {
    UserItem *item = [UserItem new];
    item.pk = pk;
    item.name = name;
    item.handle = handle;
    return item;
}
@end

@interface UserItem (Extend)<IGListDiffable>
@end
@implementation UserItem(Extend)
- (id<NSObject>)diffIdentifier {
    return self;
}
- (BOOL)isEqualToDiffableObject:(id<IGListDiffable>)object {
    if (self == object) {
        return YES;
    }
    return [self isEqual:object];
}
@end

@interface UserItemSectionController()
@property (nonatomic, strong) UserItem *object;
@end

@implementation UserItemSectionController

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 55);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    DetailLabelCell *cell = [self.collectionContext dequeueReusableCellOfClass:[DetailLabelCell class] forSectionController:self atIndex:index];
    cell.title = self.object.name;
    cell.subTitle = self.object.handle;
    return cell;
}
- (void)didUpdateToObject:(id)object {
    self.object = object;
}

@end


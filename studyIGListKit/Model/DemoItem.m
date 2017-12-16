//
//  DemoItem.m
//  TestListKit
//
//  Created by youzhenbei on 2017/12/12.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import "DemoItem.h"
#import "DemoLableCell.h"

@interface DemoItem()<IGListDiffable>
@end

@implementation DemoItem
+ (instancetype)itemName:(NSString *) name className:(Class) className {
    return [DemoItem itemName:name className:className identifier:nil];
}

+ (instancetype)itemName:(NSString *) name
               className:(Class) className
              identifier:(NSString *) identifier{
    DemoItem *item = [DemoItem new];
    item.name = name;
    item.className = className;
    item.controllerIdentifier = identifier;
    return item;
}

- (id<NSObject>)diffIdentifier {
    return self.name;
}

- (BOOL)isEqualToDiffableObject:(DemoItem<IGListDiffable> *)object {
    if (self == object) {
        return YES;
    }
    
    if ([self isKindOfClass:[DemoItem class]]) {
        return self.className == object.className && [self.controllerIdentifier isEqualToString:object.controllerIdentifier];
    } else {
        return NO;
    }
}

@end


@interface DemoSectionController()
@property (nonatomic, strong) DemoItem *model;
@end

@implementation DemoSectionController

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 55);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    DemoLableCell *cell = [self.collectionContext dequeueReusableCellOfClass:[DemoLableCell class] forSectionController:self atIndex:index];
    cell.text = self.model.name;
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.model = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    Class class = self.model.className;
    UIViewController *vc = [class new];
    vc.title = self.model.name;
    [self.viewController.navigationController pushViewController:vc animated:YES];
    
}
@end















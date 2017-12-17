//
//  One2TwoViewController.m
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/14.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import "One2TwoViewController.h"
#import "SwipeMenuView.h"
#import "SwipeMenuViewConfig.h"
@interface One2TwoViewController ()<SwipeMenuViewDataSource, SwipeMenuViewDelegate>
@property (nonatomic, strong) SwipeMenuView *menuView;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSArray *contentsInfo;
@property (nonatomic, strong) SwipeMenuViewConfig *config;
@property (nonatomic, strong) NSMutableArray *arrayM;
@end

@implementation One2TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    self.arrayM = [NSMutableArray array];
    
    self.config = [SwipeMenuViewConfig new];
    self.config.selectFont = 18;
    self.config.textFont = 18;
    self.config.margin = 15;
    self.config.textColor = [UIColor greenColor];
    self.config.selectedTextColor = [UIColor blackColor];
    
    self.config.tableViewHeight = 55;
    self.config.contenViewHeight = 350;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.menuView reload:self.config];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGRect frame = self.view.bounds;
    frame.origin.y = 100;
    self.menuView.frame = frame;
}

- (NSInteger)numberOfPages:(SwipeMenuView *) swipeMenuView {
    return self.titles.count;
}

- (NSString *)swipeMenuView:(SwipeMenuView *) swipeMenuView titleForPageAt:(NSInteger) index {
    return self.titles[index];
}

- (UIView *)swipeMenuView:(SwipeMenuView *)swipeMenuView viewControllerForPageAt:(NSInteger) index {
    UIViewController *vc = [[UIViewController alloc] init];
    [self.arrayM addObject:vc];
    [vc.view setBackgroundColor:self.contentsInfo[index]];
    return vc.view;
}

- (void)swipeMenuView:(SwipeMenuView *) swipeMenuView willChangeIndexFrom:(NSInteger) fromIndex toIndex:(NSInteger) toIndex {
    NSLog(@"%s   \n willChangeIndexFrom fromIndex = %zd  toIndex = %zd", __func__, fromIndex, toIndex);
}

- (void)swipeMenuView:(SwipeMenuView *) swipeMenuView didChangeIndexFrom:(NSInteger) fromIndex toIndex:(NSInteger) toIndex {
    NSLog(@"%s   \n didChangeIndexFrom fromIndex = %zd  toIndex = %zd", __func__, fromIndex, toIndex);
}


- (SwipeMenuView *)menuView {
    if (nil == _menuView) {
        _menuView = [[SwipeMenuView alloc] init];
        _menuView.dataSource = self;
        _menuView.delegate = self;
        [self.view addSubview:_menuView];
    }
    return _menuView;
}
- (NSArray *)titles {
    if (nil == _titles) {
        _titles = @[
                    @"aaaaaaaaa",
                    @"bbbbbb",
                    @"ccccccccc",
                    @"ddddddddddddd",
                    @"eeeeeeeee",
                    ];
    }
    return _titles;
}

- (NSArray *)contentsInfo {
    if (nil == _contentsInfo) {
        _contentsInfo = @[
                          [UIColor redColor],
                          [UIColor blueColor],
                          [UIColor purpleColor],
                          [UIColor yellowColor],
                          [UIColor greenColor],
                          ];
    }
    return _contentsInfo;
}
@end

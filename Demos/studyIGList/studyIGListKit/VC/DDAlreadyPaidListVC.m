//
//  DDAlreadyPaidListVC.m
//  LuoJiFM-IOS
//
//  Created by youzhenbei on 2017/12/18.
//  Copyright © 2017年 luojilab. All rights reserved.
//

#import "DDAlreadyPaidListVC.h"

@interface DDAlreadyPaidListVC ()<UITableViewDataSource, UIScrollViewDelegate, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tab;
@end

@implementation DDAlreadyPaidListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tab.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    self.tab.bounces = NO;
    [self.view addSubview:self.tab];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.tab.frame = self.view.bounds;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"UITableViewCell"];
    }
    [cell.contentView setBackgroundColor:[UIColor yellowColor]];
    return cell;
}

- (UITableView *)tab {
    if (nil == _tab) {
        UITableView *tab = [[UITableView alloc] initWithFrame:CGRectZero style:0];
        tab.dataSource = self;
        _tab = tab;
    }
    return _tab;
}
@end

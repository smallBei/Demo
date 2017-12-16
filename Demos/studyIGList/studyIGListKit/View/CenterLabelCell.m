//
//  CenterLabelCell.m
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/13.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import "CenterLabelCell.h"

@interface CenterLabelCell()
@property (nonatomic, strong) UILabel *titleLable;
@end

@implementation CenterLabelCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    [self.contentView addSubview:self.titleLable];
    [self.contentView setBackgroundColor:[UIColor whiteColor]];
    [self initSubViewMasorny];
}

- (void)initSubViewMasorny {
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.titleLable.superview).offset(15.f);
        make.bottom.right.equalTo(self.titleLable.superview).offset(-15.f);
    }];
}

- (void)setText:(NSString *)text {
    [_titleLable setText:text];
}
- (NSString *)text {
    return _titleLable.text;
}

- (UILabel *)titleLable {
    if (nil == _titleLable) {
        _titleLable = [UILabel new];
        _titleLable.numberOfLines = 0;
        _titleLable.textAlignment = NSTextAlignmentCenter;
        [_titleLable setTextColor:[UIColor blackColor]];
        _titleLable.font = [UIFont boldSystemFontOfSize:18];
    }
    return _titleLable;
}
@end

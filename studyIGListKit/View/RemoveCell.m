//
//  RemoveCell.m
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/14.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import "RemoveCell.h"

@interface RemoveCell()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *btn;
@end

@implementation RemoveCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self.contentView setBackgroundColor:[UIColor whiteColor]];
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    [self.contentView addSubview:self.label];
    [self.contentView addSubview:self.btn];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15.f);
        make.centerY.equalTo(self);
    }];
    
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(-15);
        make.height.equalTo(self);
    }];
}


- (void)onButton {
    if ([self.delegate respondsToSelector:@selector(removeCellEvent:)]) {
        [self.delegate removeCellEvent:self];
    }
}

- (void)setTest:(NSString *)test {
    [self.label setText:test];
}
- (NSString *)test {
    return self.label.text;
}

- (UILabel *)label {
    if (nil == _label) {
        _label = [UILabel new];
    }
    return _label;
}
- (UIButton *)btn {
    if (nil == _btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn setTitle:@"Remove" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(onButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}

@end

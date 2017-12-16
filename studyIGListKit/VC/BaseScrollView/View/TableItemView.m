//
//  TableItemView.m
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/15.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import "TableItemView.h"
#import "SwipeMenuViewConfig.h"
@interface TableItemView()
@end

@implementation TableItemView
- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)setText:(NSString *)text {
    [self.titleLabel setText:text];
}
- (NSString *)text {
    return self.titleLabel.text;
}

- (UILabel *)titleLabel {
    if (nil == _titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.right.equalTo(self);
        }];
    }
    return _titleLabel;
}
- (void)setIsSelected:(BOOL)isSelected {
    _isSelected = isSelected;
    [self.titleLabel setTextColor:isSelected ? self.config.selectedTextColor : self.config.textColor];
    [self.titleLabel setFont:isSelected ? [UIFont systemFontOfSize:self.config.selectFont] : [UIFont systemFontOfSize:self.config.textFont]];
    
}
@end


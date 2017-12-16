//
//  DemoLableCell.m
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/13.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import "DemoLableCell.h"

@interface DemoLableCell()
@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UIView *separator;
@end

@implementation DemoLableCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    [self.contentView addSubview:self.titleLable];
    [self.contentView addSubview:self.separator];
    [self.contentView setBackgroundColor:[UIColor whiteColor]];
    [self initSubViewMasorny];
}

- (void)initSubViewMasorny {
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.titleLable.superview).offset(15.f);
        make.bottom.right.equalTo(self.titleLable.superview).offset(-15.f);
    }];
    
    [self.separator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLable.superview).offset(10.f);
        make.bottom.right.equalTo(self.titleLable.superview);
        make.height.mas_equalTo(0.5f);
    }];
}

- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    CGSize size = [self systemLayoutSizeFittingSize:layoutAttributes.size];
    CGRect frame = layoutAttributes.frame;
    frame.size.height = size.height;
    layoutAttributes.frame = frame;
    
    return layoutAttributes;
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
        [_titleLable setTextColor:[UIColor blackColor]];
        _titleLable.font = [UIFont systemFontOfSize:17];
    }
    return _titleLable;
}

- (UIView *)separator {
    if (nil == _separator) {
        _separator = [UIView new];
        [_separator setBackgroundColor:[UIColor colorWithRed:200/255.f green:200/255.f blue:200/255.f alpha:1]];
    }
    return _separator;
}
@end

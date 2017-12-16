//
//  DetailLabelCell.m
//  studyIGListKit
//
//  Created by youzhenbei on 2017/12/13.
//  Copyright © 2017年 youzhenbei. All rights reserved.
//

#import "DetailLabelCell.h"

@interface DetailLabelCell()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@end

@implementation DetailLabelCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self.contentView setBackgroundColor:[UIColor whiteColor]];
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.detailLabel];
    [self initSubViewMasnory];
}

- (void)initSubViewMasnory {
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLabel.frame = self.contentView.bounds;
    self.detailLabel.frame = self.contentView.bounds;
}

#pragma mark - getter
- (void)setTitle:(NSString *)title {
    [self.titleLabel setText:title];
}
- (NSString *)title {
    return self.titleLabel.text;
}

- (void)setSubTitle:(NSString *)subTitle {
    [self.detailLabel setText:subTitle];
}
- (NSString *)subTitle {
    return self.detailLabel.text;
}

- (UILabel *)titleLabel {
    if (nil == _titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont systemFontOfSize:19];
        _titleLabel.textColor = [UIColor darkTextColor];
    }
    return _titleLabel;
}

-(UILabel *)detailLabel {
    if (nil == _detailLabel) {
        _detailLabel = [UILabel new];
        _detailLabel.textAlignment = NSTextAlignmentRight;
        _detailLabel.font = [UIFont systemFontOfSize:17];
        _detailLabel.textColor = [UIColor darkTextColor];
    }
    return _detailLabel;
}
@end

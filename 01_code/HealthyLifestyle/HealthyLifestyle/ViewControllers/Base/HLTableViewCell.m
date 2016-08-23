//
//  XYTableViewCell.m
//  ZhaoQiPei
//
//  Created by 找汽配 on 16/8/11.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "HLTableViewCell.h"

@interface HLTableViewCell ()



@end

@implementation HLTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initTableViewCell];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self initTableViewCell];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self reloadLineFrame];
}

- (void)initTableViewCell {
    _lineStyle = HLTableViewCellLineStyleNone;
    _lineColor = [UIColor colorWithRed:225/255.0f green:225/255.0f blue:225/255.0f alpha:1.0f];
    _lineEdgeInsets = UIEdgeInsetsZero;
}

- (void)reloadLineFrame {
    if (_headerLine) {
        _headerLine.frame = CGRectMake(_lineEdgeInsets.left,
                                       _lineEdgeInsets.top,
                                       CGRectGetWidth(_headerLine.superview.frame) - _lineEdgeInsets.left - _lineEdgeInsets.right,
                                       0.5);
    }
    if (_footerLine) {
        _footerLine.frame = CGRectMake(_lineEdgeInsets.left,
                                       CGRectGetHeight(_footerLine.superview.frame) - _lineEdgeInsets.bottom - 0.5,
                                       CGRectGetWidth(_footerLine.superview.frame) - _lineEdgeInsets.left - _lineEdgeInsets.right,
                                       0.5);
    }
}

- (void)reloadData:(id)entity {
    
}

#pragma mark - Setter

- (void)setLineStyle:(HLTableViewCellLineStyle)lineStyle {
    if (_lineStyle != lineStyle) {
        _lineStyle = lineStyle;
        if (lineStyle == HLTableViewCellLineStyleHeader) {
            if (!_headerLine) {
                _headerLine = [[UIView alloc] init];
                _headerLine.backgroundColor = self.lineColor;
                [self addSubview:_headerLine];
            }
            if (_footerLine) {
                [_footerLine removeFromSuperview];
                _footerLine = nil;
            }
        } else if (lineStyle == HLTableViewCellLineStyleFooter) {
            if (_headerLine) {
                [_headerLine removeFromSuperview];
                _headerLine = nil;
            }
            if (!_footerLine) {
                _footerLine = [[UIView alloc] init];
                _footerLine.backgroundColor = self.lineColor;
                [self addSubview:_footerLine];
            }
        } else if (lineStyle == HLTableViewCellLineStyleBoth) {
            if (!_headerLine) {
                _headerLine = [[UIView alloc] init];
                _headerLine.backgroundColor = self.lineColor;
                [self addSubview:_headerLine];
            }
            if (!_footerLine) {
                _footerLine = [[UIView alloc] init];
                _footerLine.backgroundColor = self.lineColor;
                [self addSubview:_footerLine];
            }
        } else {
            if (_headerLine) {
                [_headerLine removeFromSuperview];
                _headerLine = nil;
            }
            if (_footerLine) {
                [_footerLine removeFromSuperview];
                _footerLine = nil;
            }
        }
    }
}

- (void)setLineColor:(UIColor *)lineColor {
    if (_lineColor != lineColor) {
        _lineColor = lineColor;
        if (_headerLine) {
            _headerLine.backgroundColor = lineColor;
        }
        if (_footerLine) {
            _footerLine.backgroundColor = lineColor;
        }
    }
}

- (void)setLineEdgeInsets:(UIEdgeInsets)lineEdgeInsets {
    if (!UIEdgeInsetsEqualToEdgeInsets(_lineEdgeInsets, lineEdgeInsets)) {
        _lineEdgeInsets = lineEdgeInsets;

        [self reloadLineFrame];
    }
}

@end

//
//  AcupointCategoryListTableViewCell.m
//  HealthyLifestyle
//
//  Created by 找汽配 on 16/7/2.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "AcupointTableViewCell.h"

@interface AcupointTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel * titleLabel;

@property (nonatomic, weak) UIView * bottomLineView;

@end

@implementation AcupointTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.bottomLineView.frame = CGRectMake(0,
                                           CGRectGetHeight(self.bottomLineView.superview.frame) - 0.5,
                                           CGRectGetWidth(self.bottomLineView.superview.frame),
                                           0.5);
}

- (void)reloadData:(id)entity {
    self.titleLabel.text = entity;
}

- (UIView *)bottomLineView {
    if (!_bottomLineView) {
        UIView * bottomLineView = [[UIView alloc] init];
        bottomLineView.backgroundColor = COLOR_GRAY_LINE;
        _bottomLineView = bottomLineView;
        [self addSubview:bottomLineView];
    }
    return _bottomLineView;
}

@end

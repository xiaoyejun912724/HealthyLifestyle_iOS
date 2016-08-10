//
//  FunctionTableViewCell.m
//  HealthyLifestyle
//
//  Created by 找汽配 on 16/7/11.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "FunctionTableViewCell.h"
#import "FunctionModel.h"

@interface FunctionTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel * titleLabel;

@end

@implementation FunctionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)reloadData:(id)entity {
    FunctionModel * model = entity;
    self.titleLabel.text = model.name;
}

@end

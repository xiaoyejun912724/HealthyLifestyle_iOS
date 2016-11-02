//
//  AcupointCategoryListTableViewCell.m
//  HealthyLifestyle
//
//  Created by 找汽配 on 16/7/2.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "FavoriteTableViewCell.h"
#import "AcupointModel.h"

@interface FavoriteTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel * titleLabel;

@end

@implementation FavoriteTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.lineStyle = HLTableViewCellLineStyleFooter;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)reloadData:(id)entity {
    AcupointModel * model = entity;
    self.titleLabel.text = [NSString stringWithFormat:@"%@ %@", model.cnName, model.acupointID];
}

@end

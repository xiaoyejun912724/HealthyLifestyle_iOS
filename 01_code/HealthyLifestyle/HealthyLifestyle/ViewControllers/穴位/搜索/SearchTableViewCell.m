//
//  AcupointCategoryListTableViewCell.m
//  HealthyLifestyle
//
//  Created by 找汽配 on 16/7/2.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "SearchTableViewCell.h"
#import "AcupointModel.h"

@interface SearchTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel * titleLabel;

@end

@implementation SearchTableViewCell

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
    
    NSArray * languages = [NSLocale preferredLanguages];
    if ([[languages firstObject] rangeOfString:@"zh-Hans"].location != NSNotFound) {
        self.titleLabel.text = model.cnName;
    } else {
        self.titleLabel.text = [NSString stringWithFormat:@"%@ %@", model.code ?: @"", model.pinyin ?: @""];
    }
}

@end

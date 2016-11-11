//
//  AcupointCategoryListTableViewCell.m
//  HealthyLifestyle
//
//  Created by 找汽配 on 16/7/2.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "AcupointTableViewCell.h"
#import "NSString+HL.h"
#import "AcupointModel.h"

@interface AcupointTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel * titleLabel;
@property (weak, nonatomic) IBOutlet UILabel * positionLabel;
@property (weak, nonatomic) IBOutlet UILabel * indicationLabel;
@property (weak, nonatomic) IBOutlet UILabel * cooperationLabel;
@property (weak, nonatomic) IBOutlet UILabel * acupunctureLabel;

@end

@implementation AcupointTableViewCell

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
    
    if (!model.plainPosition) {
        if (model.position) {
            model.plainPosition = [NSString stringWithHTML:model.position];
        }
    }
    self.positionLabel.text = [NSString stringWithFormat:@"［定位］%@", model.plainPosition ?: @""];
    if (!model.plainIndication) {
        if (model.indication) {
            model.plainIndication = [NSString stringWithHTML:model.indication];
        }
    }
    self.indicationLabel.text = [NSString stringWithFormat:@"［主治］%@", model.plainIndication ?: @""];
    if (!model.plainCompatibility) {
        if (model.compatibility) {
            model.plainCompatibility = [NSString stringWithHTML:model.compatibility];
        }
    }
    self.cooperationLabel.text = [NSString stringWithFormat:@"［配伍］%@", model.plainCompatibility ?: @""];
    if (!model.plainAcupuncture) {
        if (model.acupuncture) {
            model.plainAcupuncture = [NSString stringWithHTML:model.acupuncture];
        }
    }
    self.acupunctureLabel.text = [NSString stringWithFormat:@"［针灸］%@", model.plainAcupuncture ?: @""];
}

@end

//
//  EditGoodsPositionListViewCell.m
//  PeiZhuShou
//
//  Created by 找汽配 on 16/9/28.
//  Copyright © 2016年 XiangYun. All rights reserved.
//

#import "HLNavigationSelectViewCell.h"
#import "HLNavigationSelectAction.h"

@interface HLNavigationSelectViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation HLNavigationSelectViewCell

+ (HLNavigationSelectViewCell *)cell {
    return [[[NSBundle mainBundle] loadNibNamed:@"HLNavigationSelectViewCell" owner:self options:nil] firstObject];
}

- (void)awakeFromNib {
    [super awakeFromNib];

    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(40);
    }];
}

- (IBAction)selectButtonTouchUpInside {
    if (self.action.handler) {
        void(^handler)(HLNavigationSelectAction *) = self.action.handler;
        handler(self.action);
    }
}

- (void)setAction:(HLNavigationSelectAction *)action {
    _action = action;
    self.titleLabel.text = action.title;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

//
//  EditGoodsPositionListViewCell.h
//  PeiZhuShou
//
//  Created by 找汽配 on 16/9/28.
//  Copyright © 2016年 XiangYun. All rights reserved.
//

#import "XYListViewCell.h"

@class HLNavigationSelectAction;

@interface HLNavigationSelectViewCell : XYListViewCell

@property (nonatomic, weak) HLNavigationSelectAction * action;

+ (HLNavigationSelectViewCell *)cell;

@end

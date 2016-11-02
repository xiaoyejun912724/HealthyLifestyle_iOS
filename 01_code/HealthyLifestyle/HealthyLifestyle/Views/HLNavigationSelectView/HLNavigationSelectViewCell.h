//
//  EditGoodsPositionListViewCell.h
//  PeiZhuShou
//
//  Created by 找汽配 on 16/9/28.
//  Copyright © 2016年 XiangYun. All rights reserved.
//

#import "XYListViewCell.h"

@class ReservoirModel;

@interface EditReservoirListViewCell : XYListViewCell

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (nonatomic, strong) ReservoirModel * reservoirModel;

+ (EditReservoirListViewCell *)cell;


@end

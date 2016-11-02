//
//  EditReservoirStorageView.h
//  PeiZhuShou
//
//  Created by 找汽配 on 16/9/27.
//  Copyright © 2016年 XiangYun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYListViewCell.h"

@interface XYListView : UIView

@property (nonatomic, strong) NSMutableArray * cellList;
@property (nonatomic, getter = isEnabled) BOOL enabled;


- (void)addCell:(XYListViewCell *)cell;
- (void)addCellList:(NSArray *)cellList;

@end

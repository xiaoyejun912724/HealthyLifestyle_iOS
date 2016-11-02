//
//  EditReservoirStorageViewCell.h
//  PeiZhuShou
//
//  Created by 找汽配 on 16/9/27.
//  Copyright © 2016年 XiangYun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XYListViewCellDelegate;

@interface XYListViewCell : UIView

@property (nonatomic, getter = isEnabled) BOOL enabled;
@property (nonatomic, weak) id<XYListViewCellDelegate> delegate;

@end

@protocol XYListViewCellDelegate <NSObject>

- (void)listViewCellDidDelete:(XYListViewCell *)cell;

@end

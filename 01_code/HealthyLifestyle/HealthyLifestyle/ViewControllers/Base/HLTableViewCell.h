//
//  XYTableViewCell.h
//  ZhaoQiPei
//
//  Created by 找汽配 on 16/8/11.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HLTableViewCellLineStyle) {
    HLTableViewCellLineStyleNone,
    HLTableViewCellLineStyleHeader,
    HLTableViewCellLineStyleFooter,
    HLTableViewCellLineStyleBoth
};

@interface HLTableViewCell : UITableViewCell

@property (nonatomic, assign) HLTableViewCellLineStyle lineStyle;
@property (nonatomic, strong) UIColor * lineColor;
@property (nonatomic) UIEdgeInsets lineEdgeInsets;

@property (nonatomic, readonly, strong) UIView * headerLine;
@property (nonatomic, readonly, strong) UIView * footerLine;

- (void)reloadData:(id)entity;

@end

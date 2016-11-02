//
//  EditReservoirStorageView.m
//  PeiZhuShou
//
//  Created by 找汽配 on 16/9/27.
//  Copyright © 2016年 XiangYun. All rights reserved.
//

#import "XYListView.h"
#import "XYListViewCell.h"

@interface XYListView () <XYListViewCellDelegate>



@end

@implementation XYListView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.cellList = [NSMutableArray array];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.cellList = [NSMutableArray array];
}

#pragma mark - Action

- (void)addCell:(XYListViewCell *)cell {
    cell.enabled = self.enabled;
    cell.delegate = self;
    [self addSubview:cell];
    [self.cellList addObject:cell];
    [self reloadConstraints];
}

- (void)addCellList:(NSArray *)cellList {
    [cellList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        XYListViewCell * cell = obj;
        cell.enabled = self.enabled;
        cell.delegate = self;
        [self addSubview:cell];
        [self.cellList addObject:cell];
    }];
    [self reloadConstraints];
}

- (void)reloadConstraints {
    [self removeConstraints:self.constraints];
    [self.cellList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        XYListViewCell * cell = obj;
        [cell mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(cell.superview.mas_leading);
            make.trailing.equalTo(cell.superview.mas_trailing);
            if (idx == 0) {
                make.top.equalTo(cell.superview.mas_top);
            } else {
                XYListViewCell * prevCell = self.cellList[idx - 1];
                make.top.equalTo(prevCell.mas_bottom);
            }
        }];
    }];
    XYListViewCell * lastCell = [self.cellList lastObject];
    if (lastCell) {
        [lastCell mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(lastCell.superview.mas_bottom);
        }];
    } else {
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
    }
}

#pragma mark - Setup


#pragma mark - Setter

- (void)setEnabled:(BOOL)enabled {
    _enabled = enabled;
    [self.cellList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        XYListViewCell * cell = obj;
        cell.enabled = enabled;
    }];
}

#pragma mark - EditReservoirStorageViewCellDelegate

- (void)listViewCellDidDelete:(XYListViewCell *)cell {
    [cell removeFromSuperview];
    [self.cellList removeObject:cell];
    [self reloadConstraints];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

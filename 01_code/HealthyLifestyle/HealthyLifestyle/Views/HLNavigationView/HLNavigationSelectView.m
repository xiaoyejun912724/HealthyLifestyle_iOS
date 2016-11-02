//
//  HLSelectView.m
//  HealthyLifestyle
//
//  Created by 找汽配 on 2016/11/1.
//  Copyright © 2016年 HealthyLifestyle. All rights reserved.
//

#import "HLNavigationSelectView.h"
#import "HLNavigationSelectViewCell.h"

@interface HLNavigationSelectView ()

@property (nonatomic, strong) NSMutableArray <HLNavigationSelectAction *>* actions;

@end

@implementation HLNavigationSelectView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.actions = [NSMutableArray array];
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
    }
    return self;
}

- (void)addAction:(HLNavigationSelectAction *)action {
    [self.actions addObject:action];
}

- (void)reloadActions {
    NSMutableArray * mArray = [NSMutableArray arrayWithCapacity:self.actions.count];
    [self.actions enumerateObjectsUsingBlock:^(HLNavigationSelectAction * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        HLNavigationSelectViewCell * cell = [HLNavigationSelectViewCell cell];
        cell.action = obj;
        [mArray addObject:cell];
    }];
    [self addCellList:[mArray copy]];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end


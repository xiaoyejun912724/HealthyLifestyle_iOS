//
//  HLNavigationView.m
//  HealthyLifestyle
//
//  Created by 找汽配 on 2016/11/1.
//  Copyright © 2016年 HealthyLifestyle. All rights reserved.
//

#import "HLNavigationView.h"
#import "HLNavigationSelectView.h"
#import "XYEnum.h"

@interface HLNavigationView ()

@property (nonatomic, weak) HLNavigationSelectView * selectView;

@end

@implementation HLNavigationView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupView];
    }
    return self;
}

- (HLNavigationSelectAction *)actionWithType:(HLNavigationSelectActionType)type {
    if (type == HLNavigationSelectActionTypeSearch) {
        HLNavigationSelectAction * action = [HLNavigationSelectAction actionWithTitle:@"搜索" handler:^(HLNavigationSelectAction * action) {
            [self hideButtonTouchUpInside];
            if (self.delegate && [self.delegate respondsToSelector:@selector(navigationViewDidSearch)]) {
                [self.delegate navigationViewDidSearch];
            }
        }];
        return action;
    } else if (type == HLNavigationSelectActionTypeCollect) {
        HLNavigationSelectAction * action = [HLNavigationSelectAction actionWithTitle:@"收藏" handler:^(HLNavigationSelectAction * action) {
            [self hideButtonTouchUpInside];
            if (self.delegate && [self.delegate respondsToSelector:@selector(navigationViewDidCollect)]) {
                [self.delegate navigationViewDidCollect];
            }
        }];
        return action;
    } else {
        return nil;
    }
}

#pragma mark - Button Action

- (void)hideButtonTouchUpInside {
    [self removeFromSuperview];
}

#pragma mark - Setup

- (void)setupView {
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(hideButtonTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(button.superview);
    }];
    
    HLNavigationSelectView * view = [[HLNavigationSelectView alloc] init];
    self.selectView = view;
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(view.superview.mas_width).multipliedBy(0.2);
        make.top.equalTo(view.superview).mas_equalTo(64);
        make.trailing.equalTo(view.superview.mas_trailing);
    }];
}

#pragma mark - Setter

- (void)setActionTypes:(NSArray *)actionTypes {
    [actionTypes enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        HLNavigationSelectActionType type = [obj integerValue];
        HLNavigationSelectAction * action = [self actionWithType:type];
        if (action) {
            [self.selectView addAction:action];
        }
    }];
    [self.selectView reloadActions];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

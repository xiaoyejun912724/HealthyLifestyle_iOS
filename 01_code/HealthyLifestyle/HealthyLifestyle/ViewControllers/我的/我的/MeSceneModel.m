//
//  MessageSceneModel.m
//  ZhaoQiPei
//
//  Created by 找汽配 on 16/3/17.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "MeSceneModel.h"

@implementation MeSceneModel

- (void)loadSceneModel {
    [super loadSceneModel];

    self.controllerList = @[[ControllerModel modelWithDict:@{@"title":NSLocalizedString(@"收藏夹", nil),
                                                             @"controller":@"FavoriteViewController"}]];
}

@end

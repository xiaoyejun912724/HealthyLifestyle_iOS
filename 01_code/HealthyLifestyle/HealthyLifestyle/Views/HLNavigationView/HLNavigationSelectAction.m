//
//  HLNavigationSelectAction.m
//  HealthyLifestyle
//
//  Created by 找汽配 on 2016/11/1.
//  Copyright © 2016年 HealthyLifestyle. All rights reserved.
//

#import "HLNavigationSelectAction.h"

@implementation HLNavigationSelectAction

+ (instancetype)actionWithTitle:(NSString *)title handler:(void(^)(HLNavigationSelectAction *))handler {
    HLNavigationSelectAction * action = [[self alloc] init];
    action.title = title;
    action.handler = handler;
    return action;
}

@end

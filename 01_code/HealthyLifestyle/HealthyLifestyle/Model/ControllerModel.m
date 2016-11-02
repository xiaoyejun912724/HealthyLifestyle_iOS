//
//  AreaModel.m
//  ZhaoQiPei
//
//  Created by 找汽配 on 16/3/24.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "ControllerModel.h"

@implementation ControllerModel

+ (instancetype)modelWithDict:(NSDictionary *)dict {
    ControllerModel * model = [[self alloc] init];
    [model setupWithDict:dict];
    return model;
}

- (void)setupWithDict:(NSDictionary *)dict {
    if (dict[@"title"]) {
        self.title = dict[@"title"];
    }
    if (dict[@"controller"]) {
        self.controller = dict[@"controller"];
    }
}

@end

//
//  AreaModel.m
//  ZhaoQiPei
//
//  Created by 找汽配 on 16/3/24.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "MeridianModel.h"

@implementation MeridianModel

+ (instancetype)modelWithDict:(NSDictionary *)dict {
    MeridianModel * model = [[self alloc] init];
    [model setupWithDict:dict];
    return model;
}

- (void)setupWithDict:(NSDictionary *)dict {
    self.meridianId = dict[@"id"];
    self.name = dict[@"name"];
}

@end

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
    if (dict[MERIDIAN_COLUMN_ID] && dict[MERIDIAN_COLUMN_ID] != [NSNull null]) {
        self.meridianID = dict[MERIDIAN_COLUMN_ID];
    }
    if (dict[MERIDIAN_COLUMN_NAME] && dict[MERIDIAN_COLUMN_NAME] != [NSNull null]) {
        self.name = dict[MERIDIAN_COLUMN_NAME];
    }
}

@end

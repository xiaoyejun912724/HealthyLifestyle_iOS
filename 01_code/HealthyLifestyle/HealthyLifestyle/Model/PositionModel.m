//
//  AreaModel.m
//  ZhaoQiPei
//
//  Created by 找汽配 on 16/3/24.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "PositionModel.h"

@implementation PositionModel

+ (instancetype)modelWithDict:(NSDictionary *)dict {
    PositionModel * model = [[self alloc] init];
    [model setupWithDict:dict];
    return model;
}

- (void)setupWithDict:(NSDictionary *)dict {
    if (dict[MERIDIAN_COLUMN_ID] && dict[MERIDIAN_COLUMN_ID] != [NSNull null]) {
        self.positionID = dict[MERIDIAN_COLUMN_ID];
    }
    if (dict[MERIDIAN_COLUMN_NAME] && dict[MERIDIAN_COLUMN_NAME] != [NSNull null]) {
        self.name = dict[MERIDIAN_COLUMN_NAME];
    }
}

@end

//
//  AreaModel.m
//  ZhaoQiPei
//
//  Created by 找汽配 on 16/3/24.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "FunctionModel.h"

@implementation FunctionModel

+ (instancetype)modelWithDict:(NSDictionary *)dict {
    FunctionModel * model = [[self alloc] init];
    [model setupWithDict:dict];
    return model;
}

- (void)setupWithDict:(NSDictionary *)dict {
    if (dict[FUNCTION_COLUMN_ID] && dict[FUNCTION_COLUMN_ID] != [NSNull null]) {
        self.functionID = dict[FUNCTION_COLUMN_ID];
    }
    if (dict[FUNCTION_COLUMN_NAME] && dict[FUNCTION_COLUMN_NAME] != [NSNull null]) {
        self.name = dict[FUNCTION_COLUMN_NAME];
    }
}

@end

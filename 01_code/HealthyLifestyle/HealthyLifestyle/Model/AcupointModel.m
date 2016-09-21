//
//  AreaModel.m
//  ZhaoQiPei
//
//  Created by 找汽配 on 16/3/24.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "AcupointModel.h"

@implementation AcupointModel

+ (instancetype)modelWithDict:(NSDictionary *)dict {
    AcupointModel * model = [[self alloc] init];
    [model setupWithDict:dict];
    return model;
}

- (void)setupWithDict:(NSDictionary *)dict {
    if (dict[ACUPOINT_COLUMN_ID] && dict[ACUPOINT_COLUMN_ID] != [NSNull null]) {
        self.acupointID = dict[ACUPOINT_COLUMN_ID];
    }
    if (dict[ACUPOINT_COLUMN_NAME] && dict[ACUPOINT_COLUMN_NAME] != [NSNull null]) {
        self.cnName = dict[ACUPOINT_COLUMN_NAME];
    }
    if (dict[ACUPOINT_COLUMN_PINYIN] && dict[ACUPOINT_COLUMN_PINYIN] != [NSNull null]) {
        self.pinyin = dict[ACUPOINT_COLUMN_PINYIN];
    }
    if (dict[ACUPOINT_COLUMN_CODE] && dict[ACUPOINT_COLUMN_CODE] != [NSNull null]) {
        self.code = dict[ACUPOINT_COLUMN_CODE];
    }
    if (dict[ACUPOINT_COLUMN_POSITION] && dict[ACUPOINT_COLUMN_POSITION] != [NSNull null]) {
        self.position = dict[ACUPOINT_COLUMN_POSITION];
    }
    if (dict[ACUPOINT_COLUMN_INDICATION] && dict[ACUPOINT_COLUMN_INDICATION] != [NSNull null]) {
        self.indication = dict[ACUPOINT_COLUMN_INDICATION];
    }
    if (dict[ACUPOINT_COLUMN_COOPERATION] && dict[ACUPOINT_COLUMN_COOPERATION] != [NSNull null]) {
        self.cooperation = dict[ACUPOINT_COLUMN_COOPERATION];
    }
    if (dict[ACUPOINT_COLUMN_ACUPUNCTURE] && dict[ACUPOINT_COLUMN_ACUPUNCTURE] != [NSNull null]) {
        self.acupuncture = dict[ACUPOINT_COLUMN_ACUPUNCTURE];
    }
}

@end

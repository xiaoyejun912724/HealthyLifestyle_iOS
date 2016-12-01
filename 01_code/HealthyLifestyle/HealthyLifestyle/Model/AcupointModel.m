//
//  AreaModel.m
//  ZhaoQiPei
//
//  Created by 找汽配 on 16/3/24.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "AcupointModel.h"
#import "NSString+Encrypt.h"

@implementation AcupointModel

+ (instancetype)modelWithDict:(NSDictionary *)dict {
    AcupointModel * model = [[self alloc] init];
    [model setupWithDict:dict];
    return model;
}

- (void)setupWithDict:(NSDictionary *)dict {
    NSString * key = @"0CAA40408EFCE2CB240CC99E943FB671";
    if (dict[ACUPOINT_COLUMN_ID] && dict[ACUPOINT_COLUMN_ID] != [NSNull null]) {
        self.acupointID = dict[ACUPOINT_COLUMN_ID];
    }
    if (dict[ACUPOINT_COLUMN_MERIDIANID] && dict[ACUPOINT_COLUMN_MERIDIANID] != [NSNull null]) {
        self.meridianID = dict[ACUPOINT_COLUMN_MERIDIANID];
    }
    if (dict[ACUPOINT_COLUMN_MERIDIANNAME] && dict[ACUPOINT_COLUMN_MERIDIANNAME] != [NSNull null]) {
        self.meridianName = dict[ACUPOINT_COLUMN_MERIDIANNAME];
    }
    if (dict[ACUPOINT_COLUMN_POSITIONID] && dict[ACUPOINT_COLUMN_POSITIONID] != [NSNull null]) {
        self.positionID = dict[ACUPOINT_COLUMN_POSITIONID];
    }
    if (dict[ACUPOINT_COLUMN_POSITIONNAME] && dict[ACUPOINT_COLUMN_POSITIONNAME] != [NSNull null]) {
        self.positionName = dict[ACUPOINT_COLUMN_POSITIONNAME];
    }
    if (dict[ACUPOINT_COLUMN_FUNCTIONID] && dict[ACUPOINT_COLUMN_FUNCTIONID] != [NSNull null]) {
        self.functionID = dict[ACUPOINT_COLUMN_FUNCTIONID];
    }
    if (dict[ACUPOINT_COLUMN_FUNCTIONNAME] && dict[ACUPOINT_COLUMN_FUNCTIONNAME] != [NSNull null]) {
        self.functionName = dict[ACUPOINT_COLUMN_FUNCTIONNAME];
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
        NSString * position = dict[ACUPOINT_COLUMN_POSITION];
        self.position = [position AES256DecryptWithKey:key];
    }
    if (dict[ACUPOINT_COLUMN_INDICATION] && dict[ACUPOINT_COLUMN_INDICATION] != [NSNull null]) {
        NSString * indication = dict[ACUPOINT_COLUMN_INDICATION];
        self.indication = [indication AES256DecryptWithKey:key];
    }
    if (dict[ACUPOINT_COLUMN_COMPATIBILITY] && dict[ACUPOINT_COLUMN_COMPATIBILITY] != [NSNull null]) {
        NSString * compatibility = dict[ACUPOINT_COLUMN_COMPATIBILITY];
        self.compatibility = [compatibility AES256DecryptWithKey:key];
    }
    if (dict[ACUPOINT_COLUMN_ACUPUNCTURE] && dict[ACUPOINT_COLUMN_ACUPUNCTURE] != [NSNull null]) {
        NSString * acupuncture = dict[ACUPOINT_COLUMN_ACUPUNCTURE];
        self.acupuncture = [acupuncture AES256DecryptWithKey:key];
    }
}

@end

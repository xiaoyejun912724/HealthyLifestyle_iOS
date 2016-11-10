//
//  MessageSceneModel.m
//  ZhaoQiPei
//
//  Created by 找汽配 on 16/3/17.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "AcupointListSceneModel.h"
#import "AppData.h"

@implementation AcupointListSceneModel

- (void)loadSceneModel {
    [super loadSceneModel];
    
}

- (NSArray *)acupointListWithData:(id)data {
    NSMutableArray * mArray = [NSMutableArray arrayWithCapacity:[data count]];
    [data enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        AcupointModel * model = [AcupointModel modelWithDict:obj];
        [mArray addObject:model];
    }];
    return [mArray copy];
}

- (void)queryAcupointsWithMeridianID:(NSString *)meridianID {
    [[AppData sharedInstance].databaseQueue inDatabase:^(FMDatabase *db) {
        if ([db open]) {
            self.acupointList = [NSMutableArray array];
            NSString * query = [NSString stringWithFormat:@"SELECT * FROM `%@` WHERE `meridian_id` = '%@'", ACUPOINT_TABLE_NAME, meridianID];
            FMResultSet * rs = [db executeQuery:query];
            while ([rs next]) {
                AcupointModel * model = [AcupointModel modelWithDict:@{ACUPOINT_COLUMN_ID:[rs stringForColumn:ACUPOINT_COLUMN_ID] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_MERIDIANID:[rs stringForColumn:ACUPOINT_COLUMN_MERIDIANID] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_MERIDIANNAME:[rs stringForColumn:ACUPOINT_COLUMN_MERIDIANNAME] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_POSITIONID:[rs stringForColumn:ACUPOINT_COLUMN_POSITIONID] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_POSITIONNAME:[rs stringForColumn:ACUPOINT_COLUMN_POSITIONNAME] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_FUNCTIONID:[rs stringForColumn:ACUPOINT_COLUMN_FUNCTIONID] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_FUNCTIONNAME:[rs stringForColumn:ACUPOINT_COLUMN_FUNCTIONNAME] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_NAME:[rs stringForColumn:ACUPOINT_COLUMN_NAME] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_PINYIN:[rs stringForColumn:ACUPOINT_COLUMN_PINYIN] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_CODE:[rs stringForColumn:ACUPOINT_COLUMN_CODE] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_POSITION:[rs stringForColumn:ACUPOINT_COLUMN_POSITION] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_INDICATION:[rs stringForColumn:ACUPOINT_COLUMN_INDICATION] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_COMPATIBILITY:[rs stringForColumn:ACUPOINT_COLUMN_COMPATIBILITY] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_ACUPUNCTURE:[rs stringForColumn:ACUPOINT_COLUMN_ACUPUNCTURE] ?: [NSNull null]}];
                [self.acupointList addObject:model];
            }
            if (self.delegate && [self.delegate respondsToSelector:@selector(acupointListSceneModelDidQueryAcupoints)]) {
                [self.delegate acupointListSceneModelDidQueryAcupoints];
            }
        };
    }];
}

- (void)queryAcupointsWithPositionID:(NSString *)positionID {
    [[AppData sharedInstance].databaseQueue inDatabase:^(FMDatabase *db) {
        if ([db open]) {
            self.acupointList = [NSMutableArray array];
            NSString * query = [NSString stringWithFormat:@"SELECT * FROM `%@` WHERE `position_id` = '%@'", ACUPOINT_TABLE_NAME, positionID];
            FMResultSet * rs = [db executeQuery:query];
            while ([rs next]) {
                AcupointModel * model = [AcupointModel modelWithDict:@{ACUPOINT_COLUMN_ID:[rs stringForColumn:ACUPOINT_COLUMN_ID] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_MERIDIANID:[rs stringForColumn:ACUPOINT_COLUMN_MERIDIANID] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_MERIDIANNAME:[rs stringForColumn:ACUPOINT_COLUMN_MERIDIANNAME] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_POSITIONID:[rs stringForColumn:ACUPOINT_COLUMN_POSITIONID] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_POSITIONNAME:[rs stringForColumn:ACUPOINT_COLUMN_POSITIONNAME] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_FUNCTIONID:[rs stringForColumn:ACUPOINT_COLUMN_FUNCTIONID] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_FUNCTIONNAME:[rs stringForColumn:ACUPOINT_COLUMN_FUNCTIONNAME] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_NAME:[rs stringForColumn:ACUPOINT_COLUMN_NAME] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_PINYIN:[rs stringForColumn:ACUPOINT_COLUMN_PINYIN] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_CODE:[rs stringForColumn:ACUPOINT_COLUMN_CODE] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_POSITION:[rs stringForColumn:ACUPOINT_COLUMN_POSITION] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_INDICATION:[rs stringForColumn:ACUPOINT_COLUMN_INDICATION] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_COMPATIBILITY:[rs stringForColumn:ACUPOINT_COLUMN_COMPATIBILITY] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_ACUPUNCTURE:[rs stringForColumn:ACUPOINT_COLUMN_ACUPUNCTURE] ?: [NSNull null]}];
                [self.acupointList addObject:model];
            }
            if (self.delegate && [self.delegate respondsToSelector:@selector(acupointListSceneModelDidQueryAcupoints)]) {
                [self.delegate acupointListSceneModelDidQueryAcupoints];
            }
        };
    }];
}
    
- (void)queryAcupointsWithFunctionID:(NSString *)functionID {
    [[AppData sharedInstance].databaseQueue inDatabase:^(FMDatabase *db) {
        if ([db open]) {
            self.acupointList = [NSMutableArray array];
            NSString * query = [NSString stringWithFormat:@"SELECT * FROM `%@` WHERE `function_id` = '%@'", ACUPOINT_TABLE_NAME, functionID];
            FMResultSet * rs = [db executeQuery:query];
            while ([rs next]) {
                AcupointModel * model = [AcupointModel modelWithDict:@{ACUPOINT_COLUMN_ID:[rs stringForColumn:ACUPOINT_COLUMN_ID] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_MERIDIANID:[rs stringForColumn:ACUPOINT_COLUMN_MERIDIANID] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_MERIDIANNAME:[rs stringForColumn:ACUPOINT_COLUMN_MERIDIANNAME] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_POSITIONID:[rs stringForColumn:ACUPOINT_COLUMN_POSITIONID] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_POSITIONNAME:[rs stringForColumn:ACUPOINT_COLUMN_POSITIONNAME] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_FUNCTIONID:[rs stringForColumn:ACUPOINT_COLUMN_FUNCTIONID] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_FUNCTIONNAME:[rs stringForColumn:ACUPOINT_COLUMN_FUNCTIONNAME] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_NAME:[rs stringForColumn:ACUPOINT_COLUMN_NAME] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_PINYIN:[rs stringForColumn:ACUPOINT_COLUMN_PINYIN] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_CODE:[rs stringForColumn:ACUPOINT_COLUMN_CODE] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_POSITION:[rs stringForColumn:ACUPOINT_COLUMN_POSITION] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_INDICATION:[rs stringForColumn:ACUPOINT_COLUMN_INDICATION] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_COMPATIBILITY:[rs stringForColumn:ACUPOINT_COLUMN_COMPATIBILITY] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_ACUPUNCTURE:[rs stringForColumn:ACUPOINT_COLUMN_ACUPUNCTURE] ?: [NSNull null]}];
                [self.acupointList addObject:model];
            }
            if (self.delegate && [self.delegate respondsToSelector:@selector(acupointListSceneModelDidQueryAcupoints)]) {
                [self.delegate acupointListSceneModelDidQueryAcupoints];
            }
        };
    }];
}

@end

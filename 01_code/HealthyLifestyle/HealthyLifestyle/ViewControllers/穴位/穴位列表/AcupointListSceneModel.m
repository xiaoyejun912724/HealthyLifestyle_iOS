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
                AcupointModel * model = [AcupointModel modelWithDict:@{ACUPOINT_COLUMN_ID:[rs stringForColumn:ACUPOINT_COLUMN_ID],
                                                                       ACUPOINT_COLUMN_NAME:[rs stringForColumn:ACUPOINT_COLUMN_NAME],
                                                                       ACUPOINT_COLUMN_PINYIN:[rs stringForColumn:ACUPOINT_COLUMN_PINYIN],
                                                                       ACUPOINT_COLUMN_CODE:[rs stringForColumn:ACUPOINT_COLUMN_CODE],
                                                                       ACUPOINT_COLUMN_POSITION:[rs stringForColumn:ACUPOINT_COLUMN_POSITION],
                                                                       ACUPOINT_COLUMN_INDICATION:[rs stringForColumn:ACUPOINT_COLUMN_INDICATION],
                                                                       ACUPOINT_COLUMN_COMPATIBILITY:[rs stringForColumn:ACUPOINT_COLUMN_COMPATIBILITY],
                                                                       ACUPOINT_COLUMN_ACUPUNCTURE:[rs stringForColumn:ACUPOINT_COLUMN_ACUPUNCTURE]}];
                [self.acupointList addObject:model];
                if (self.delegate && [self.delegate respondsToSelector:@selector(acupointListSceneModelDidQueryAcupoints)]) {
                    [self.delegate acupointListSceneModelDidQueryAcupoints];
                }
            }
        };
    }];
}

@end

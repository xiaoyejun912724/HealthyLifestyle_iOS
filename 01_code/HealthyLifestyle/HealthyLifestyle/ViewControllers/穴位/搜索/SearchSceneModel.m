//
//  MessageSceneModel.m
//  ZhaoQiPei
//
//  Created by 找汽配 on 16/3/17.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "SearchSceneModel.h"
#import "AppData.h"

@implementation SearchSceneModel

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

- (void)queryAcupointsWithKeyword:(NSString *)keyword {
    [[AppData sharedInstance].databaseQueue inDatabase:^(FMDatabase *db) {
        if ([db open]) {
            self.acupointList = [NSMutableArray array];
            NSString * query = [NSString stringWithFormat:@"SELECT * FROM `%@` WHERE `name` LIKE '%%%@%%' OR `cn_name` LIKE '%%%@%%' OR `pinyin` LIKE '%%%@%%' OR `code` LIKE '%%%@%%'", ACUPOINT_TABLE_NAME, keyword, keyword, keyword, keyword];
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
            }
            if (self.delegate && [self.delegate respondsToSelector:@selector(searchSceneModelDidQueryAcupoints)]) {
                [self.delegate searchSceneModelDidQueryAcupoints];
            }
        };
    }];
}

@end

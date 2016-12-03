//
//  MessageSceneModel.m
//  ZhaoQiPei
//
//  Created by 找汽配 on 16/3/17.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "FavoriteSceneModel.h"

@implementation FavoriteSceneModel

- (void)loadSceneModel {
    [super loadSceneModel];

}

- (void)queryAcupointsWithIDList:(NSArray *)idList {
    NSLog(@"%@", idList);
    [[AppData sharedInstance].databaseQueue inDatabase:^(FMDatabase *db) {
        if ([db open]) {
            NSMutableDictionary * mDict = [NSMutableDictionary dictionary];
            NSString * query = [NSString stringWithFormat:@"SELECT * FROM `%@` WHERE `%@` IN (%@)", ACUPOINT_TABLE_NAME, ACUPOINT_COLUMN_ID, [idList componentsJoinedByString:@","]];
            FMResultSet * rs = [db executeQuery:query];
            while ([rs next]) {
                AcupointModel * model = [AcupointModel modelWithDict:@{ACUPOINT_COLUMN_ID:[rs stringForColumn:ACUPOINT_COLUMN_ID] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_NAME:[rs stringForColumn:ACUPOINT_COLUMN_NAME] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_PINYIN:[rs stringForColumn:ACUPOINT_COLUMN_PINYIN] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_CODE:[rs stringForColumn:ACUPOINT_COLUMN_CODE] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_POSITION:[rs stringForColumn:ACUPOINT_COLUMN_POSITION] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_INDICATION:[rs stringForColumn:ACUPOINT_COLUMN_INDICATION] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_COMPATIBILITY:[rs stringForColumn:ACUPOINT_COLUMN_COMPATIBILITY] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_ACUPUNCTURE:[rs stringForColumn:ACUPOINT_COLUMN_ACUPUNCTURE] ?: [NSNull null]}];
                [mDict setObject:model forKey:model.acupointID];
            }
            NSMutableArray * mArray = [NSMutableArray arrayWithCapacity:mDict.count];
            [idList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [mArray addObject:mDict[obj]];
            }];
            self.acupointList = mArray;
            if (self.delegate && [self.delegate respondsToSelector:@selector(favoriteSceneModelDidQueryAcupoints)]) {
                [self.delegate favoriteSceneModelDidQueryAcupoints];
            }
        };
    }];
}

@end

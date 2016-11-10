//
//  MessageSceneModel.m
//  ZhaoQiPei
//
//  Created by 找汽配 on 16/3/17.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "PositionListSceneModel.h"
#import "AppData.h"

@implementation PositionListSceneModel

- (void)loadSceneModel {
    [super loadSceneModel];
    
}

- (NSArray *)positionListWithData:(id)data {
    NSMutableArray * mArray = [NSMutableArray arrayWithCapacity:[data count]];
    [data enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        PositionModel * model = [PositionModel modelWithDict:obj];
        [mArray addObject:model];
    }];
    return [mArray copy];
}

- (void)queryPositions {
    [[AppData sharedInstance].databaseQueue inDatabase:^(FMDatabase *db) {
        if ([db open]) {
            self.positionList = [NSMutableArray array];
            NSString * query = [NSString stringWithFormat:@"SELECT * FROM `%@`", POSITION_TABLE_NAME];
            FMResultSet * rs = [db executeQuery:query];
            while ([rs next]) {
                PositionModel * model = [PositionModel modelWithDict:@{POSITION_COLUMN_ID:[rs stringForColumn:POSITION_COLUMN_ID],
                                                                       POSITION_COLUMN_NAME:[rs stringForColumn:POSITION_COLUMN_NAME]}];
                [self.positionList addObject:model];
            }
            if (self.delegate && [self.delegate respondsToSelector:@selector(positionListSceneModelDidQueryPositions)]) {
                [self.delegate positionListSceneModelDidQueryPositions];
            }
        };
    }];
}

@end

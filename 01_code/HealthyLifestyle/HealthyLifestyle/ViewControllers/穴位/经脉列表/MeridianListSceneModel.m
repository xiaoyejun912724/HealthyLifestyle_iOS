//
//  MessageSceneModel.m
//  ZhaoQiPei
//
//  Created by 找汽配 on 16/3/17.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "MeridianListSceneModel.h"
#import "AppData.h"

@implementation MeridianListSceneModel

- (void)loadSceneModel {
    [super loadSceneModel];
    
}

- (NSArray *)meridianListWithData:(id)data {
    NSMutableArray * mArray = [NSMutableArray arrayWithCapacity:[data count]];
    [data enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        MeridianModel * model = [MeridianModel modelWithDict:obj];
        [mArray addObject:model];
    }];
    return [mArray copy];
}

- (void)queryMeridians {
    [[AppData sharedInstance].databaseQueue inDatabase:^(FMDatabase *db) {
        if ([db open]) {
            self.meridianList = [NSMutableArray array];
            NSString * query = [NSString stringWithFormat:@"SELECT * FROM `%@`", MERIDIAN_TABLE_NAME];
            FMResultSet * rs = [db executeQuery:query];
            while ([rs next]) {
                MeridianModel * model = [MeridianModel modelWithDict:@{MERIDIAN_COLUMN_ID:[rs stringForColumn:MERIDIAN_COLUMN_ID],
                                                                       MERIDIAN_COLUMN_NAME:[rs stringForColumn:MERIDIAN_COLUMN_NAME]}];
                [self.meridianList addObject:model];
            }
            if (self.delegate && [self.delegate respondsToSelector:@selector(meridianListSceneModelDidQueryMeridians)]) {
                [self.delegate meridianListSceneModelDidQueryMeridians];
            }
        };
    }];
}

@end

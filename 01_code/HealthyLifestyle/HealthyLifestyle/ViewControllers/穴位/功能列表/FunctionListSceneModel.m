//
//  MessageSceneModel.m
//  ZhaoQiPei
//
//  Created by 找汽配 on 16/3/17.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "FunctionListSceneModel.h"
#import "AppData.h"

@implementation FunctionListSceneModel

- (void)loadSceneModel {
    [super loadSceneModel];
    
}

- (NSArray *)functionListWithData:(id)data {
    NSMutableArray * mArray = [NSMutableArray arrayWithCapacity:[data count]];
    [data enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        FunctionModel * model = [FunctionModel modelWithDict:obj];
        [mArray addObject:model];
    }];
    return [mArray copy];
}

- (void)queryFunctions {
    [[AppData sharedInstance].databaseQueue inDatabase:^(FMDatabase *db) {
        if ([db open]) {
            self.functionList = [NSMutableArray array];
            NSString * query = [NSString stringWithFormat:@"SELECT * FROM `%@`", FUNCTION_TABLE_NAME];
            FMResultSet * rs = [db executeQuery:query];
            while ([rs next]) {
                FunctionModel * model = [FunctionModel modelWithDict:@{FUNCTION_COLUMN_ID:[rs stringForColumn:FUNCTION_COLUMN_ID] ?: [NSNull null],
                                                                       FUNCTION_COLUMN_NAME:[rs stringForColumn:FUNCTION_COLUMN_NAME] ?: [NSNull null]}];
                [self.functionList addObject:model];
            }
            if (self.delegate && [self.delegate respondsToSelector:@selector(functionListSceneModelDidQueryFunctions)]) {
                [self.delegate functionListSceneModelDidQueryFunctions];
            }
        };
    }];
}

@end

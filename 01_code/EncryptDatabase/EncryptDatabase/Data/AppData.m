//
//  AppData.m
//  ZhaoQiPei
//
//  Created by 找汽配ios开发 on 16/1/6.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "AppData.h"
#import "FMDatabase.h"

@interface AppData ()


@end

@implementation AppData

- (AppData *)sharedInstance {
    return [AppData sharedInstance];
}

+ (AppData *)sharedInstance {
    static dispatch_once_t once;
    static AppData * __singleton__;
    dispatch_once( &once, ^{ __singleton__ = [[[self class] alloc] init]; } );
    return __singleton__;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupData];
    }
    return self;
}

- (void)dealloc {
    [self.databaseQueue close];
}

- (void)setupData {
    NSString * filePath = @"/Users/zqp-ios-development/Desktop/HealthyLifestyle/HealthyLifestyle_iOS/04_database/Acupoint_encrypt.db";
    self.databaseQueue = [FMDatabaseQueue databaseQueueWithPath:filePath];
}

@end

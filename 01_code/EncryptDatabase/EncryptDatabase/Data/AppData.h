//
//  AppData.h
//  ZhaoQiPei
//
//  Created by 找汽配ios开发 on 16/1/6.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabaseQueue.h"
#import "FMDatabase.h"

@interface AppData : NSObject

- (AppData *)sharedInstance;
+ (AppData *)sharedInstance;

@property (nonatomic, strong) FMDatabaseQueue * databaseQueue;

@end

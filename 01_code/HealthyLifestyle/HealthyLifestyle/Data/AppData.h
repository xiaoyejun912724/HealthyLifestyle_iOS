//
//  AppData.h
//  ZhaoQiPei
//
//  Created by 找汽配ios开发 on 16/1/6.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMDatabase;

@interface AppData : NSObject

AS_SINGLETON(AppData)

@property (nonatomic, strong) FMDatabase * database;

@end

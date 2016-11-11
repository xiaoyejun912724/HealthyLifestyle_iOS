//
//  HLURLManager.m
//  HealthyLifestyle
//
//  Created by 找汽配 on 2016/11/11.
//  Copyright © 2016年 HealthyLifestyle. All rights reserved.
//

#import "HLURLManager.h"

@implementation HLURLManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static HLURLManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[HLURLManager alloc] init];
    });
    return instance;
}

- (void)dealloc {
    self.delegate = nil;
}

@end

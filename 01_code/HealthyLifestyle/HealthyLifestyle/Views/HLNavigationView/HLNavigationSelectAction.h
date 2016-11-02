//
//  HLNavigationSelectAction.h
//  HealthyLifestyle
//
//  Created by 找汽配 on 2016/11/1.
//  Copyright © 2016年 HealthyLifestyle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HLNavigationSelectAction : NSObject

+ (instancetype)actionWithTitle:(NSString *)title handler:(void(^)(HLNavigationSelectAction *))handler;

@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) void(^handler)(HLNavigationSelectAction *);

@end


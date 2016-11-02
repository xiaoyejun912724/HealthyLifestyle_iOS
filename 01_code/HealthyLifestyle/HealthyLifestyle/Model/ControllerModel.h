//
//  AreaModel.h
//  ZhaoQiPei
//
//  Created by 找汽配 on 16/3/24.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ControllerModel : NSObject

@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * controller;

+ (instancetype)modelWithDict:(NSDictionary *)dict;
- (void)setupWithDict:(NSDictionary *)dict;

@end

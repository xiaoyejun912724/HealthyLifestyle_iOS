//
//  MessageModel.h
//  WebBox
//
//  Created by 陈书钦 on 15/5/31.
//  Copyright (c) 2015年 sky. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface AcupointCategoryModel : NSObject

@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * viewController;

+ (instancetype)modelWithDict:(NSDictionary *)dict;
- (void)setupWithDict:(NSDictionary *)dict;

@end

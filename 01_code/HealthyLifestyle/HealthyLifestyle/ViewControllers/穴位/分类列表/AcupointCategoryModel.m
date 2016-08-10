//
//  MessageModel.m
//  WebBox
//
//  Created by 陈书钦 on 15/5/31.
//  Copyright (c) 2015年 sky. All rights reserved.
//

#import "AcupointCategoryModel.h"

@implementation AcupointCategoryModel

+ (instancetype)modelWithDict:(NSDictionary *)dict {
    AcupointCategoryModel * model = [[self alloc] init];
    [model setupWithDict:dict];
    return model;
}

- (void)setupWithDict:(NSDictionary *)dict {
    self.title = dict[@"title"];
    self.viewController = dict[@"view_controller"];
}

@end

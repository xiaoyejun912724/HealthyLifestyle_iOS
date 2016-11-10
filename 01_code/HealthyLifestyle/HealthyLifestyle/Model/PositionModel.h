//
//  AreaModel.h
//  ZhaoQiPei
//
//  Created by 找汽配 on 16/3/24.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PositionModel : NSObject

@property (nonatomic, copy) NSString * positionID;
@property (nonatomic, copy) NSString * name;

+ (instancetype)modelWithDict:(NSDictionary *)dict;
- (void)setupWithDict:(NSDictionary *)dict;

@end

//
//  AreaModel.h
//  ZhaoQiPei
//
//  Created by 找汽配 on 16/3/24.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AcupointModel : NSObject

@property (nonatomic, copy) NSString * acupointID;
@property (nonatomic, copy) NSString * cnName;
@property (nonatomic, copy) NSString * pinyin;
@property (nonatomic, copy) NSString * code;
@property (nonatomic, copy) NSString * position;
@property (nonatomic, copy) NSString * indication;
@property (nonatomic, copy) NSString * cooperation;
@property (nonatomic, copy) NSString * acupuncture;

+ (instancetype)modelWithDict:(NSDictionary *)dict;
- (void)setupWithDict:(NSDictionary *)dict;

@end

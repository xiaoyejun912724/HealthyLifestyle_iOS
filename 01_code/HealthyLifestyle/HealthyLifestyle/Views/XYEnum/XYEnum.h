//
//  XYEnum.h
//  PeiZhuShou
//
//  Created by 找汽配 on 2016/10/17.
//  Copyright © 2016年 XiangYun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, AcupointListType) {
    AcupointListTypeNone,
    AcupointListTypeMeridian,       // 经脉列表
    AcupointListTypePosition,       // 位置列表
    AcupointListTypeFunction,       // 功能列表
};

typedef NS_ENUM(NSInteger, HLNavigationSelectActionType) {
    HLNavigationSelectActionTypeNone,
    HLNavigationSelectActionTypeSearch,       // 搜索类型
    HLNavigationSelectActionTypeCollect,      // 收藏类型
};

@interface XYEnum : NSObject



@end

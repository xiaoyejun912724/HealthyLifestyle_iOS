//
//  AcupointListScene.h
//  HealthyLifestyle
//
//  Created by 找汽配 on 16/7/2.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "HLViewController.h"

typedef NS_ENUM(NSInteger, AcupointListType);

@interface AcupointListScene : HLViewController

@property (nonatomic, assign) AcupointListType type;
@property (nonatomic, copy) NSString * meridianID;
@property (nonatomic, copy) NSString * positionID;
@property (nonatomic, copy) NSString * functionID;

@end

//
//  HLURLManager.h
//  HealthyLifestyle
//
//  Created by 找汽配 on 2016/11/11.
//  Copyright © 2016年 HealthyLifestyle. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HLURLManagerDelegate;

@interface HLURLManager : NSObject

@property (nonatomic, weak) id<HLURLManagerDelegate> delegate;

+ (instancetype)sharedManager;

@end

@protocol HLURLManagerDelegate <NSObject>

- (void)urlManagerDidRecvURL:(NSURL *)url;

@end

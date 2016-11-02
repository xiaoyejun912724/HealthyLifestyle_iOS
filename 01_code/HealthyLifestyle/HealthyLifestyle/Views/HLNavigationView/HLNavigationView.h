//
//  HLNavigationView.h
//  HealthyLifestyle
//
//  Created by 找汽配 on 2016/11/1.
//  Copyright © 2016年 HealthyLifestyle. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HLNavigationSelectActionType);

@protocol HLNavigationViewDelegate;

@interface HLNavigationView : UIView

@property (nonatomic, weak) id<HLNavigationViewDelegate> delegate;

- (void)setActionTypes:(NSArray *)actionTypes;

@end

@protocol HLNavigationViewDelegate <NSObject>

- (void)navigationViewDidCollect;
- (void)navigationViewDidSearch;

@end

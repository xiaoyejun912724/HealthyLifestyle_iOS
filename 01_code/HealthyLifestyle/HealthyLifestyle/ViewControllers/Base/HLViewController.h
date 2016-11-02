//
//  BaseScene.h
//  HealthyLifestyle
//
//  Created by 找汽配 on 16/7/2.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLViewController : UIViewController

#pragma mark - Navigation

- (void)addMoreButtonItemWithActionTypes:(NSArray *)actionTypes;

#pragma mark - Alert

- (void)presentAlertWithTitle:(NSString *)title message:(NSString *)message dismissAfterDelay:(NSTimeInterval)delay completion:(void(^)())completion;

@end

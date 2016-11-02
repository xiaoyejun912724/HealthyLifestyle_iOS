//
//  HLSelectView.h
//  HealthyLifestyle
//
//  Created by 找汽配 on 2016/11/1.
//  Copyright © 2016年 HealthyLifestyle. All rights reserved.
//

#import "XYListView.h"
#import "HLNavigationSelectAction.h"

@interface HLNavigationSelectView : XYListView

- (void)addAction:(HLNavigationSelectAction *)action;
- (void)reloadActions;

@end

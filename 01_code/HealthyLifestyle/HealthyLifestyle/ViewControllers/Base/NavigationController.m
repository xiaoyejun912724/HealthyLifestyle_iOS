//
//  NavigationController.m
//  HealthyLifestyle
//
//  Created by 找汽配 on 16/7/2.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()



@end

@implementation NavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        NSDictionary * normalDict = @{NSFontAttributeName:[UIFont systemFontOfSize:12],
                                      NSForegroundColorAttributeName:COLOR_DARK_GRAY};
        NSDictionary * selectedDict = @{NSForegroundColorAttributeName:COLOR_RED};
        [self.tabBarItem setTitleTextAttributes:normalDict forState:UIControlStateNormal];
        [self.tabBarItem setTitleTextAttributes:selectedDict forState:UIControlStateSelected];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

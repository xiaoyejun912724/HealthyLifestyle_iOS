//
//  TabBarViewController.m
//  HealthyLifestyle
//
//  Created by 找汽配 on 16/8/10.
//  Copyright © 2016年 HealthyLifestyle. All rights reserved.
//

#import "TabBarController.h"
#import "NavigationController.h"
#import "AcupointCategoryListScene.h"
#import "MeScene.h"

@interface TabBarController ()

@property (nonatomic, strong) NavigationController * navigation_controller_1;
@property (nonatomic, strong) NavigationController * navigation_controller_2;

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    [self setupTabBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setup

- (void)setupTabBar {
    self.tabBar.tintColor = COLOR_RED;                  // 图片选中时的颜色
    
    [self setViewControllers:@[self.navigation_controller_1,
                               self.navigation_controller_2]];
}

#pragma mark - Getter

- (NavigationController *)navigation_controller_1 {
    if (!_navigation_controller_1) {
        AcupointCategoryListScene * scene = [[AcupointCategoryListScene alloc] initWithNibName:@"AcupointCategoryListScene" bundle:nil];
        _navigation_controller_1 = [[NavigationController alloc] initWithRootViewController:scene];
        _navigation_controller_1.tabBarItem.image = [[UIImage imageNamed:@"icon_acupoint_1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _navigation_controller_1.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_acupoint_1"];
        _navigation_controller_1.tabBarItem.title = NSLocalizedString(@"穴位", nil);
    }
    return _navigation_controller_1;
}

- (NavigationController *)navigation_controller_2 {
    if (!_navigation_controller_2) {
        MeScene * scene = [[MeScene alloc] initWithNibName:@"MeScene" bundle:nil];
        _navigation_controller_2 = [[NavigationController alloc] initWithRootViewController:scene];
        _navigation_controller_2.tabBarItem.image = [[UIImage imageNamed:@"icon_me_1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _navigation_controller_2.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_me_1"];
        _navigation_controller_2.tabBarItem.title = NSLocalizedString(@"我的", nil);
    }
    return _navigation_controller_2;
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

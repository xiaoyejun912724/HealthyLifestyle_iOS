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

@property (nonatomic, strong) NavigationController * acupointNavigationController;
@property (nonatomic, strong) NavigationController * meNavigationController;

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
    NSArray * viewControllers = @[self.acupointNavigationController,
                                  self.meNavigationController];
    [self setViewControllers:viewControllers];
    
    self.tabBar.tintColor = COLOR_RED;                  // 图片选中时的颜色
    
}

#pragma mark - Getter

- (NavigationController *)acupointNavigationController {
    if (!_acupointNavigationController) {
        AcupointCategoryListScene * scene = [[AcupointCategoryListScene alloc] initWithNibName:@"AcupointCategoryListScene" bundle:nil];
        _acupointNavigationController = [[NavigationController alloc] initWithRootViewController:scene];
        _acupointNavigationController.tabBarItem.image = [[UIImage imageNamed:@"icon_acupoint_1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _acupointNavigationController.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_acupoint_1"];
        _acupointNavigationController.tabBarItem.title = NSLocalizedString(@"穴位", nil);
    }
    return _acupointNavigationController;
}

- (NavigationController *)meNavigationController {
    if (!_meNavigationController) {
        MeScene * scene = [[MeScene alloc] initWithNibName:@"MeScene" bundle:nil];
        _meNavigationController = [[NavigationController alloc] initWithRootViewController:scene];
        _meNavigationController.tabBarItem.image = [[UIImage imageNamed:@"icon_me_1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _meNavigationController.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_me_1"];
        _meNavigationController.tabBarItem.title = NSLocalizedString(@"我的", nil);
    }
    return _meNavigationController;
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

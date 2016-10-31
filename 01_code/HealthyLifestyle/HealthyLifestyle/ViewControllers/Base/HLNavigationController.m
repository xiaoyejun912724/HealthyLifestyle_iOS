//
//  XYNavigationController.m
//  ZhaoQiPei
//
//  Created by 找汽配 on 16/8/31.
//  Copyright © 2016年 XiangYun. All rights reserved.
//

#import "HLNavigationController.h"

@interface HLNavigationController ()

@end

@implementation HLNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)replaceViewController:(UIViewController *)viewController animated:(BOOL)animated {
    NSMutableArray * mArray = [NSMutableArray arrayWithArray:self.viewControllers];
    [mArray removeLastObject];
    [mArray addObject:viewController];
    [self setViewControllers:mArray animated:animated];
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

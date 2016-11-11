//
//  BaseScene.m
//  HealthyLifestyle
//
//  Created by 找汽配 on 16/7/2.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "HLViewController.h"
#import "SearchViewController.h"
#import "AcupointViewController.h"
#import "NavigationController.h"
#import "HLNavigationView.h"
#import "HLURLManager.h"
#import "AcupointModel.h"


@interface HLViewController () <HLNavigationViewDelegate, HLURLManagerDelegate>

@property (nonatomic, strong) NSArray * actionTypes;

@end

@implementation HLViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didSearchAcupointNotification:) name:DidSearchAcupointNotification object:nil];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:DidSearchAcupointNotification object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // 自定义后退按钮
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [HLURLManager sharedManager].delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (void)addMoreButtonItemWithActionTypes:(NSArray *)actionTypes {
    self.actionTypes = actionTypes;
    UIButton * button = [IconFont buttonWithIcon:[IconFont icon:@"ios7More" fromFont:ionIcons] fontName:ionIcons size:32 color:[UIColor blackColor]];
    button.frame = CGRectMake(0, 0, 42, 30);
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [button addTarget:self action:@selector(moreButtonTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = item;
}

#pragma mark - Button Action

- (void)moreButtonTouchUpInside {
    HLNavigationView * view = [[HLNavigationView alloc] init];
    [view setActionTypes:self.actionTypes];
    view.delegate = self;
    [self.navigationController.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view.superview);
    }];
}

#pragma mark - Notification

- (void)didSearchAcupointNotification:(NSNotification *)sender {
    NSLog(@"%@ %@", self, sender.object);
    UIViewController * viewController = sender.object;
    if (viewController == self) {
        AcupointModel * model = sender.userInfo[@"acupoint"];
        AcupointViewController * controller = [[AcupointViewController alloc] initWithNibName:@"AcupointViewController" bundle:nil];
        controller.acupointID = model.acupointID;
        [self.navigationController pushViewController:controller animated:YES];        
    }
}

#pragma mark - Alert

- (void)presentAlertWithTitle:(NSString *)title message:(NSString *)message dismissAfterDelay:(NSTimeInterval)delay completion:(void(^)())completion {
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    if (completion) {
        [self presentViewController:alertController animated:YES completion:^{
            NSDictionary * dict = @{@"alert_controller":alertController,
                                    @"completion":completion};
            [self performSelector:@selector(dismissAlertControllerWithDict:) withObject:dict afterDelay:delay];
        }];
    } else {
        [self presentViewController:alertController animated:YES completion:^{
            [self performSelector:@selector(dismissAlertController:) withObject:alertController afterDelay:delay];
        }];
    }
}

- (void)dismissAlertController:(UIAlertController *)alertController {
    [alertController dismissViewControllerAnimated:YES completion:nil];
}

- (void)dismissAlertControllerWithDict:(NSDictionary *)dict {
    [dict[@"alert_controller"] dismissViewControllerAnimated:YES completion:^{
        void(^completion)() = dict[@"completion"];
        completion();
    }];
}

#pragma mark - HLNavigationViewDelegate

- (void)navigationViewDidSearch {
    SearchViewController * controller = [[SearchViewController alloc] initWithNibName:@"SearchViewController" bundle:nil];
    controller.viewController = self;
    NavigationController * navigationController = [[NavigationController alloc] initWithRootViewController:controller];
    [self.navigationController presentViewController:navigationController animated:YES completion:nil];
}

#pragma mark - HLURLManagerDelegate

- (void)urlManagerDidRecvURL:(NSURL *)url {
        NSLog(@"%@", url.host);
        NSLog(@"%@", url.params);
        NSLog(@"%@", [URLManager manager].config);
    
    NSString * controller = [URLManager manager].config[url.host];
    UIViewController * viewController = [[NSClassFromString(controller) alloc] initWithNibName:controller bundle:nil];
    [url.params enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [viewController setValue:obj forKey:key];
    }];
    [self.navigationController pushViewController:viewController animated:YES];
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

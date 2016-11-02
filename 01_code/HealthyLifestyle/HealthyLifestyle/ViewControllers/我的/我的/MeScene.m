//
//  MeScene.m
//  HealthyLifestyle
//
//  Created by 找汽配 on 16/7/2.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "MeScene.h"
#import "MeSceneModel.h"
#import "MeTableViewCell.h"

@interface MeScene () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) MeSceneModel * sceneModel;

@end

@implementation MeScene

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.title = NSLocalizedString(@"我的", nil);
    self.sceneModel = [MeSceneModel SceneModel];
    
    [self setupView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setup

- (void)setupView {
    self.tableView.tableFooterView = [[UIView alloc] init];
    [self.tableView registerNib:[UINib nibWithNibName:@"MeTableViewCell" bundle:nil] forCellReuseIdentifier:kMeTableViewCellReuseIdentifier];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sceneModel.controllerList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kMeTableViewCellReuseIdentifier forIndexPath:indexPath];
    ControllerModel * model = self.sceneModel.controllerList[indexPath.row];
    [cell reloadData:model.title];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ControllerModel * model = self.sceneModel.controllerList[indexPath.row];
    if (model.controller) {
        id scene = [[NSClassFromString(model.controller) alloc] initWithNibName:model.controller bundle:nil];
        [scene setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:scene animated:YES];
    }
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

//
//  AcupointCategoryListScene.m
//  HealthyLifestyle
//
//  Created by 找汽配 on 16/7/2.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "AcupointCategoryListScene.h"
#import "AcupointCategoryListSceneModel.h"
#import "AcupointCategoryTableViewCell.h"

@interface AcupointCategoryListScene () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView * tableView;

@property (nonatomic, strong) AcupointCategoryListSceneModel * sceneModel;

@end

@implementation AcupointCategoryListScene

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.title = NSLocalizedString(@"穴位", nil);
    self.sceneModel = [AcupointCategoryListSceneModel SceneModel];
    
    [self setupScene];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setup

- (void)setupScene {
    self.tableView.tableFooterView = [[UIView alloc] init];
    [self.tableView registerNib:[UINib nibWithNibName:@"AcupointCategoryTableViewCell" bundle:nil] forCellReuseIdentifier:kAcupointCategoryTableViewCellReuseIdentifier];
}

#pragma mark - Getter



#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sceneModel.categoryList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AcupointCategoryTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kAcupointCategoryTableViewCellReuseIdentifier forIndexPath:indexPath];
    AcupointCategoryModel * model = self.sceneModel.categoryList[indexPath.row];
    [cell reloadData:model.title];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AcupointCategoryModel * model = self.sceneModel.categoryList[indexPath.row];
    if (model.viewController) {
        id scene = [[NSClassFromString(model.viewController) alloc] initWithNibName:model.viewController bundle:nil];
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

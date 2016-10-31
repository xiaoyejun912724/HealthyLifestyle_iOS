//
//  FunctionListScene.m
//  HealthyLifestyle
//
//  Created by 找汽配 on 16/7/11.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "FunctionListScene.h"
#import "FunctionTableViewCell.h"
#import "FunctionListSceneModel.h"

@interface FunctionListScene () <UITableViewDataSource, UITableViewDelegate, FunctionListSceneModelDelegate>

@property (weak, nonatomic) IBOutlet UITableView * tableView;

@property (nonatomic, strong) FunctionListSceneModel * sceneModel;

@end

@implementation FunctionListScene

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.title = @"Function";
    self.sceneModel = [FunctionListSceneModel SceneModel];
    self.sceneModel.delegate = self;
    
    [self setupScene];
    
    [self.sceneModel queryFunctions];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setup

- (void)setupScene {
    self.tableView.tableFooterView = [[UIView alloc] init];
    [self.tableView registerNib:[UINib nibWithNibName:@"FunctionTableViewCell" bundle:nil] forCellReuseIdentifier:kFunctionTableViewCellReuseIdentifier];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sceneModel.functionList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FunctionTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kFunctionTableViewCellReuseIdentifier forIndexPath:indexPath];
    FunctionModel * model = self.sceneModel.functionList[indexPath.row];
    [cell reloadData:model];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSDictionary * dict = self.functionList[indexPath.row];
//    if (dict[@"scene"]) {
//        id scene = [[NSClassFromString(dict[@"scene"]) alloc] initWithNibName:@"AcupointCategoryListScene" bundle:nil];
//        [scene setHidesBottomBarWhenPushed:YES];
//        [self.navigationController pushViewController:scene animated:YES];
//    }
}

#pragma mark - FunctionListSceneModelDelegate

- (void)functionListSceneModelDidQueryFunctions {
    [self.tableView reloadData];
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

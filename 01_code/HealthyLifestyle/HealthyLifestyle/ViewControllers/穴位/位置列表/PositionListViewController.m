//
//  MeridianListScene.m
//  HealthyLifestyle
//
//  Created by 找汽配 on 16/7/2.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "PositionListViewController.h"
#import "AcupointListScene.h"
#import "PositionTableViewCell.h"
#import "PositionListSceneModel.h"
#import "XYEnum.h"

@interface PositionListViewController () <UITableViewDataSource, UITableViewDelegate, PositionListSceneModelDelegate>

@property (weak, nonatomic) IBOutlet UITableView * tableView;

@property (nonatomic, strong) PositionListSceneModel * sceneModel;

@end

@implementation PositionListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.title = NSLocalizedString(@"位置", nil);
    self.sceneModel = [PositionListSceneModel SceneModel];
    self.sceneModel.delegate = self;

    [self setupNavigationItem];
    [self setupScene];
    
    [self.sceneModel queryPositions];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setup

- (void)setupNavigationItem {
    [self addMoreButtonItemWithActionTypes:@[@(HLNavigationSelectActionTypeSearch)]];
}

- (void)setupScene {
    self.tableView.tableFooterView = [[UIView alloc] init];
    [self.tableView registerNib:[UINib nibWithNibName:@"MeridianTableViewCell" bundle:nil] forCellReuseIdentifier:kPositionTableViewCellReuseIdentifier];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sceneModel.positionList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PositionTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kPositionTableViewCellReuseIdentifier forIndexPath:indexPath];
    PositionModel * model = self.sceneModel.positionList[indexPath.row];
    [cell reloadData:model];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PositionModel * model = self.sceneModel.positionList[indexPath.row];
    AcupointListScene * controller = [[AcupointListScene alloc] initWithNibName:@"AcupointListScene" bundle:nil];
    controller.type = AcupointListTypePosition;
    controller.positionID = model.positionID;
    controller.title = model.name;
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - PositionListSceneModelDelegate

- (void)positionListSceneModelDidQueryPositions {
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

//
//  MeridianListScene.m
//  HealthyLifestyle
//
//  Created by 找汽配 on 16/7/2.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "MeridianListScene.h"
#import "AcupointListScene.h"
#import "MeridianTableViewCell.h"
#import "MeridianListSceneModel.h"
#import "XYEnum.h"

@interface MeridianListScene () <UITableViewDataSource, UITableViewDelegate, MeridianListSceneModelDelegate>

@property (weak, nonatomic) IBOutlet UITableView * tableView;

@property (nonatomic, strong) MeridianListSceneModel * sceneModel;

@end

@implementation MeridianListScene

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.title = NSLocalizedString(@"经脉", nil);
    self.sceneModel = [MeridianListSceneModel SceneModel];
    self.sceneModel.delegate = self;

    [self setupNavigationItem];
    [self setupScene];
    
    [self.sceneModel queryMeridians];
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
    [self.tableView registerNib:[UINib nibWithNibName:@"MeridianTableViewCell" bundle:nil] forCellReuseIdentifier:kMeridianTableViewCellReuseIdentifier];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sceneModel.meridianList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MeridianTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kMeridianTableViewCellReuseIdentifier forIndexPath:indexPath];
    MeridianModel * model = self.sceneModel.meridianList[indexPath.row];
    [cell reloadData:model];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MeridianModel * model = self.sceneModel.meridianList[indexPath.row];
    AcupointListScene * controller = [[AcupointListScene alloc] initWithNibName:@"AcupointListScene" bundle:nil];
    controller.type = AcupointListTypeMeridian;
    controller.meridianID = model.meridianID;
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - MeridianListSceneModelDelegate

- (void)meridianListSceneModelDidQueryMeridians {
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

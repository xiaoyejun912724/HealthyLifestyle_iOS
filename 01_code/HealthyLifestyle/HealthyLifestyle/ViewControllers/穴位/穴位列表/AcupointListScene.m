//
//  AcupointListScene.m
//  HealthyLifestyle
//
//  Created by 找汽配 on 16/7/2.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "AcupointListScene.h"
#import "AcupointViewController.h"
#import "AcupointTableViewCell.h"
#import "AcupointListSceneModel.h"
#import "XYEnum.h"

@interface AcupointListScene () <UITableViewDataSource, UITableViewDelegate, AcupointListSceneModelDelegate>

@property (weak, nonatomic) IBOutlet UITableView * tableView;

@property (nonatomic, strong) AcupointListSceneModel * sceneModel;

@end

@implementation AcupointListScene

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    if (!self.title) {
        self.title = NSLocalizedString(@"穴位", nil);
    }
    self.sceneModel = [AcupointListSceneModel SceneModel];
    self.sceneModel.delegate = self;
    
    [self setupNavigationItem];
    [self setupScene];
    
    if (self.type == AcupointListTypeMeridian) {
        [self.sceneModel queryAcupointsWithMeridianID:self.meridianID];
    } else if (self.type == AcupointListTypePosition) {
        [self.sceneModel queryAcupointsWithPositionID:self.positionID];
    } else if (self.type == AcupointListTypeFunction) {
        [self.sceneModel queryAcupointsWithFunctionID:self.functionID];
    }
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
    [self.tableView registerNib:[UINib nibWithNibName:@"AcupointTableViewCell" bundle:nil] forCellReuseIdentifier:kAcupointTableViewCellReuseIdentifier];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sceneModel.acupointList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AcupointModel * model = self.sceneModel.acupointList[indexPath.row];
    AcupointTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kAcupointTableViewCellReuseIdentifier forIndexPath:indexPath];
    [cell reloadData:model];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AcupointModel * model = self.sceneModel.acupointList[indexPath.row];
    AcupointViewController * controller = [[AcupointViewController alloc] initWithNibName:@"AcupointViewController" bundle:nil];
    controller.acupointID = model.acupointID;
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - AcupointListSceneModelDelegate

- (void)acupointListSceneModelDidQueryAcupoints {
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

//
//  FavoriteViewController.m
//  HealthyLifestyle
//
//  Created by 找汽配 on 2016/11/2.
//  Copyright © 2016年 HealthyLifestyle. All rights reserved.
//

#import "FavoriteViewController.h"
#import "AcupointViewController.h"
#import "FavoriteSceneModel.h"
#import "FavoriteTableViewCell.h"

@interface FavoriteViewController () <UITableViewDataSource, UITableViewDelegate, FavoriteSceneModelDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) FavoriteSceneModel * sceneModel;

@end

@implementation FavoriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"收藏";
    self.sceneModel = [FavoriteSceneModel SceneModel];
    
    [self setupView];
    
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSArray * favorites = [defaults objectForKey:@"Favorite"];
    [self.sceneModel queryAcupointsWithIDList:favorites];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setup

- (void)setupView {
    self.tableView.tableFooterView = [[UIView alloc] init];
    [self.tableView registerNib:[UINib nibWithNibName:@"FavoriteTableViewCell" bundle:nil] forCellReuseIdentifier:kFavoriteTableViewCellReuseIdentifier];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sceneModel.acupointList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AcupointModel * model = self.sceneModel.acupointList[indexPath.row];
    FavoriteTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kFavoriteTableViewCellReuseIdentifier forIndexPath:indexPath];
    [cell reloadData:model];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AcupointModel * model = self.sceneModel.acupointList[indexPath.row];
    AcupointViewController * controller = [[AcupointViewController alloc] initWithNibName:@"AcupointViewController" bundle:nil];
    controller.acupointModel = model;
    [self.navigationController pushViewController:controller animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray * favorites = nil;
    NSArray * array = [defaults objectForKey:@"Favorite"];
    if (array) {
        favorites = [array mutableCopy];
    } else {
        favorites = [NSMutableArray array];
    }
    [favorites removeObjectAtIndex:indexPath.row];
    [defaults setObject:favorites forKey:@"Favorite"];
    [self.sceneModel.acupointList removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark - FavoriteSceneModelDelegate

- (void)favoriteSceneModelDidQueryAcupoints {
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

//
//  AcupointCategoryListScene.m
//  HealthyLifestyle
//
//  Created by 找汽配 on 16/7/2.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "AcupointCategoryListScene.h"
#import "AcupointCategoryTableViewCell.h"

@interface AcupointCategoryListScene () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView * tableView;

@property (nonatomic, strong) NSArray * categoryList;

@end

@implementation AcupointCategoryListScene

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.title = @"Acupoint";
    
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

- (NSArray *)categoryList {
    if (!_categoryList) {
        _categoryList = @[@{@"title":@"Browse with meridians",      // 按经脉浏览
                            @"scene":@"MeridianListScene"},
                          @{@"title":@"Browse with position",       // 按位置浏览
                            @"scene":@""},
                          @{@"title":@"Browse with indication",     // 按主治症状浏览
                            @"scene":@"FunctionListScene"},
                          @{@"title":@"Search",
                            @"scene":@""}];
    }
    return _categoryList;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.categoryList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AcupointCategoryTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kAcupointCategoryTableViewCellReuseIdentifier forIndexPath:indexPath];
    NSDictionary * dict = self.categoryList[indexPath.row];
    [cell reloadData:dict[@"title"]];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary * dict = self.categoryList[indexPath.row];
    if (dict[@"scene"]) {
        id scene = [[NSClassFromString(dict[@"scene"]) alloc] initWithNibName:dict[@"scene"] bundle:nil];
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

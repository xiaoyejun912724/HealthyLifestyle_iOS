//
//  AcupointListScene.m
//  HealthyLifestyle
//
//  Created by 找汽配 on 16/7/2.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "AcupointListScene.h"
#import "AcupointTableViewCell.h"
#import "FMDB.h"
#import "AppData.h"
#import "MeridianModel.h"



@interface AcupointListScene () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView * tableView;

@property (nonatomic, strong) NSMutableArray * acupointList;

@end

@implementation AcupointListScene

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
    self.acupointList = [NSMutableArray array];

    if (self.type == AcupointListTypeMeridian) {
        
        NSString * query = [NSString stringWithFormat:@"SELECT * FROM '%@'", MERIDIAN_TABLE_NAME];
        FMResultSet * rs = [[AppData sharedInstance].database executeQuery:query];
        while ([rs next]) {
            MeridianModel * model = [MeridianModel modelWithDict:@{MERIDIAN_COLUMN_ID:[rs stringForColumn:MERIDIAN_COLUMN_ID],
                                                                   MERIDIAN_COLUMN_NAME:[rs stringForColumn:MERIDIAN_COLUMN_NAME]}];
            [self.acupointList addObject:model];
        }
    }
    
    
    
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    [self.tableView registerNib:[UINib nibWithNibName:@"AcupointTableViewCell" bundle:nil] forCellReuseIdentifier:kAcupointTableViewCellReuseIdentifier];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.acupointList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AcupointTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kAcupointTableViewCellReuseIdentifier forIndexPath:indexPath];
    NSDictionary * dict = self.acupointList[indexPath.row];
    [cell reloadData:dict];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary * dict = self.acupointList[indexPath.row];
    if (dict[@"scene"]) {
        id scene = [[NSClassFromString(dict[@"scene"]) alloc] initWithNibName:@"AcupointCategoryListScene" bundle:nil];
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

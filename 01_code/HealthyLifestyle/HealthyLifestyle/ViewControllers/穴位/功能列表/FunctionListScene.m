//
//  FunctionListScene.m
//  HealthyLifestyle
//
//  Created by 找汽配 on 16/7/11.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "FunctionListScene.h"
#import "FunctionTableViewCell.h"
#import "FunctionModel.h"

@interface FunctionListScene () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView * tableView;

@property (nonatomic, strong) NSMutableArray * functionList;

@end

@implementation FunctionListScene

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.title = @"Function";
    
    [self setupScene];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setup

- (void)setupScene {
    self.functionList = [NSMutableArray array];
    
    NSString * query = [NSString stringWithFormat:@"SELECT * FROM '%@'", FUNCTION_TABLE_NAME];
    FMResultSet * rs = [[AppData sharedInstance].database executeQuery:query];
    while ([rs next]) {
        FunctionModel * model = [FunctionModel modelWithDict:@{FUNCTION_COLUMN_ID:[rs stringForColumn:FUNCTION_COLUMN_ID],
                                                               FUNCTION_COLUMN_NAME:[rs stringForColumn:FUNCTION_COLUMN_NAME]}];
        [self.functionList addObject:model];
    }
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    [self.tableView registerNib:[UINib nibWithNibName:@"FunctionTableViewCell" bundle:nil] forCellReuseIdentifier:kFunctionTableViewCellReuseIdentifier];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.functionList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FunctionTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kFunctionTableViewCellReuseIdentifier forIndexPath:indexPath];
    FunctionModel * model = self.functionList[indexPath.row];
    [cell reloadData:model];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary * dict = self.functionList[indexPath.row];
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

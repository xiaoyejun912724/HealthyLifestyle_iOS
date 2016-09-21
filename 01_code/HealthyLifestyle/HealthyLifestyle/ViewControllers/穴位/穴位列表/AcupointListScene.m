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
#import "AcupointModel.h"



@interface AcupointListScene () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView * tableView;

@property (nonatomic, strong) NSMutableArray * acupointList;

@end

@implementation AcupointListScene

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.title = NSLocalizedString(@"穴位", nil);
    
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
        NSString * query = [NSString stringWithFormat:@"SELECT * FROM '%@' WHERE \"meridian_id\" = \"%@\"", ACUPOINT_TABLE_NAME, self.meridianID];
        FMResultSet * rs = [[AppData sharedInstance].database executeQuery:query];
        while ([rs next]) {
            AcupointModel * model = [AcupointModel modelWithDict:@{ACUPOINT_COLUMN_ID:[rs stringForColumn:ACUPOINT_COLUMN_ID],
                                                                   ACUPOINT_COLUMN_NAME:[rs stringForColumn:ACUPOINT_COLUMN_NAME],
                                                                   ACUPOINT_COLUMN_PINYIN:[rs stringForColumn:ACUPOINT_COLUMN_PINYIN],
                                                                   ACUPOINT_COLUMN_CODE:[rs stringForColumn:ACUPOINT_COLUMN_CODE],
                                                                   ACUPOINT_COLUMN_POSITION:[rs stringForColumn:ACUPOINT_COLUMN_POSITION],
                                                                   ACUPOINT_COLUMN_INDICATION:[rs stringForColumn:ACUPOINT_COLUMN_INDICATION],
                                                                   ACUPOINT_COLUMN_COOPERATION:[rs stringForColumn:ACUPOINT_COLUMN_COOPERATION],
                                                                   ACUPOINT_COLUMN_ACUPUNCTURE:[rs stringForColumn:ACUPOINT_COLUMN_ACUPUNCTURE]}];
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
    AcupointModel * model = self.acupointList[indexPath.row];
    AcupointTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kAcupointTableViewCellReuseIdentifier forIndexPath:indexPath];
    [cell reloadData:model];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AcupointModel * model = self.acupointList[indexPath.row];
    
    
    
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

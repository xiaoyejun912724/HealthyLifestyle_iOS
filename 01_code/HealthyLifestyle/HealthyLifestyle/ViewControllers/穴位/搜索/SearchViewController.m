//
//  SearchViewController.m
//  HealthyLifestyle
//
//  Created by 找汽配 on 2016/11/1.
//  Copyright © 2016年 HealthyLifestyle. All rights reserved.
//

#import "SearchViewController.h"
#import "AcupointViewController.h"
#import "SearchSceneModel.h"
#import "SearchTableViewCell.h"

@interface SearchViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, SearchSceneModelDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, weak) UITextField * searchTextField;
@property (nonatomic, strong) SearchSceneModel * sceneModel;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.sceneModel = [SearchSceneModel SceneModel];
    self.sceneModel.delegate = self;
    
    [self setupNavigationItem];
    [self setupView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button Action

- (void)cancelButtonItemAction {
    [self.searchTextField resignFirstResponder];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Setup

- (void)setupNavigationItem {
    UITextField * textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 0.75, 32)];
    textField.layer.cornerRadius = 5;
    textField.layer.borderWidth = 0.5;
    textField.layer.borderColor = [COLOR_DARK_GRAY CGColor];
    textField.leftViewMode = UITextFieldViewModeAlways;
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 28, 32)];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = RGB(160, 160, 160);
    label.text = [IconFont icon:@"ios7Search" fromFont:ionIcons];
    label.font = [IconFont font:ionIcons withSize:18];
    textField.leftView = label;
    textField.font = [UIFont systemFontOfSize:16];
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.tintColor = COLOR_DARK_GRAY;
    textField.placeholder = @"请输入搜索关键字";
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.returnKeyType = UIReturnKeyDone;
    textField.delegate = self;
    self.searchTextField = textField;
    self.navigationItem.titleView = textField;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonItemAction)];
}

- (void)setupView {
    self.tableView.tableFooterView = [[UIView alloc] init];
    [self.tableView registerNib:[UINib nibWithNibName:@"SearchTableViewCell" bundle:nil] forCellReuseIdentifier:kSearchTableViewCellReuseIdentifier];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sceneModel.acupointList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AcupointModel * model = self.sceneModel.acupointList[indexPath.row];
    SearchTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kSearchTableViewCellReuseIdentifier forIndexPath:indexPath];
    [cell reloadData:model];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AcupointModel * model = self.sceneModel.acupointList[indexPath.row];
    [[NSNotificationCenter defaultCenter] postNotificationName:DidSearchAcupointNotification object:self.viewController userInfo:@{@"acupoint":model}];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [self.sceneModel queryAcupointsWithKeyword:textField.text];
    return YES;
}

#pragma mark - SearchSceneModelDelegate

- (void)searchSceneModelDidQueryAcupoints {
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

//
//  AcupointViewController.m
//  HealthyLifestyle
//
//  Created by 找汽配 on 16/9/21.
//  Copyright © 2016年 HealthyLifestyle. All rights reserved.
//

#import "AcupointViewController.h"
#import "AcupointModel.h"
#import "XYEnum.h"
#import "HLNavigationView.h"

@interface AcupointViewController () <HLNavigationViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel * indicationTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel * indicationLabel;
@property (weak, nonatomic) IBOutlet UILabel * positionTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel * positionLabel;
@property (weak, nonatomic) IBOutlet UILabel * compatibilityTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel * compatibilityLabel;
@property (weak, nonatomic) IBOutlet UILabel * acupunctureTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel * acupunctureLabel;

@end

@implementation AcupointViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    NSArray * languages = [NSLocale preferredLanguages];
    if ([[languages firstObject] rangeOfString:@"zh-Hans"].location != NSNotFound) {
        self.title = self.acupointModel.cnName;
    } else {
        self.title = [NSString stringWithFormat:@"%@ %@", self.acupointModel.code, self.acupointModel.pinyin];
    }
    
    [self setupNavigationItem];
    [self setupView];
    [self setupData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setup

- (void)setupNavigationItem {
    [self addMoreButtonItemWithActionTypes:@[@(HLNavigationSelectActionTypeCollect), @(HLNavigationSelectActionTypeSearch)]];
}

- (void)setupView {
    
}

- (void)setupData {
    self.indicationTitleLabel.text = [NSString stringWithFormat:@"【%@】", NSLocalizedString(@"主治", nil)];
    self.positionTitleLabel.text = [NSString stringWithFormat:@"【%@】", NSLocalizedString(@"位置", nil)];
    self.compatibilityTitleLabel.text = [NSString stringWithFormat:@"【%@】", NSLocalizedString(@"配伍", nil)];
    self.acupunctureTitleLabel.text = [NSString stringWithFormat:@"【%@】", NSLocalizedString(@"艾灸", nil)];
    self.indicationLabel.text = self.acupointModel.indication;
    self.positionLabel.text = self.acupointModel.position;
    self.compatibilityLabel.text = self.acupointModel.compatibility;
    self.acupunctureLabel.text = self.acupointModel.acupuncture;
}

#pragma mark - HLNavigationViewDelegate

- (void)navigationViewDidCollect {
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray * favorites = nil;
    NSArray * array = [defaults objectForKey:@"Favorite"];
    if (array) {
        favorites = [array mutableCopy];
    } else {
        favorites = [NSMutableArray array];
    }
    if (![favorites containsObject:self.acupointModel.acupointID]) {
        [favorites insertObject:self.acupointModel.acupointID atIndex:0];
        [defaults setObject:favorites forKey:@"Favorite"];
        [self presentAlertWithTitle:@"收藏成功" message:nil dismissAfterDelay:PRESENT_DELAY completion:nil];
    } else {
        [self presentAlertWithTitle:@"该穴位已收藏" message:nil dismissAfterDelay:PRESENT_DELAY completion:nil];
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

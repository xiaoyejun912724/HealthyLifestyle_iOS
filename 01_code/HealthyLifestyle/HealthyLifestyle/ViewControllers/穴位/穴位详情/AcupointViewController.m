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

@property (weak, nonatomic) IBOutlet UITextView * meridian_text_view;
@property (weak, nonatomic) IBOutlet UITextView * position_text_view;
@property (weak, nonatomic) IBOutlet UITextView * function_text_view;

@property (weak, nonatomic) IBOutlet UILabel * indicationTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel * indicationLabel;
@property (weak, nonatomic) IBOutlet UILabel * positionTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel * positionLabel;
@property (weak, nonatomic) IBOutlet UILabel * compatibilityTitleLabel;
@property (weak, nonatomic) IBOutlet UITextView * compatibilityTextView;
@property (weak, nonatomic) IBOutlet UILabel * acupunctureTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel * acupunctureLabel;

@property (nonatomic, strong) AcupointModel * acupointModel;

@end

@implementation AcupointViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    [self setupNavigationItem];
    [self setupView];
    
    [self queryAcupointWithAcupointID:self.acupointID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Data

- (void)queryAcupointWithAcupointID:(NSString *)acupointID {
    [[AppData sharedInstance].databaseQueue inDatabase:^(FMDatabase *db) {
        if ([db open]) {
            NSString * query = [NSString stringWithFormat:@"SELECT * FROM `%@` WHERE `%@` = '%@'", ACUPOINT_TABLE_NAME, ACUPOINT_COLUMN_ID, self.acupointID];
            FMResultSet * rs = [db executeQuery:query];
            while ([rs next]) {
                AcupointModel * model = [AcupointModel modelWithDict:@{ACUPOINT_COLUMN_ID:[rs stringForColumn:ACUPOINT_COLUMN_ID] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_MERIDIANID:[rs stringForColumn:ACUPOINT_COLUMN_MERIDIANID] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_MERIDIANNAME:[rs stringForColumn:ACUPOINT_COLUMN_MERIDIANNAME] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_POSITIONID:[rs stringForColumn:ACUPOINT_COLUMN_POSITIONID] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_POSITIONNAME:[rs stringForColumn:ACUPOINT_COLUMN_POSITIONNAME] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_FUNCTIONID:[rs stringForColumn:ACUPOINT_COLUMN_FUNCTIONID] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_FUNCTIONNAME:[rs stringForColumn:ACUPOINT_COLUMN_FUNCTIONNAME] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_NAME:[rs stringForColumn:ACUPOINT_COLUMN_NAME] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_PINYIN:[rs stringForColumn:ACUPOINT_COLUMN_PINYIN] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_CODE:[rs stringForColumn:ACUPOINT_COLUMN_CODE] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_POSITION:[rs stringForColumn:ACUPOINT_COLUMN_POSITION] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_INDICATION:[rs stringForColumn:ACUPOINT_COLUMN_INDICATION] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_COMPATIBILITY:[rs stringForColumn:ACUPOINT_COLUMN_COMPATIBILITY] ?: [NSNull null],
                                                                       ACUPOINT_COLUMN_ACUPUNCTURE:[rs stringForColumn:ACUPOINT_COLUMN_ACUPUNCTURE] ?: [NSNull null]}];
                self.acupointModel = model;
            }
            [self setupData];
        };
    }];
}

#pragma mark - Setup

- (void)setupNavigationItem {
    [self addMoreButtonItemWithActionTypes:@[@(HLNavigationSelectActionTypeCollect), @(HLNavigationSelectActionTypeSearch)]];
}

- (void)setupView {
    
}

- (void)setupData {
    NSArray * languages = [NSLocale preferredLanguages];
    if ([[languages firstObject] rangeOfString:@"zh-Hans"].location != NSNotFound) {
        self.title = self.acupointModel.cnName;
    } else {
        self.title = [NSString stringWithFormat:@"%@ %@", self.acupointModel.code, self.acupointModel.pinyin];
    }
    NSDictionary * options = @{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType};
    NSString * str = [NSString stringWithFormat:@"<font size=\"4\">经脉：<a href=\"HealthyLifestyle://acupoint_list?type=%ld&meridianID=%@&title=%@\" style=\"text-decoration:none;\">%@</a></font>", AcupointListTypeMeridian, self.acupointModel.meridianID ?: @"", self.acupointModel.meridianName ?: @"", self.acupointModel.meridianName ?: @""];
    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[str dataUsingEncoding:NSUnicodeStringEncoding] options:options documentAttributes:nil error:nil];
    self.meridian_text_view.attributedText = attrStr;
    str = [NSString stringWithFormat:@"<font size=\"4\">位置：<a href=\"HealthyLifestyle://acupoint_list?type=%ld&positionID=%@&title=%@\" style=\"text-decoration:none;\">%@</a></font>", AcupointListTypePosition, self.acupointModel.positionID ?: @"", self.acupointModel.positionName ?: @"", self.acupointModel.positionName ?: @""];
    attrStr = [[NSAttributedString alloc] initWithData:[str dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    self.position_text_view.attributedText = attrStr;
    str = [NSString stringWithFormat:@"<font size=\"4\">功效：<a href=\"HealthyLifestyle://acupoint_list?type=%ld&functionID=%@&title=%@\" style=\"text-decoration:none;\">%@</a></font>", AcupointListTypeFunction, self.acupointModel.functionID ?: @"", self.acupointModel.functionName ?: @"", self.acupointModel.functionName ?: @""];
    attrStr = [[NSAttributedString alloc] initWithData:[str dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    self.function_text_view.attributedText = attrStr;
    self.indicationTitleLabel.text = [NSString stringWithFormat:@"【%@】", NSLocalizedString(@"主治", nil)];
    self.positionTitleLabel.text = [NSString stringWithFormat:@"【%@】", NSLocalizedString(@"位置", nil)];
    self.compatibilityTitleLabel.text = [NSString stringWithFormat:@"【%@】", NSLocalizedString(@"配伍", nil)];
    self.acupunctureTitleLabel.text = [NSString stringWithFormat:@"【%@】", NSLocalizedString(@"艾灸", nil)];
    self.indicationLabel.text = self.acupointModel.indication;
    self.positionLabel.text = self.acupointModel.position;
    str = [NSString stringWithFormat:@"<font size=\"4\">%@</font>", self.acupointModel.compatibility ?: @""];
    attrStr = [[NSAttributedString alloc] initWithData:[str dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    self.compatibilityTextView.attributedText = attrStr;
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

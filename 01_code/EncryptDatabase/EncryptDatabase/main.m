//
//  main.m
//  EncryptDatabase
//
//  Created by 找汽配 on 2016/12/1.
//  Copyright © 2016年 HealthyLifestyle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppData.h"
#import "NSString+Encrypt.h"
#import "NSData+Encrypt.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        NSString * key = @"0CAA40408EFCE2CB240CC99E943FB671";
//        NSString * string = @"你好，世界！";
//        NSString * encrypt_string = [string AES256EncryptWithKey:key];
//        NSString * decrypt_string = [encrypt_string AES256DecryptWithKey:key];
//        NSLog(@"%@\n%@\n%@", string, encrypt_string, decrypt_string);
        
        
        [[AppData sharedInstance].databaseQueue inDatabase:^(FMDatabase *db) {
            /*
            if ([db open]) {
                NSInteger start = 0;
                while (YES) {
                    NSString * sql = [NSString stringWithFormat:@"SELECT `id`, `position`, `cn_position`, `indication`, `cn_indication`, `compatibility`, `cn_compatibility`, `acupuncture`, `cn_acupuncture` FROM `Acupoint` LIMIT %ld, 20", start];
                    FMResultSet * rs = [db executeQuery:sql];
                    BOOL selected = NO;
                    while ([rs next]) {
                        selected = YES;
                        NSString * key = @"0CAA40408EFCE2CB240CC99E943FB671";
                        NSString * acupoint_id = [rs stringForColumn:@"id"];
                        NSString * position = [rs stringForColumn:@"position"];
                        if (position && position != [NSNull null] && position.length > 0) {
                            position = [position AES256EncryptWithKey:key];
                        } else {
                            position = @"";
                        }
                        NSString * cn_position = [rs stringForColumn:@"cn_position"];
                        if (cn_position && cn_position != [NSNull null] && cn_position.length > 0) {
                            cn_position = [cn_position AES256EncryptWithKey:key];
                        } else {
                            cn_position = @"";
                        }
                        NSString * indication = [rs stringForColumn:@"indication"];
                        if (indication && indication != [NSNull null] && indication.length > 0) {
                            indication = [indication AES256EncryptWithKey:key];
                        } else {
                            indication = @"";
                        }
                        NSString * cn_indication = [rs stringForColumn:@"cn_indication"];
                        if (cn_indication && cn_indication != [NSNull null] && cn_indication.length > 0) {
                            cn_indication = [cn_indication AES256EncryptWithKey:key];
                        } else {
                            cn_indication = @"";
                        }
                        NSString * compatibility = [rs stringForColumn:@"compatibility"];
                        if (compatibility && compatibility != [NSNull null] && compatibility.length > 0) {
                            compatibility = [compatibility AES256EncryptWithKey:key];
                        } else {
                            compatibility = @"";
                        }
                        NSString * cn_compatibility = [rs stringForColumn:@"cn_compatibility"];
                        if (cn_compatibility && cn_compatibility != [NSNull null] && cn_compatibility.length > 0) {
                            cn_compatibility = [cn_compatibility AES256EncryptWithKey:key];
                        } else {
                            cn_compatibility = @"";
                        }
                        NSString * acupuncture = [rs stringForColumn:@"acupuncture"];
                        if (acupuncture && acupuncture != [NSNull null] && acupuncture.length > 0) {
                            acupuncture = [acupuncture AES256EncryptWithKey:key];
                        } else {
                            acupuncture = @"";
                        }
                        NSString * cn_acupuncture = [rs stringForColumn:@"cn_acupuncture"];
                        if (cn_acupuncture && cn_acupuncture != [NSNull null] && cn_acupuncture.length > 0) {
                            cn_acupuncture = [cn_acupuncture AES256EncryptWithKey:key];
                        } else {
                            cn_acupuncture = @"";
                        }
                        NSString * sql = [NSString stringWithFormat:@"UPDATE `Acupoint` SET `position`='%@', `cn_position`='%@', `indication`='%@', `cn_indication`='%@', `compatibility`='%@', `cn_compatibility`='%@', `acupuncture`='%@', `cn_acupuncture`='%@' WHERE `id`='%@';", position, cn_position, indication, cn_indication, compatibility, cn_compatibility, acupuncture, cn_acupuncture, acupoint_id];
                        NSLog(@"%@", sql);
                        [db executeUpdate:sql];
                        NSLog(@"%@", [db lastErrorMessage]);
                    }
                    if (!selected) {
                        break;
                    }
                    start += 20;
                }
            };
            [db close];
            */
            
            NSString * key = @"EAB01680929CC37E1A8A71A6C1C13AAB";
            NSString * filePath = @"/Users/zqp-ios-development/Desktop/HealthyLifestyle/HealthyLifestyle_iOS/04_database/Acupoint_encrypt.db";
            NSData * fileData = [NSData dataWithContentsOfFile:filePath];
            NSData * encryptData = [fileData AES256EncryptWithKey:key];
            [encryptData writeToFile:@"/Users/zqp-ios-development/Desktop/HealthyLifestyle/HealthyLifestyle_iOS/04_database/Acupoint_encrypt.data" atomically:YES];
        }];
        
    }
    return 0;
}

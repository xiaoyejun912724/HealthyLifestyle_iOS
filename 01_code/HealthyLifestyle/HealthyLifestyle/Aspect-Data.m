//
//  Aspect-Appearance.m
//  EasyIOSDemo
//
//  Created by baiye on 15/10/1.
//  Copyright © 2015年 baiye. All rights reserved.
//

#import "AppDelegate.h"
#import <XAspect/XAspect.h>
#import "NSData+Encrypt.h"

#define AtAspect Data

#define AtAspectOfClass AppDelegate

@classPatchField(AppDelegate)

AspectPatch(-, BOOL, application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions) {
    NSLog(@"Aspect Data");

    NSString * path = [[NSBundle mainBundle] pathForResource:@"Acupoint" ofType:@"data"];
    NSData * encryptData = [NSData dataWithContentsOfFile:path];
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentDirectory = [paths firstObject];
    NSString * dbPath = [documentDirectory stringByAppendingPathComponent:@"Acupoint.db"];
    NSString * key = @"EAB01680929CC37E1A8A71A6C1C13AAB";
    NSData * decryptData = [encryptData AES256DecryptWithKey:key];
    [decryptData writeToFile:dbPath atomically:YES];
    
    return XAMessageForward(application:application didFinishLaunchingWithOptions:launchOptions);
}

@end

#undef AtAspectOfClass

#undef AtAspect

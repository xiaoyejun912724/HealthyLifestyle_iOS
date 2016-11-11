//
//  Aspect-Appearance.m
//  EasyIOSDemo
//
//  Created by baiye on 15/10/1.
//  Copyright © 2015年 baiye. All rights reserved.
//

#import "AppDelegate.h"
#import <XAspect/XAspect.h>

#define AtAspect Appearance

#define AtAspectOfClass AppDelegate

@classPatchField(AppDelegate)

AspectPatch(-, BOOL, application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions) {
    NSLog(@"Aspect Appearance");

    NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"URLManager" ofType:@"plist"];
    [URLManager loadConfigFromPlist:plistPath];
    
    [UINavigationBar appearance].translucent = NO;
    
    return XAMessageForward(application:application didFinishLaunchingWithOptions:launchOptions);
}

@end

#undef AtAspectOfClass

#undef AtAspect

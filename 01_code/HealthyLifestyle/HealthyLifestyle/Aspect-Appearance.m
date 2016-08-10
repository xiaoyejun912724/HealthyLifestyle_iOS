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

    [UINavigationBar appearance].translucent = NO;
    
    return XAMessageForward(application:application didFinishLaunchingWithOptions:launchOptions);
}

@end

#undef AtAspectOfClass

#undef AtAspect

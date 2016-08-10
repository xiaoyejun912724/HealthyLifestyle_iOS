//
//  Aspect-Window.m
//  EasyIOSDemo
//
//  Created by baiye on 15/10/1.
//  Copyright © 2015年 baiye. All rights reserved.
//

#import "AppDelegate.h"
#import <XAspect/XAspect.h>
#import "TabBarController.h"

#define AtAspect Window

#define AtAspectOfClass AppDelegate

@classPatchField(AppDelegate)

AspectPatch(-, BOOL, application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions) {
    NSLog(@"Aspect Window");
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[TabBarController alloc] init];
    [self.window makeKeyAndVisible];

    return XAMessageForward(application:application didFinishLaunchingWithOptions:launchOptions);
}

@end

#undef AtAspectOfClass

#undef AtAspect

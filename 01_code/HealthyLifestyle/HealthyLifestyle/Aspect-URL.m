//
//  Aspect-Appearance.m
//  EasyIOSDemo
//
//  Created by baiye on 15/10/1.
//  Copyright © 2015年 baiye. All rights reserved.
//

#import "AppDelegate.h"
#import <XAspect/XAspect.h>

#define AtAspect URL

#define AtAspectOfClass AppDelegate

@classPatchField(AppDelegate)

AspectPatch(-, BOOL, application:(UIApplication *)application handleOpenURL:(NSURL *)url) {
    
    NSLog(@"url 1 %@", url);
    
    return XAMessageForward(application:application handleOpenURL:url);
}

AspectPatch(-, BOOL, application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation) {
    
    NSLog(@"url 2 %@", url);
    
    return XAMessageForward(application:application openURL:url sourceApplication:sourceApplication annotation:annotation);
}

AspectPatch(-, BOOL, application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options) {
    
    NSLog(@"url 3 %@", url);
    
    return XAMessageForward(application:app openURL:url options:options);
}

@end

#undef AtAspectOfClass

#undef AtAspect

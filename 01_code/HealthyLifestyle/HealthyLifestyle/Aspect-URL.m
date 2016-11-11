//
//  Aspect-Appearance.m
//  EasyIOSDemo
//
//  Created by baiye on 15/10/1.
//  Copyright © 2015年 baiye. All rights reserved.
//

#import "AppDelegate.h"
#import <XAspect/XAspect.h>
#import "HLURLManager.h"

#define AtAspect URL

#define AtAspectOfClass AppDelegate

@classPatchField(AppDelegate)

AspectPatch(-, BOOL, application:(UIApplication *)application handleOpenURL:(NSURL *)url) {
    
    HLURLManager * manager = [HLURLManager sharedManager];
    if (manager.delegate && [manager.delegate respondsToSelector:@selector(urlManagerDidRecvURL:)]) {
        [manager.delegate urlManagerDidRecvURL:url];
    }
    
    return XAMessageForward(application:application handleOpenURL:url);
}

AspectPatch(-, BOOL, application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation) {
    
    HLURLManager * manager = [HLURLManager sharedManager];
    if (manager.delegate && [manager.delegate respondsToSelector:@selector(urlManagerDidRecvURL:)]) {
        [manager.delegate urlManagerDidRecvURL:url];
    }
    
    return XAMessageForward(application:application openURL:url sourceApplication:sourceApplication annotation:annotation);
}

AspectPatch(-, BOOL, application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options) {
    
    HLURLManager * manager = [HLURLManager sharedManager];
    if (manager.delegate && [manager.delegate respondsToSelector:@selector(urlManagerDidRecvURL:)]) {
        [manager.delegate urlManagerDidRecvURL:url];
    }
    
    return XAMessageForward(application:app openURL:url options:options);
}

@end

#undef AtAspectOfClass

#undef AtAspect

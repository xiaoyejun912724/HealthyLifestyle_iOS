//
//  NSString+HL.m
//  HealthyLifestyle
//
//  Created by 找汽配 on 2016/11/11.
//  Copyright © 2016年 HealthyLifestyle. All rights reserved.
//

#import "NSString+HL.h"

@implementation NSString (HL)

+ (NSString *)stringWithHTML:(NSString *)html {
    NSScanner * scanner = [NSScanner scannerWithString:html];
    NSString * text = nil;
    while (![scanner isAtEnd]) {
        [scanner scanUpToString:@"<" intoString:nil];
        [scanner scanUpToString:@">" intoString:&text];
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }
    return html;
}

@end

//
//  Web.m
//  HealthyLifestyle
//
//  Created by 找汽配 on 2016/12/3.
//  Copyright © 2016年 HealthyLifestyle. All rights reserved.
//

#import "HLTextView.h"

@implementation HLTextView

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    [self resignFirstResponder];
    return NO;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

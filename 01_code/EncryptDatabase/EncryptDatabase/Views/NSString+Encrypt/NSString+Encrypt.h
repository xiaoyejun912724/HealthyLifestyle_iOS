//
//  Encrypt.h
//  HealthyLifestyle
//
//  Created by 找汽配 on 2016/11/30.
//  Copyright © 2016年 HealthyLifestyle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Encrypt)

// 加密
- (NSString *)AES256EncryptWithKey:(NSString *)key;
// 解密
- (NSString *)AES256DecryptWithKey:(NSString *)key;

@end

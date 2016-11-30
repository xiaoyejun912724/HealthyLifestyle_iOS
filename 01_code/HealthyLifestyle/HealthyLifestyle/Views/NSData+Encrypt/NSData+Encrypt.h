//
//  Encrypt.h
//  HealthyLifestyle
//
//  Created by 找汽配 on 2016/11/30.
//  Copyright © 2016年 HealthyLifestyle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Encrypt)

// 加密
- (NSData *)AES256EncryptWithKey:(NSString *)key;
// 解密
- (NSData *)AES256DecryptWithKey:(NSString *)key;

@end

//
//  NSData+AES128TL.h
//  HelloWord
//
//  Created by admin on 2019/4/23.
//  Copyright © 2019年 008. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (AES128TL)

/**
 *  加密
 *
 *  @param key 公钥
 *  @param iv  偏移量
 *
 *  @return 加密之后的NSData
 */
- (NSData *)AES128EncryptWithKey:(NSString *)key iv:(NSString *)iv;
/**
 *  解密
 *
 *  @param key 公钥
 *  @param iv  偏移量
 *
 *  @return 解密之后的NSData
 */
- (NSData *)AES128DecryptWithKey:(NSString *)key iv:(NSString *)iv;

@end

NS_ASSUME_NONNULL_END

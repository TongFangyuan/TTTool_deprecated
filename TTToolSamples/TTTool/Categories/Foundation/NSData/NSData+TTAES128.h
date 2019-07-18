//
//  NSData+TTAES128.h
//  Apple
//
//  Created by Tong on 2019/7/18.
//  Copyright © 2019 tongfy. All rights reserved.
//
//  AES128 加密
//
//  参考资料
//  https://www.jianshu.com/p/93466b31f675
//  https://github.com/yuanshuainiuniu/AES128ECB/blob/master/FBEncryptorAES.h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (TTAES128)

/**
 AES128 ECB 加密

 @param data 需要加密的数据
 @param key 密钥
 @return 加密后的数据
 */
+ (NSData *)tt_AES128ECBEncryptData:(NSData *)data key:(NSData *)key;

/**
 AES128 ECB 解密

 @param data 需要解密的数据
 @param key 密钥
 @return 解密后的数据
 */
+ (NSData *)tt_AES128ECBDecryptData:(NSData *)data key:(NSData *)key;

/**
 AES128 PKCS7 加密
 
 @param data 需要加密的数据
 @param key 密钥
 @return 加密后的数据
 */
+ (NSData *)tt_AES128PKCS7EncryptData:(NSData *)data key:(NSData *)key;

/**
 AES128 PKCS7 解密
 
 @param data 需要解密的数据
 @param key 密钥
 @return 解密后的数据
 */
+ (NSData *)tt_AES128PKCS7DecryptData:(NSData *)data key:(NSData *)key;

/**
 AES128  ECB、PKCS7两种兼容模式加密

 @param data 需要加密的数据
 @param key 密钥
 @return 加密后的数据
 */
+ (NSData *)tt_AES128EncryptData:(NSData *)data key:(NSData *)key;

/**
 AES128  ECB、PKCS7两种兼容模式解密

 @param data 需要解密的数据
 @param key 密钥
 @return 解密后的数据
 */
+ (NSData *)tt_AES128DecryptData:(NSData *)data key:(NSData *)key;


@end

NS_ASSUME_NONNULL_END

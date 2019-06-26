//
//  TTEncryptioner.h
//  Host
//
//  Created by 童方园 on 2019/5/30.
//  Copyright © 2019 童方园. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//          ---------参数---------
//          |   密码（key）:encrypt123456789
//          |   偏移量（iv）:edecrypt12345678
//          |   加密模式：CBC
//          |   填充：PKCS7Padding
//          |   编码：utf-8
//          ---------加密----------
//          |   输入：手机回收加密测试
//          |   加密：5b73a4ae6ab2a698b6a22ccc449fc24dfc08baf9754cc40b4cc2d8d9e18afab2
//          ----------------------

@interface TTAES128Encrypter : NSObject

+ (instancetype)share;

/**
 key  @"key值 16位长度的字符串"
 */
@property (nonatomic, copy) NSString *key;

/**
 iv  @"偏移量 16位长度的字符串"
 */
@property (nonatomic, copy) NSString *iv;


/**
 *  加密
 *
 *  @param string 需要加密的string
 *
 *  @return 加密后的字符串
 */
- (NSString *)encryptStrig:(NSString *)string;


/**
 *  解密
 *
 *  @param string 加密的字符串
 *
 *  @return 解密后的内容
 */
- (NSString *)decryptString:(NSString *)string;

@end

NS_ASSUME_NONNULL_END

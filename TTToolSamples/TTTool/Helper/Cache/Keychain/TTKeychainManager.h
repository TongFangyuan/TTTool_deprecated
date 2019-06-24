//
//  TTKeychainManager.h
//  TTToolSamples
//
//  Created by Tong on 2019/6/24.
//  Copyright © 2019 tongfy. All rights reserved.
//
//  钥匙串存储
//  数据保存在钥匙串，app卸载掉后再次安装也能获取到之前存储的数据
//  相关用途
//  1. 设备唯一标识
//  2. 用户上次登录方式（如微信、QQ、微博等等）
//  3. 用户登录名，提高用户体验

#import <Foundation/Foundation.h>

#ifndef kKeychainWrite
    #define kKeychainWrite(k,v)    [TTKeychainManager.shareManager savePassword:v forAccount:k]
#endif

#ifndef kKeychainRead
    #define kKeychainRead(k)       [TTKeychainManager.shareManager readPasswordForAccount:k]
#endif

NS_ASSUME_NONNULL_BEGIN

@interface TTKeychainManager : NSObject

+ (nonnull instancetype)shareManager;

/**
 服务，一个app对应一个服务，默认为bundleID
 */
@property (nonatomic, copy) NSString *service;

/**
 保存密码

 @param password 密码
 @param account  账户
 */
- (void)savePassword:(NSString *)password forAccount:(NSString *)account;

/**
 读取密码

 @param account 账户名称
 */
- (NSString *)readPasswordForAccount:(NSString *)account;


/**
 读取设备唯一标识
 */
+ (NSString *)readDeviceID;

@end

NS_ASSUME_NONNULL_END

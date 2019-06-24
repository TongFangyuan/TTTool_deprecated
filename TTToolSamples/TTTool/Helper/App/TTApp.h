//
//  TTAppTool.h
//  HelloWord
//
//  Created by admin on 2018/7/17.
//  Copyright © 2018年 008. All rights reserved.
//
//
//

#import <Foundation/Foundation.h>

/**
 * 获取App版本号信息等
 */
@interface TTApp : NSObject

/// 获取App的版本号
+ (NSString *)appVersion;
/// 获取App的build版本
+ (NSString *)appBuildVersion;
/// 获取App的名称
+ (NSString *)appName;
/// 手机型号
+ (NSString *)getDeviceName;
/// 获取系统内存（单位GB）
+ (float)getTotalMemorySize;
/// 获取手机容量（单位GB）
+ (float)getTotalDiskSize;
@end

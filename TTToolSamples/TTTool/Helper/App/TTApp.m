//
//  TTAppTool.m
//  HelloWord
//
//  Created by admin on 2018/7/17.
//  Copyright © 2018年 008. All rights reserved.
//

#import "TTApp.h"
#import <sys/utsname.h>
#include <sys/param.h>
#include <sys/mount.h>
#import <LocalAuthentication/LocalAuthentication.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>

@implementation TTApp

+ (void)saveObject:(id)object forKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (id)objectForKey:(NSString *)key
{
    return [NSUserDefaults.standardUserDefaults objectForKey:key];
}

+ (NSString *)appVersion
{
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    return [infoDic objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)appBuildVersion
{
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    return [infoDic objectForKey:@"CFBundleVersion"];
}

+ (NSString *)appName {
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    return [infoDic objectForKey:@"CFBundleDisplayName"];
}

+ (NSString *)getModel
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString * platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    return platform;
}

+ (NSString *)getDeviceName {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString * platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    if([platform isEqualToString:@"iPhone1,1"])  return@"iPhone 2G";
    if([platform isEqualToString:@"iPhone1,2"])  return@"iPhone 3G";
    if([platform isEqualToString:@"iPhone2,1"])  return@"iPhone 3GS";
    if([platform isEqualToString:@"iPhone3,1"])  return@"iPhone 4";
    if([platform isEqualToString:@"iPhone3,2"])  return@"iPhone 4";
    if([platform isEqualToString:@"iPhone3,3"])  return@"iPhone 4";
    if([platform isEqualToString:@"iPhone4,1"])  return@"iPhone 4S";
    if([platform isEqualToString:@"iPhone5,1"])  return@"iPhone 5";
    if([platform isEqualToString:@"iPhone5,2"])  return@"iPhone 5";
    if([platform isEqualToString:@"iPhone5,3"])  return@"iPhone 5c";
    if([platform isEqualToString:@"iPhone5,4"])  return@"iPhone 5c";
    if([platform isEqualToString:@"iPhone6,1"])  return@"iPhone 5s";
    if([platform isEqualToString:@"iPhone6,2"])  return@"iPhone 5s";
    if([platform isEqualToString:@"iPhone7,1"])  return@"iPhone 6 Plus";
    if([platform isEqualToString:@"iPhone7,2"])  return@"iPhone 6";
    if([platform isEqualToString:@"iPhone8,1"])  return@"iPhone 6s";
    if([platform isEqualToString:@"iPhone8,2"])  return@"iPhone 6s Plus";
    if([platform isEqualToString:@"iPhone8,4"])  return@"iPhone SE";
    if([platform isEqualToString:@"iPhone9,1"])  return@"iPhone 7";
    if([platform isEqualToString:@"iPhone9,3"])  return@"iPhone 7";
    if([platform isEqualToString:@"iPhone9,2"])  return@"iPhone 7 Plus";
    if([platform isEqualToString:@"iPhone9,4"])  return@"iPhone 7 Plus";
    if([platform isEqualToString:@"iPhone10,1"]) return@"iPhone 8";
    if([platform isEqualToString:@"iPhone10,4"]) return@"iPhone 8";
    if([platform isEqualToString:@"iPhone10,2"]) return@"iPhone 8 Plus";
    if([platform isEqualToString:@"iPhone10,5"]) return@"iPhone 8 Plus";
    if([platform isEqualToString:@"iPhone10,3"]) return@"iPhone X";
    if([platform isEqualToString:@"iPhone10,6"]) return@"iPhone X";
    if([platform isEqualToString:@"iPhone11,8"]) return@"iPhone XR";
    if([platform isEqualToString:@"iPhone11,2"]) return@"iPhone XS";
    if([platform isEqualToString:@"iPhone11,6"]) return@"iPhone XS Max";

    if([platform isEqualToString:@"iPod1,1"])  return@"iPod Touch 1G";
    if([platform isEqualToString:@"iPod2,1"])  return@"iPod Touch 2G";
    if([platform isEqualToString:@"iPod3,1"])  return@"iPod Touch 3G";
    if([platform isEqualToString:@"iPod4,1"])  return@"iPod Touch 4G";
    if([platform isEqualToString:@"iPod5,1"])  return@"iPod Touch 5G";
    if([platform isEqualToString:@"iPad1,1"])  return@"iPad 1G";
    if([platform isEqualToString:@"iPad2,1"])  return@"iPad 2";
    if([platform isEqualToString:@"iPad2,2"])  return@"iPad 2";
    if([platform isEqualToString:@"iPad2,3"])  return@"iPad 2";
    if([platform isEqualToString:@"iPad2,4"])  return@"iPad 2";
    if([platform isEqualToString:@"iPad2,5"])  return@"iPad Mini 1G";
    if([platform isEqualToString:@"iPad2,6"])  return@"iPad Mini 1G";
    if([platform isEqualToString:@"iPad2,7"])  return@"iPad Mini 1G";
    if([platform isEqualToString:@"iPad3,2"])  return@"iPad 3";
    if([platform isEqualToString:@"iPad3,3"])  return@"iPad 3";
    if([platform isEqualToString:@"iPad3,4"])  return@"iPad 4";
    if([platform isEqualToString:@"iPad3,5"])  return@"iPad 4";
    if([platform isEqualToString:@"iPad3,6"])  return@"iPad 4";
    if([platform isEqualToString:@"iPad4,1"])  return@"iPad Air";
    if([platform isEqualToString:@"iPad4,2"])  return@"iPad Air";
    if([platform isEqualToString:@"iPad4,3"])  return@"iPad Air";
    if([platform isEqualToString:@"iPad4,4"])  return@"iPad Mini 2G";
    if([platform isEqualToString:@"iPad4,5"])  return@"iPad Mini 2G";
    if([platform isEqualToString:@"iPad4,6"])  return@"iPad Mini 2G";
    if([platform isEqualToString:@"iPad4,7"])  return@"iPad Mini 3";
    if([platform isEqualToString:@"iPad4,8"])  return@"iPad Mini 3";
    if([platform isEqualToString:@"iPad4,9"])  return@"iPad Mini 3";
    if([platform isEqualToString:@"iPad5,1"])  return@"iPad Mini 4";
    if([platform isEqualToString:@"iPad5,2"])  return@"iPad Mini 4";
    if([platform isEqualToString:@"iPad5,3"])  return@"iPad Air 2";
    if([platform isEqualToString:@"iPad5,4"])  return@"iPad Air 2";
    if([platform isEqualToString:@"iPad6,3"])  return@"iPad Pro 9.7";
    if([platform isEqualToString:@"iPad6,4"])  return@"iPad Pro 9.7";
    if([platform isEqualToString:@"iPad6,7"])  return@"iPad Pro 12.9";
    if([platform isEqualToString:@"iPad6,8"])  return@"iPad Pro 12.9";
    if([platform isEqualToString:@"i386"])  return@"iPhone Simulator";
    if([platform isEqualToString:@"x86_64"])  return@"iPhone Simulator";
    return platform;
}


+ (float)getTotalMemorySize {
    NSProcessInfo *processInfo = [NSProcessInfo processInfo];
    long long size = processInfo.physicalMemory;
    CGFloat KB = 1024.0;
    CGFloat MB = KB*KB;
    CGFloat GB = MB*KB;
    return size/GB;
}

+ (float)getTotalDiskSize
{
    struct statfs buf;
    unsigned long long freeSpace = -1;
    if (statfs("/var", &buf) >= 0)
    {
        freeSpace = (unsigned long long)(buf.f_bsize * buf.f_blocks);
    }

    CGFloat KB = 1000.0;
    CGFloat MB = KB*KB;
    CGFloat GB = MB*KB;
    
    return freeSpace/GB;
}

+ (BOOL)isSupportFaceID
{
    BOOL isSupportFaceID = NO;
    LAContext *myContext = [[LAContext alloc] init];
    if (@available(iOS 11.0, *)) {
        if (myContext.biometryType==LABiometryTypeFaceID) {
            isSupportFaceID = YES;
        }
    }
    return isSupportFaceID;
}

+ (BOOL)isSIMInstalled
{
    CTTelephonyNetworkInfo *networkInfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [networkInfo subscriberCellularProvider];
    if (!carrier.isoCountryCode) {
        NSLog(@"没有安装SIM卡");
        return NO;
    }else{
        NSLog(@"有安装SIM卡");
        return YES;
    }
    
}
@end

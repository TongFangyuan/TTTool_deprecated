//
//  TTKeychainManager.m
//  TTToolSamples
//
//  Created by Tong on 2019/6/24.
//  Copyright © 2019 tongfy. All rights reserved.
//
//  依赖源码 https://github.com/samsoffes/sskeychain
//
#import "TTKeychainManager.h"
#import "SSKeychain.h"

#define kDeviceIDAccount @"DeviceIDAccount"

@implementation TTKeychainManager

+ (nonnull instancetype)shareManager{
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    return instance;
}

- (instancetype)init {
    if (self=[super init]) {
        self.service = [[NSBundle mainBundle] bundleIdentifier];
    }
    return self;
}

- (void)savePassword:(NSString *)password forAccount:(NSString *)account {
    [SSKeychain setPassword:password forService:self.service  account:account];
}

- (NSString *)readPasswordForAccount:(NSString *)account {
    return [SSKeychain passwordForService:self.service account:account];
}


+ (NSString *)readDeviceID {

    NSString * deviceID = [TTKeychainManager.shareManager readPasswordForAccount:kDeviceIDAccount];
    if (deviceID == nil || [deviceID isEqualToString:@""]) {
        NSUUID * currentDeviceUUID = [UIDevice currentDevice].identifierForVendor;
        deviceID = currentDeviceUUID.UUIDString;
        deviceID = [deviceID stringByReplacingOccurrencesOfString:@"-" withString:@""];
        deviceID = [deviceID lowercaseString];
        [TTKeychainManager.shareManager savePassword:deviceID forAccount:kDeviceIDAccount];
    }
    return deviceID;
}

@end

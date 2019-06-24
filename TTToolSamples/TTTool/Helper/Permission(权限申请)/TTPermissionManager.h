//
//  TTPermissionManager.h
//  VoiceCollection
//
//  Created by Tong on 2019/6/19.
//  Copyright © 2019 ZhouJinhua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Speech/Speech.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^TTPermissionBlock)(BOOL isAuth);

@interface TTPermissionManager : NSObject

+ (instancetype)sharePermissionManager;

#pragma mark - 语音识别权限
+ (void)requestSpeechRecognizerAuth:(TTPermissionBlock)block;

#pragma mark - 麦克风权限
+ (void)requestMicrophoneAuth:(TTPermissionBlock)block;

#pragma mark - 定位权限
+ (void)requestLocationWhenInUseAuth:(TTPermissionBlock)block;
+ (void)requestLocationAlwaysAuth:(TTPermissionBlock)block;

#pragma mark - 相机权限
+ (void)requestCameraAuth:(TTPermissionBlock)block;

#pragma mark - 相册权限
+ (void)requestPhotoLibraryAuth:(TTPermissionBlock)block;

#pragma mark - 通讯录权限
+ (void)requestAddressBookAuth:(TTPermissionBlock)block;

@end

NS_ASSUME_NONNULL_END

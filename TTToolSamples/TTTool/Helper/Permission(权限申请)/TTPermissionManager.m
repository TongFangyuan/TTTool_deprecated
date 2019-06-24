//
//  TTPermissionManager.m
//  VoiceCollection
//
//  Created by Tong on 2019/6/19.
//  Copyright © 2019 ZhouJinhua. All rights reserved.
//

#import "TTPermissionManager.h"
#import <MapKit/MapKit.h>
#import <Photos/Photos.h>
#import <Contacts/Contacts.h>

static TTPermissionManager* instance = nil;

@interface TTPermissionManager()<CLLocationManagerDelegate>

@property (nonatomic,copy) TTPermissionBlock m_block;
@property (nonatomic,strong) CLLocationManager *locationManager;

@end

@implementation TTPermissionManager

+ (instancetype) sharePermissionManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[TTPermissionManager alloc]init];
    });
    return instance;
}

-(id)init{
    if (self = [super init]) {
        _locationManager = [[CLLocationManager alloc] init];
    }
    return self;
}

+ (void)requestSpeechRecognizerAuth:(TTPermissionBlock)block {
    if (@available(iOS 10.0, *)) {
        [SFSpeechRecognizer requestAuthorization:^(SFSpeechRecognizerAuthorizationStatus status) {
            dispatch_main_async_safe(^{
                if (status==SFSpeechRecognizerAuthorizationStatusAuthorized) {
                    block(YES);
                } else {
                    block(NO);
                }
            });
        }];
    } else {
        block(NO);
    }
}

+ (void)requestMicrophoneAuth:(TTPermissionBlock)block{
    [[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted) {
        dispatch_main_async_safe(^{
            block(granted);
        });
    }];
}

+ (void)requestLocationWhenInUseAuth:(TTPermissionBlock)block {
    [self.sharePermissionManager requestLocationWhenInUseAuth:block];
}
- (void)requestLocationWhenInUseAuth:(TTPermissionBlock)block {
    if (![CLLocationManager locationServicesEnabled]) {
        if(block) block(NO);
        return;
    }
    
    self.m_block = block;
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager requestWhenInUseAuthorization];
}

+ (void)requestLocationAlwaysAuth:(TTPermissionBlock)block {
    [self.sharePermissionManager requestLocationAlwaysAuth:block];
}
- (void)requestLocationAlwaysAuth:(TTPermissionBlock)block {
    if (![CLLocationManager locationServicesEnabled]) {
        if(block) block(NO);
        return;
    }
    
    self.m_block = block;
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager requestAlwaysAuthorization];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    
    dispatch_main_async_safe(^{
        if (status==kCLAuthorizationStatusAuthorizedAlways||status==kCLAuthorizationStatusAuthorizedWhenInUse) {
            TTLog(@"status = %d", status);
            if(self.m_block) self.m_block(YES);
            self.locationManager = nil;
            self.m_block = nil;
        } else if(status==kCLAuthorizationStatusNotDetermined) {
            TTLog(@"User has not yet made a choice with regards to this application");
        } else {
            TTLog(@"not auth status = %d", status);
            if(self.m_block) self.m_block(NO);
            self.locationManager = nil;
            self.m_block = nil;
        }
    });
}


+ (void)requestCameraAuth:(TTPermissionBlock)block {
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
        dispatch_main_async_safe(^{
            block(granted);
        });
    }];
}

+ (void)requestPhotoLibraryAuth:(TTPermissionBlock)block {
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        block(status==PHAuthorizationStatusAuthorized);
    }];
}

+ (void)requestAddressBookAuth:(TTPermissionBlock)block {
    CNContactStore *contactStore = [[CNContactStore alloc] init];
    [contactStore requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
        block(granted);
    }];
}

@end

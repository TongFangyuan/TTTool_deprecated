//
//  TTToastTool.m
//  TTToolSamples
//
//  Created by Tong on 2019/7/17.
//  Copyright © 2019 tongfy. All rights reserved.
//

#import "TTToastTool.h"

#pragma mark - 弹窗UI配置
@interface TTToastConfig ()

@end

@implementation TTToastConfig

+ (nonnull instancetype)shareConfig {
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    return instance;
}

- (instancetype)init {
    if (self=[super init]) {
        [self _updateConfigWithStyle:TTToastStyleStyleDefault];
    }
    return self;
}

+ (instancetype)configWithStyle:(TTToastStyle)style {
    TTToastConfig *config = [TTToastConfig shareConfig];
    [config _updateConfigWithStyle:style];
    return config;
}

- (void)_updateConfigWithStyle:(TTToastStyle)style {
    switch (style) {
        case TTToastStyleStyleDefault:
        {
            self.animationType = TTToastAnimationZoom;
            self.backgroundColor = [UIColor blackColor];
            self.offset = CGPointMake(0, 150);
            self.margin = 5;
            self.labelTextColor = [UIColor whiteColor];
            self.labelNumberOfLines = 0;
            self.labelFont = [UIFont systemFontOfSize:14.f];
            self.duration = 2.f;
            
        } break;
        case TTToastStyleLightContent:
        {
            self.animationType = TTToastAnimationZoom;
            self.backgroundColor = [UIColor whiteColor];
            self.offset = CGPointMake(0, 150);
            self.margin = 5;
            self.labelTextColor = [UIColor blackColor];
            self.labelNumberOfLines = 0;
            self.labelFont = [UIFont systemFontOfSize:14.f];
            self.duration = 2.f;
        } break;
        default:
            break;
    }
}

@end

#pragma mark - 弹窗工具类
@implementation TTToastTool

+ (void)show:(NSString *)msg {
    [self show:msg hidden:YES];
}

#pragma mark - DEUG

+ (void)debug_show:(NSString *)msg {
#ifdef DEBUG
    [self show:msg];
#endif
}

+ (void)debugUI:(NSString *)msg hidden:(BOOL)hidden {
#ifdef DEBUG
    [self show:msg hidden:NO];
#endif
}


#pragma mark - private
+ (void)show:(NSString *)msg hidden:(BOOL)hidden {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:UIApplication.sharedApplication.keyWindow animated:YES];
        hud.label.text = msg;
        hud.removeFromSuperViewOnHide = YES;
        hud.mode = MBProgressHUDModeText;
        hud.backgroundView.backgroundColor = [UIColor clearColor];
        
        TTToastConfig *config = [TTToastConfig shareConfig];
        [self configHUD:hud config:config];
        
        if (hidden) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(config.duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [hud hideAnimated:YES];
            });
        }
    });
    
}

+ (void)configHUD:(MBProgressHUD *)hud config:(TTToastConfig *)config {
    hud.animationType = (MBProgressHUDAnimation)config.animationType;
    hud.bezelView.backgroundColor = config.backgroundColor;
    hud.margin = config.margin;
    hud.offset = config.offset;
    hud.label.textColor = config.labelTextColor;
    hud.label.font = config.labelFont;
    hud.label.numberOfLines = config.labelNumberOfLines;
}


@end

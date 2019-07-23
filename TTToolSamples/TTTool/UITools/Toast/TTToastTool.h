//
//  TTToastTool.h
//  TTToolSamples
//
//  Created by Tong on 2019/7/17.
//  Copyright © 2019 tongfy. All rights reserved.
//
//  pod 'MBProgressHUD'
//  toast提示

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

#pragma mark - 弹窗UI配置

typedef NS_ENUM(NSInteger, TTToastAnimation) {
    TTToastAnimationFade = MBProgressHUDAnimationFade,
    TTToastAnimationZoom = MBProgressHUDAnimationZoom,
    TTToastAnimationZoomOut = MBProgressHUDAnimationZoomOut,
    TTToastAnimationZoomIn = MBProgressHUDAnimationZoomIn
};

typedef enum : NSUInteger {
    TTToastStyleStyleDefault,  //!< 默认，黑色背景，白色字体
    TTToastStyleLightContent,  //!< 默认，白色背景，黑色字体
} TTToastStyle;

@interface TTToastConfig : NSObject

/** toast背景颜色 */
@property (nonatomic, strong) UIColor *backgroundColor;

/** 偏移，默认 CGPointMake(0, 150) */
@property (nonatomic, assign) CGPoint offset;

/** 文字距离背景的距离，默认5 */
@property (nonatomic, assign) CGFloat margin;

/** 文本行数 */
@property (nonatomic, assign) NSInteger labelNumberOfLines;

/** 文本字体 */
@property (nonatomic, strong) UIFont  *labelFont;

/** 文本颜色 */
@property (nonatomic, copy)   UIColor  *labelTextColor;

/** 弹窗动画类型 */
@property (nonatomic, assign) TTToastAnimation animationType;

/** 弹窗时间，默认2秒 */
@property (nonatomic, assign) CGFloat duration;

/**
 生成风格为TTToastStyleStyleDefault的对象
 */
+ (instancetype)shareConfig;

/**
 根据style生成配置对象
 */
+ (instancetype)configWithStyle:(TTToastStyle)style;

@end

#pragma mark - 弹窗工具类

@interface TTToastTool : NSObject

+ (void)show:(NSString *)msg;

#pragma mark - 调试方法，下面的方法用来调试

/** 调试弹窗，只在DEBUG模式下才生效*/
+ (void)debug_show:(NSString *)msg;

/** 调试UI，hidden为NO，不隐藏toast，只在DEBUG模式下才生效 */
+ (void)debugUI:(NSString *)msg hidden:(BOOL)hidden;

@end

NS_ASSUME_NONNULL_END

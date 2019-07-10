//
//  UIFont+TTPingFang.h
//  NongBao
//
//  Created by Tong on 2019/7/10.
//  Copyright © 2019 思芯微. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (TTPingFang)

#pragma mark - 平方 简体
typedef enum : NSUInteger {
    UIFontPingFangStyleUltralight,    //!< 极细体
    UIFontPingFangStyleRegular,       //!< 常规体
    UIFontPingFangStyleSemibold,      //!< 中粗体
    UIFontPingFangStyleThin,          //!< 纤细体
    UIFontPingFangStyleLight,         //!< 细体
    UIFontPingFangStyleMedium         //!< 中细体
} UIFontPingFangStyle;

/// 平方简体常规体字体
+ (UIFont *)tt_pingFangSCFontWithSize:(CGFloat)size;

/// 平方简体字体
+ (UIFont *)tt_pingFangSCFontWithStyle:(UIFontPingFangStyle)style
                                  size:(CGFloat)size;


@end

NS_ASSUME_NONNULL_END

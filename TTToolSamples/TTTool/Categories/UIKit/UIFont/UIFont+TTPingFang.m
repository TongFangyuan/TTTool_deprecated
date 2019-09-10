//
//  UIFont+TTPingFang.m
//  TTToolSamples
//
//  Created by Tong on 2019/7/10.
//  Copyright © 2019 思芯微. All rights reserved.
//

#import "UIFont+TTPingFang.h"

@implementation UIFont (TTPingFang)

+ (UIFont *)tt_pingFangSCFontWithSize:(CGFloat)size {
    return [self tt_pingFangSCFontWithStyle:UIFontPingFangStyleRegular size:size];
}

+ (UIFont *)tt_pingFangSCFontWithStyle:(UIFontPingFangStyle)style size:(CGFloat)size {
    NSDictionary *dict = @{
                           @(UIFontPingFangStyleUltralight):@"PingFangSC-Ultralight",
                           @(UIFontPingFangStyleRegular):@"PingFangSC-Regular",
                           @(UIFontPingFangStyleSemibold):@"PingFangSC-Semibold",
                           @(UIFontPingFangStyleThin):@"PingFangSC-Thin",
                           @(UIFontPingFangStyleLight):@"PingFangSC-Light",
                           @(UIFontPingFangStyleMedium):@"PingFangSC-Medium",
                           };
    NSString *name = dict[@(style)];
    return [UIFont fontWithName:name size:size];
}

@end

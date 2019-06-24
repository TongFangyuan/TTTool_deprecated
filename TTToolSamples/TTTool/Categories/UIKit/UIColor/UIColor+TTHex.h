//
//  UIColor+TTHex.h
//  TTToolSamples
//
//  Created by Tong on 2019/6/24.
//  Copyright © 2019 tongfy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (TTHex)


#pragma mark - HEX
+ (UIColor *)tt_colorWithHex:(NSInteger)hex;
+ (UIColor *)tt_colorWithHex:(NSInteger)hex andAlpha:(CGFloat)alpha;
+ (UIColor *)tt_colorWithHexString:(NSString *)hexString;

#pragma mark - RGB
///值不需要除以255.0
+ (UIColor *)tt_colroWithRed:(NSInteger)red
                       green:(NSInteger)green
                        blue:(NSInteger)blue
                       alpha:(CGFloat)alpha;
///值不需要除以255.0
+ (UIColor *)tt_colorWithWholeRed:(CGFloat)red
                            green:(CGFloat)green
                             blue:(CGFloat)blue
                            alpha:(CGFloat)alpha;

#pragma mark -
//将颜色转换成RGB
+ (NSArray *)tt_convertColorToRGB:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END

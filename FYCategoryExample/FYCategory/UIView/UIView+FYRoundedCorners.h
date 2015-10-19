//
//  UIView+FYRoundedCorners.h
//  设置图片的圆角效果
//
//  Created by IOS on 15/10/13.
//  Copyright (c) 2015年 绿网天下. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FYRoundedCorners)

/**
 *  设置圆角半径
 */
- (void)fy_setCornerRadius:(CGFloat)radius;

/**
 *  边框
 */
- (void)fy_showBorder:(BOOL)border;

/**
 *  设置圆角半径和边框
 */
- (void)fy_setCornerRadius:(CGFloat)radius showBorder:(BOOL)border;

/**
 *  设置图层为圆形
 */
- (void)fy_makeCircular;

@end

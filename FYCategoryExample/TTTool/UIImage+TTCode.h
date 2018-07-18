//
//  UIImage+TTCode.h
//  HelloWord
//
//  Created by admin on 2018/7/18.
//  Copyright © 2018年 008. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 生成二维码、条形码的分类
 */
@interface UIImage (TTCode)


/**
 生成二维码图片
 iOS7以上支持

 @param message 输入数据
 @param width 需要适应的宽度，高度自适应
 */
+ (UIImage *)tt_generateQRCode:(NSString *)message width:(CGFloat)width;


/**
 生成条形码,iOS8以上才支持

 @param message 输入数据
 @param width 需要适应的宽度，高度自适应

 */
+ (UIImage *)tt_generateBarCode:(NSString *)message width:(CGFloat)width;

@end

//
//  UIAlertController+TTAlert.h
//  TTToolSamples
//
//  Created by Tong on 2019/6/25.
//  Copyright © 2019 tongfy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController (TTAlert)

/**
 Alert弹窗，只有一个确定按钮

 @param title         标题
 @param message       msg
 @param confirmHandle 回调
 */
+ (void)tt_showAlertWithTitle:(NSString *)title
                      message:(NSString *)message
               confirmHandler:(void(^)(void))confirmHandle;
/**
 Alert弹窗，有确定和取消按钮
 
 @param title         标题
 @param message       msg
 @param confirmHandle 点击确定回调
 @param cancelHandler 点击取消回调

 */
+ (void)tt_showAlertWithTitle:(NSString *)title
                      message:(NSString *)message
               confirmHandler:(void(^)(void))confirmHandle
                cancelHandler:(void(^)(void))cancelHandler;

/**
 Alert弹窗，有确定和取消按钮

 @param title          标题
 @param message        msg
 @param sourceVC       源控制器，默认为kewindow的rootViewController
 @param confirmHandler 点击确定回调
 @param cancelHandler  点击取消回调
 */
+ (void)tt_showAlertWithTitle:(NSString *)title
                      message:(NSString *)message
                     sourceVC:(UIViewController * _Nullable)sourceVC
               confirmHandler:(void(^ _Nullable)(void))confirmHandler
                cancelHandler:(void(^ _Nullable)(void))cancelHandler;

@end

NS_ASSUME_NONNULL_END

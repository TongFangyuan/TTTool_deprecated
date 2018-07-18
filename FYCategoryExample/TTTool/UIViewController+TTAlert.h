//
//  UIViewController+TTAlert.h
//  FYCategoryExample
//
//  Created by 童方园 on 16/4/22.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FYTextFieldResultBlock)(UITextField * _Nonnull textField);

@interface UIViewController (TTAlert)

@property (nonatomic,strong,readonly,nullable) UIAlertController *fyAlert;

#pragma mark - HUD

/// shwHUD with msg
- (void)tt_showHUD:(NSString *_Nonnull)msg;
- (void)tt_hiddenHUD;

#pragma mark - Alert
/**
 *  普通弹窗提示
 *
 *  @param title   标题
 *  @param message 提示信息
 */
- (void)tt_showTitle:(NSString *_Nullable)title message:(NSString *_Nullable)message;

/**
 *  弹窗提示,有回调
 *
 *  @param title   标题
 *  @param message 提示信息
 *  @param handler 确认按钮回调
 */
- (void)tt_showTitle:(NSString *_Nullable)title message:(NSString *_Nullable)message confirmHandler:(void(^_Nullable)(void))confirmHandler;
/**
 *  弹窗提示,有点击确定和取消的回调
 *
 *  @param title          标题
 *  @param message        提示信息
 *  @param confirmHandler 确认按钮回调
 *  @param cancelHandler  删除按钮回调
 */
- (void)tt_showTitle:(NSString *_Nullable)title message:(NSString *_Nullable)message confirmHandler:(void(^_Nullable)(void))confirmHandler cancelHandler:(void(^_Nullable)(void))cancelHandler;

#pragma mark - Input alert

/** 弹出框，带有输入框 */
- (void)tt_showInput:(NSString *_Nullable)title
                desc:(NSString *_Nullable)desc
              handle:(FYTextFieldResultBlock _Nullable )handle;

@end


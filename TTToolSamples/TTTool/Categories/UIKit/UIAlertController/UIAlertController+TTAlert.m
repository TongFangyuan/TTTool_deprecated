//
//  UIAlertController+TTAlert.m
//  TTToolSamples
//
//  Created by Tong on 2019/6/25.
//  Copyright © 2019 tongfy. All rights reserved.
//

#import "UIAlertController+TTAlert.h"

@implementation UIAlertController (TTAlert)

+ (void)tt_showAlertWithTitle:(NSString *)title
                      message:(NSString *)message
               confirmHandler:(void(^)(void))confirmHandle {
    [self tt_showAlertWithTitle:title message:message sourceVC:nil confirmHandler:confirmHandle cancelHandler:nil];
}

+ (void)tt_showAlertWithTitle:(NSString *)title
                      message:(NSString *)message
               confirmHandler:(void(^)(void))confirmHandle
                cancelHandler:(void(^)(void))cancelHandler {
    [self tt_showAlertWithTitle:title message:message sourceVC:nil confirmHandler:confirmHandle cancelHandler:cancelHandler];
}

+ (void)tt_showAlertWithTitle:(NSString *)title
                      message:(NSString *)message
                     sourceVC:(UIViewController * _Nullable)sourceVC
               confirmHandler:(void(^ _Nullable)(void))confirmHandler
                cancelHandler:(void(^ _Nullable)(void))cancelHandler {
    
    UIAlertAction *confirmAlertAction = nil;
    if (confirmHandler) {
      confirmAlertAction = [UIAlertAction actionWithTitle:NSLocalizedStringFromTable(@"确定", @"TTAlert", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            confirmHandler();
        }];
    }
    
    UIAlertAction *cancelAlertAction = nil;
    if (cancelHandler) {
        cancelAlertAction = [UIAlertAction actionWithTitle:NSLocalizedStringFromTable(@"取消", @"TTAlert", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            cancelHandler();
        }];
    }
    [self tt_showAlertWithTitle:title message:message sourceVC:sourceVC cancelAction:cancelAlertAction confirmAction:confirmAlertAction];
}

#pragma mark - private
+ (void)tt_showAlertWithTitle:(NSString *)title
             message:(NSString *)message
              sourceVC:(UIViewController * _Nullable)sourceVC
        cancelAction:(UIAlertAction * _Nullable)cancelAction
       confirmAction:(UIAlertAction * _Nullable)confirmAction {
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    if (cancelAction) [alert addAction:cancelAction];
    if (confirmAction) [alert addAction:confirmAction];
    if (!sourceVC) sourceVC = UIApplication.sharedApplication.keyWindow.rootViewController;
    [sourceVC presentViewController:alert animated:YES completion:nil];
}

@end

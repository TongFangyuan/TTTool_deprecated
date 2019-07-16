//
//  UIApplication+TTKeyWindow.m
//  MobileAir
//
//  Created by Tong on 2019/7/16.
//  Copyright © 2019 tongfy. All rights reserved.
//

#import "UIApplication+TTKeyWindow.h"

@implementation UIApplication (TTKeyWindow)

+ (nullable UIView *)tt_keyWindowFirstSubview {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    return keyWindow.subviews.firstObject;
}

@end

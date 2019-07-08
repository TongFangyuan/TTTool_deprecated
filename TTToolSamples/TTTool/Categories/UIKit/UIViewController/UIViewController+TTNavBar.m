//
//  UIViewController+TTNavBar.m
//  Apple
//
//  Created by Tong on 2019/7/8.
//  Copyright © 2019 tongfy. All rights reserved.
//

#import "UIViewController+TTNavBar.h"

@implementation UIViewController (TTNavBar)

- (void)tt_setLeftBarTitle:(NSString *)title
                      font:(nullable UIFont *)font
                 textColor:(nullable UIColor *)textColor {
    if (!title)          return;
    if (!font)           font = TTDEfaultFont;
    if (!textColor)      textColor = TTDefaultTextColor;

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    [btn setTitleColor:textColor forState:UIControlStateNormal];
    [btn sizeToFit];
    
    [self tt_setLeftBarButtonItemWithView:btn];
}

- (void)tt_setRightBarTitle:(NSString *)title
                       font:(nullable UIFont *)font
                  textColor:(nullable UIColor *)textColor {
    if (!title)          return;
    if (!font)           font = TTDEfaultFont;
    if (!textColor)      textColor = TTDefaultTextColor;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    [btn setTitleColor:textColor forState:UIControlStateNormal];
    [btn sizeToFit];
    
    [self tt_setRightBarButtonItemWithView:btn];
}

- (void)tt_setTitle:(NSString *)title
               font:(nullable UIFont *)font
          textColor:(nullable UIColor *)textColor {
    if (!title)          return;
    if (!font)           font = TTDEfaultFont;
    if (!textColor)      textColor = TTDefaultTextColor;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    [btn setTitleColor:textColor forState:UIControlStateNormal];
    [btn sizeToFit];
    [self tt_setTitleView:btn];
}

- (void)tt_setLeftBarButtonItemWithView:(UIView *)view {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:view];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)tt_setRightBarButtonItemWithView:(UIView *)view {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:view];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)tt_setTitleView:(UIView *)titleView {
    self.navigationItem.titleView = titleView;
}

@end

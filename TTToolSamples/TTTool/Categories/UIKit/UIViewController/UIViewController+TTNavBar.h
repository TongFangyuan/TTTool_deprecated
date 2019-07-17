//
//  UIViewController+TTNavBar.h
//  Apple
//
//  Created by Tong on 2019/7/8.
//  Copyright © 2019 tongfy. All rights reserved.
//
//  设置导航栏Item
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#ifndef TTDefaultTextColor
#define TTDefaultTextColor [UIColor blackColor]
#endif

#ifndef TTDEfaultFont
#define TTDEfaultFont      [UIFont systemFontOfSize:22 weight:UIFontWeightSemibold]
#endif

@interface UIViewController (TTNavBar)


#pragma mark - 导航栏标题
//  
//  设置导航栏标题（左边、中间、右边）
//  字体默认为 TTDefaultTextColor
//  颜色默认为 TTDEfaultFont
//

/** 设置导航栏左边标题 */
- (void)tt_setLeftBarTitle:(NSString *)title
                      font:(nullable UIFont *)font
                 textColor:(nullable UIColor *)textColor;
/** 设置导航栏右边标题 */
- (void)tt_setRightBarTitle:(NSString *)title
                       font:(nullable UIFont *)font
                  textColor:(nullable UIColor *)textColor;
/** 设置导航栏中间标题 */
- (void)tt_setTitle:(nullable NSString *)title
               font:(nullable UIFont *)font
          textColor:(nullable UIColor *)textColor;


#pragma mark - 设置导航栏Item
- (void)tt_setLeftBarButtonItemWithView:(UIView *)view;
- (void)tt_setLeftBarButtonItemWithViews:(NSArray <UIView *> *)views;

- (void)tt_setRightBarButtonItemWithView:(UIView *)view;
- (void)tt_setRightBarButtonItemWithViews:(NSArray <UIView *> *)views;

- (void)tt_setTitleView:(UIView *)titleView;

@end

NS_ASSUME_NONNULL_END

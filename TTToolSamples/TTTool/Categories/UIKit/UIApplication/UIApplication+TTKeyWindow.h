//
//  UIApplication+TTKeyWindow.h
//  MobileAir
//
//  Created by Tong on 2019/7/16.
//  Copyright © 2019 tongfy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (TTKeyWindow)


/**
 * 获取主窗口的最底部的子视图，可能为空值
 */
+ (nullable UIView *)tt_keyWindowFirstSubview;

@end

NS_ASSUME_NONNULL_END

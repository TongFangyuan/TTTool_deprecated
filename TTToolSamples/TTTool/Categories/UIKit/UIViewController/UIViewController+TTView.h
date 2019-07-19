//
//  UIViewController+TTView.h
//  TTToolSamples
//
//  Created by Tong on 2019/7/19.
//  Copyright © 2019 tongfy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (TTView)

/**
 * 寻找视图所属的控制器，可能是nil
 */
+ (__kindof  UIViewController * _Nullable )tt_viewControllerForView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END

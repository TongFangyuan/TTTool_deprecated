//
//  UIView+TTKeyboard.h
//  TTToolSamples
//
//  Created by Tong on 2019/7/19.
//  Copyright © 2019 tongfy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (TTKeyboard)

/**
 * 点击视图推出键盘
 */
@property (nonatomic, assign, getter=isKeyboardDismissOnTap) BOOL tt_keyboardDismissOnTap;

@end

NS_ASSUME_NONNULL_END

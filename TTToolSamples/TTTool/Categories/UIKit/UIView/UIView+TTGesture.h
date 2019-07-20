//
//  UIView+TTGesture.h
//  TTToolSamples
//
//  Created by Tong on 2019/7/19.
//  Copyright © 2019 tongfy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (TTGesture)

/**
 添加点击手势
 
 @param target 对象
 @param action 事件
 */
- (void)tt_addTapGestureWithTarget:(id)target action:(SEL)action;

@end

NS_ASSUME_NONNULL_END

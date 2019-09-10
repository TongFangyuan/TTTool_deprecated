//
//  TTErrorView.h
//  iOS_Aura
//
//  Created by Tong on 2018/6/5.
//  Copyright © 2018年 TTTool. All rights reserved.
//  错误提示弹窗
//  第三方依赖:  Masonry

#import <UIKit/UIKit.h>

@interface TTErrorView : UILabel

+ (TTErrorView *)tt_showError:(NSString *)msg onView:(UIView *)view;

+ (void)tt_dismissForView:(UIView *)view;

@end

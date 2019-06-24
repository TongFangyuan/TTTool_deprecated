//
//  AuraErrorView.m
//  iOS_Aura
//
//  Created by admin on 2018/6/5.
//  Copyright © 2018年 TTTool. All rights reserved.
//

#import "TTErrorView.h"

/// 报错请导入 Masonry 框架， https://github.com/SnapKit/Masonry
#import "Masonry.h"

static CGFloat kHeight = 20;

@implementation TTErrorView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self=[super initWithCoder:aDecoder]) {
        self.backgroundColor = [UIColor redColor];
        self.textAlignment = NSTextAlignmentCenter;
        self.textColor = [UIColor whiteColor];
        self.font = [UIFont systemFontOfSize:12];
    }
    return self;
}

- (instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = [UIColor redColor];
        self.textAlignment = NSTextAlignmentCenter;
        self.textColor = [UIColor whiteColor];
        self.font = [UIFont systemFontOfSize:12];
    }
    return self;
}

+ (TTErrorView *)tt_showError:(NSString *)message onView:(UIView *)view {
    TTErrorView *erroView = erroView = [[TTErrorView alloc] init];
    [view addSubview:erroView];
    [erroView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(view);
        make.height.mas_equalTo(kHeight);
        make.top.mas_equalTo(-kHeight);
    }];
    erroView.text = message;
    
    // 设置
    [erroView layoutIfNeeded];
    
    // 延迟0.5秒显示动画
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [erroView show];
    });
    
    return erroView;
}

+ (void)tt_dismissForView:(UIView *)view {
    TTErrorView *erroView = [TTErrorView errorViewForView:view];
    if (erroView) {
        [erroView dismiss];
    }
}

+ (nullable TTErrorView *)errorViewForView:(UIView *)view {
    
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:self]) {
            return (TTErrorView *)subview;
        }
    }
    return nil;
}

- (void)show {
    
    // 被移除父视图，不做动画
    if (!self.superview)  return;
    
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
    }];
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.superview layoutIfNeeded];
    } completion:^(BOOL finished) {
    
        // 显示2秒后自动隐藏
        if (finished) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self dismiss];
            });
        }
    }];
    
    
}

- (void)dismiss {
    
    // 被移除父视图，不做动画
    if (!self.superview)  return;
    
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(-kHeight);
    }];
    
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.superview layoutIfNeeded];
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
        }
    }];
}

- (void)dealloc {
//    NSLog(@"%@ %@",self.description, NSStringFromSelector(_cmd));
}

@end

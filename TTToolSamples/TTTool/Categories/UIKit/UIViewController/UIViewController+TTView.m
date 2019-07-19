//
//  UIViewController+TTView.m
//  TTToolSamples
//
//  Created by Tong on 2019/7/19.
//  Copyright © 2019 tongfy. All rights reserved.
//

#import "UIViewController+TTView.h"

@implementation UIViewController (TTView)

+ (__kindof  UIViewController * _Nullable )tt_viewControllerForView:(UIView *)view {
    
    UIResponder *responder = view.nextResponder;
    while (responder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
        responder = responder.nextResponder;
    }
    return nil;
    
}

@end

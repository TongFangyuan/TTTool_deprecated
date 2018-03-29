//
//  UIView+FYController.m
//  FYCategoryExample
//
//  Created by admin on 2018/3/29.
//  Copyright © 2018年 IOS. All rights reserved.
//

#import "UIView+FYController.h"

@implementation UIView (FYController)

- (UIViewController *)fy_parentController{
    UIResponder *responder = [self nextResponder];
    while (responder) {
        
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
        responder = [responder nextResponder];
    }
    return nil;
}

@end

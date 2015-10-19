//
//  UIView+FYRoundedCorners.m
//  GWIM
//
//  Created by IOS on 15/10/13.
//  Copyright (c) 2015年 绿网天下. All rights reserved.
//

#import "UIView+FYRoundedCorners.h"

@implementation UIView (FYRoundedCorners)

- (void)fy_setCornerRadius:(CGFloat)radius{
    CALayer *lay  = self.layer;
    [lay setMasksToBounds:YES];
    [lay setCornerRadius:radius];
}

- (void)fy_showBorder:(BOOL)border{
    if (!border) {
        return;
    }
    [self.layer setBorderWidth:1];
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGColorRef color = CGColorCreate(colorSpaceRef, (CGFloat[]){0.67,0.67,0.67,1});
    [self.layer setBorderColor:color];
}

- (void)fy_setCornerRadius:(CGFloat)radius showBorder:(BOOL)border{
    [self fy_setCornerRadius:radius];
    [self fy_showBorder:border];
}

- (void)fy_makeCircular{
    CGFloat selfWith = self.bounds.size.width;
    CGFloat radius = selfWith*0.5;
    [self fy_setCornerRadius:radius];
}

@end

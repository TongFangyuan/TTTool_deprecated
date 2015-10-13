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
@end

//
//  UIView+FYTag.m
//  GWIM
//
//  Created by IOS on 15/10/19.
//  Copyright (c) 2015年 绿网天下. All rights reserved.
//

#import "UIView+FYTag.h"

@implementation UIView (FYTag)

- (void)fy_removeSubviewWithTag:(NSInteger)tag{
    NSLog(@"%@",self.subviews);
    UIView *subview = [self viewWithTag:tag];
    if (!subview) return;
    [subview removeFromSuperview];
}
@end

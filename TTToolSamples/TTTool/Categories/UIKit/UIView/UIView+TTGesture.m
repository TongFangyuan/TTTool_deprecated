//
//  UIView+TTGesture.m
//  TTToolSamples
//
//  Created by Tong on 2019/7/19.
//  Copyright © 2019 tongfy. All rights reserved.
//

#import "UIView+TTGesture.h"

@implementation UIView (TTGesture)

- (void)tt_addTapGestureWithTarget:(id)target action:(SEL)action {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:tap];
    self.userInteractionEnabled = YES;
}

@end

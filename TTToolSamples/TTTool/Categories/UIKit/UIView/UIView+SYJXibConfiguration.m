//
//  UIView+SYJXibConfiguration.m
//  TTToolSamples
//
//  Created by 沈赟杰 on 2019/4/30.
//  Copyright © 2019 tongfy. All rights reserved.
//

#import "UIView+SYJXibConfiguration.h"

IB_DESIGNABLE
@implementation UIView (SYJXibConfiguration)
- (void)setMasksToBounds:(BOOL)masksToBounds {
    self.layer.masksToBounds = masksToBounds;
}

- (BOOL)masksToBounds {
    return self.layer.masksToBounds;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}

- (void)setBorderColor:(UIColor *)borderUIColor {
    self.layer.borderColor = borderUIColor.CGColor;
}

- (UIColor *)borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

@end

//
//  UIView+TTKeyboard.m
//  TTToolSamples
//
//  Created by Tong on 2019/7/19.
//  Copyright © 2019 tongfy. All rights reserved.
//

#import "UIView+TTKeyboard.h"
#import <objc/runtime.h>

@interface UIView ()

@property (nonatomic, retain) UITapGestureRecognizer *_tapGesture;

@end

@implementation UIView (TTKeyboard)

- (BOOL)isKeyboardDismissOnTap {
    return [objc_getAssociatedObject(self, @selector(isKeyboardDismissOnTap)) boolValue];
}

- (void)setTt_keyboardDismissOnTap:(BOOL)dismiss {
    objc_setAssociatedObject(self, @selector(isKeyboardDismissOnTap), @(dismiss), OBJC_ASSOCIATION_ASSIGN);
    
    if (dismiss) {
        self.userInteractionEnabled = YES;
        if (!self._tapGesture) {
            UITapGestureRecognizer *tapGeture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_dismissKeyboardOnTap)];
            tapGeture.numberOfTapsRequired = 1;
            tapGeture.cancelsTouchesInView = NO;
            [self addGestureRecognizer:tapGeture];
            self._tapGesture = tapGeture;
        }
        self._tapGesture.enabled = YES;
        
    } else {
        self._tapGesture.enabled = NO;
    }
}

#pragma mark - private
- (void)_dismissKeyboardOnTap {
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

- (UITapGestureRecognizer *)_tapGesture {
    return objc_getAssociatedObject(self, @selector(_tapGesture));
}

- (void)set_tapGesture:(UITapGestureRecognizer *)_tapGesture {
    objc_setAssociatedObject(self, @selector(_tapGesture), _tapGesture, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

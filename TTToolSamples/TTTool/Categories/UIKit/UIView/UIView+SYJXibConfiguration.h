//
//  UIView+SYJXibConfiguration.h
//  MobileAir
//
//  Created by 沈赟杰 on 2019/4/30.
//  Copyright © 2019 tongfy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - IBDesignable
IB_DESIGNABLE

@interface UIView (SYJXibConfiguration)

@property (nonatomic, assign) IBInspectable BOOL masksToBounds;
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, weak, nullable) IBInspectable UIColor *borderColor;

@end

NS_ASSUME_NONNULL_END

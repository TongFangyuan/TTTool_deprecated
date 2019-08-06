//
//  TTViewSizeAdapter.m
//  TTToolSamples
//
//  Created by Tong on 2019/8/6.
//  Copyright © 2019 tongfy. All rights reserved.
//

#import "TTViewSizeAdapter.h"

@interface TTViewSizeAdapter ()

@property (nonatomic, assign) TTiPhone currentIPhone;
@property (nonatomic, strong) NSDictionary *sizeMap;
@property (nonatomic, strong) NSDictionary *iPhoneMap;

/**
 高度比例尺
 */
@property (nonatomic, assign) CGFloat widthScale;

/**
 高度比例尺
 */
@property (nonatomic, assign) CGFloat heightScale;

@end

@implementation TTViewSizeAdapter

+ (nonnull instancetype)share {
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    return instance;
}

#pragma mark - public
- (CGFloat)scaleWidth:(CGFloat)width {
    return width*self.widthScale;
}

- (CGFloat)scaleHegiht:(CGFloat)height {
    return height*self.heightScale;
}

#pragma mark - private
- (instancetype)init {
    if (self=[super init]) {
        [self configAdapter];
    }
    return self;
}


- (void)configAdapter {
//    CGFloat statusBarHeight = [UIApplication.sharedApplication statusBarFrame].size.height;
//    CGFloat navbarHeight = 44.f;
//    CGFloat topHeight = navbarHeight + statusBarHeight;
//    
//    CGFloat tabbarHeight = 49.f;
//    CGFloat bottomHeight =

    self.sizeMap = @{
                     @(TTiPhone678):NSStringFromCGSize(CGSizeMake(375.f, 667.f)),
                     @(TTiPhone678Plus):NSStringFromCGSize(CGSizeMake(414.f, 736.f)),
                     @(TTiPhoneXXS):NSStringFromCGSize(CGSizeMake(375.f, 812.f)),
                     @(TTiPhoneXRXSMAX):NSStringFromCGSize(CGSizeMake(414.f, 896.f))
                     };
    
    self.iPhoneMap = @{
                       NSStringFromCGSize(CGSizeMake(375.f, 667.f)):@(TTiPhone678),
                       NSStringFromCGSize(CGSizeMake(414.f, 736.f)):@(TTiPhone678Plus),
                       NSStringFromCGSize(CGSizeMake(375.f, 812.f)):@(TTiPhoneXXS),
                       NSStringFromCGSize(CGSizeMake(414.f, 896.f)):@(TTiPhoneXRXSMAX)
                       };
    
    /// 设置当前机型
    CGSize size = [[UIScreen mainScreen] currentMode].size;
    self.currentIPhone = [self getIPhoneWithSize:size];
    
}

- (TTiPhone)getIPhoneWithSize:(CGSize)size {
    NSString *obj = self.iPhoneMap[NSStringFromCGSize(size)];
    NSAssert(obj, @"机型不存在，需要更新配置");
    return [obj integerValue];
}

- (CGSize)getSizeWithIPhone:(TTiPhone)iphone {
    NSString *obj = self.sizeMap[@(iphone)];
    NSAssert(obj, @"尺寸不存在，需要更新配置");
    return CGSizeFromString(obj);
}

- (void)setMarkIPhone:(TTiPhone)markIPhone {
    _markIPhone = markIPhone;

    /// 比例尺配置
    CGSize markSize = [self getSizeWithIPhone:markIPhone];
    CGSize targetSzie = [self getSizeWithIPhone:self.currentIPhone];
    self.widthScale = markSize.width / targetSzie.width;
    self.heightScale = markSize.height / targetSzie.height;

}

@end

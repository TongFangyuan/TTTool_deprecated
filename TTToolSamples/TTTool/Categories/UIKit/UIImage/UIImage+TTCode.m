//
//  UIImage+TTCode.m
//  TTToolSamples
//
//  Created by Tong on 2018/7/18.
//  Copyright © 2019 tongfy. All rights reserved.
//

#import "UIImage+TTCode.h"

@implementation UIImage (TTCode)

+ (UIImage *)tt_generateQRCode:(NSString *)message width:(CGFloat)width;
{
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    NSData *data = [message dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKeyPath:@"inputMessage"];
    CIImage *image = [filter outputImage];
    return [[UIImage imageWithCIImage:image] tt_fitToWidth:width];
}

+ (UIImage *)tt_generateBarCode:(NSString *)message width:(CGFloat)width;
{
    NSData *data = [message dataUsingEncoding:NSASCIIStringEncoding];
    CIFilter *filter = [CIFilter filterWithName:@"CICode128BarcodeGenerator"];
    [filter setValue:data forKey:@"inputMessage"];
    // 设置生成的条形码的上，下，左，右的margins的值
    [filter setValue:[NSNumber numberWithInteger:0] forKey:@"inputQuietSpace"];
    CIImage *image = [filter outputImage];
    return [[UIImage imageWithCIImage:image] tt_fitToWidth:width];
}

- (UIImage *)tt_fitToWidth:(CGFloat)fitWidth
{
    CGRect extent = CGRectIntegral(self.CIImage.extent);
    CGFloat scale = MIN(fitWidth/CGRectGetWidth(extent), fitWidth/CGRectGetHeight(extent));
    
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:self.CIImage fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}

@end

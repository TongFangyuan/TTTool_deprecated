//
//  TTToastTool.h
//  TTToolSamples
//
//  Created by Tong on 2019/7/17.
//  Copyright © 2019 tongfy. All rights reserved.
//
//  pod 'MBProgressHUD'
//  toast提示

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface TTToastTool : NSObject

+ (void)show:(NSString *)msg;

+ (void)debug_show:(NSString *)msg;

@end

NS_ASSUME_NONNULL_END

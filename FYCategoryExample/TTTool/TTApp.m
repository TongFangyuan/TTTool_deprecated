//
//  TTAppTool.m
//  HelloWord
//
//  Created by admin on 2018/7/17.
//  Copyright © 2018年 008. All rights reserved.
//

#import "TTApp.h"

@implementation TTApp


+ (NSString *)appVersion
{
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    return [infoDic objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)appBuildVersion
{
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    return [infoDic objectForKey:@"CFBundleVersion"];
}

+ (NSString *)appName {
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    return [infoDic objectForKey:@"CFBundleDisplayName"];
}

@end

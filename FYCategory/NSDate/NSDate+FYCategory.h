//
//  NSDate+FYCategory.h
//  GWIM
//
//  Created by IOS on 15/7/14.
//  Copyright (c) 2015年 绿网天下. All rights reserved.
//

#define D_MINUTE	60
#define D_HOUR		3600
#define D_DAY		86400
#define D_WEEK		604800
#define D_YEAR		31556926

#import <Foundation/Foundation.h>

@interface NSDate (FYCategory)

+ (NSString *)fy_formattedTimeFromTimeInterval:(long long)time Fmt24:(BOOL)fmt24 Simple:(BOOL)simple;

+ (NSString *)fy_formattedDeadTimeFromTimeInterval:(long long)time Fmt24:(BOOL)fmt24 Simple:(BOOL)simple;
@end

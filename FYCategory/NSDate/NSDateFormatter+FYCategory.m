//
//  NSDateFormatter+FYCategory.m
//  GWIM
//
//  Created by IOS on 15/7/14.
//  Copyright (c) 2015年 绿网天下. All rights reserved.
//

#import "NSDateFormatter+FYCategory.h"

@implementation NSDateFormatter (FYCategory)

+ (id)fy_dateFormatterWithFormat:(NSString *)dateFormat
{
    NSDateFormatter *dateFormatter = [[self alloc] init];
    dateFormatter.dateFormat = dateFormat;
    return dateFormatter;
}

@end

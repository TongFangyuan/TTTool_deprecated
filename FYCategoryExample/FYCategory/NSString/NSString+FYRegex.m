//
//  NSString+FYRegex.m
//  FYCategoryExample
//
//  Created by 童方园 on 16/6/28.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "NSString+FYRegex.h"

@implementation NSString (FYRegex)

/**
 *  判断字符串格式是否为手机号
 */
-(BOOL)fy_isPhoneNumber{
    return [self fy_getIsMatches:@"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|70)\\d{8}$"];
}



/**
 *  判断方法
 *
 *  @param Regex 判断标准
 */
-(BOOL)fy_getIsMatches:(NSString *)Regex{
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",Regex];
    return [predicate evaluateWithObject:self];
}

@end

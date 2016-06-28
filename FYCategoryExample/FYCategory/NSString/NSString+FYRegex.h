//
//  NSString+FYRegex.h
//  FYCategoryExample
//
//  Created by 童方园 on 16/6/28.
//  Copyright © 2016年 IOS. All rights reserved.
//
/**
 *  正则表达式运用
 */

#import <Foundation/Foundation.h>

@interface NSString (FYRegex)

/**
 *  判断字符串是否为手机号
 */
- (BOOL)fy_isPhoneNumber;

/**
 *  判断正则表达式
 *
 *  @param Regex 正则语法
 */
-(BOOL)fy_getIsMatches:(NSString *)Regex;

@end

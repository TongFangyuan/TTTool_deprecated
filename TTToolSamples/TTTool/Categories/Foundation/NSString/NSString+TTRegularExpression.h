//
//  NSString+TTRegularExpression.h
//  TTToolSamples
//
//  Created by Tong on 2019/6/24.
//  Copyright © 2019 tongfy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * 常用的正则表达式
 * https://blog.csdn.net/chaoyuan899/article/details/38583759
 *
 *
 */

@interface NSString (TTRegularExpression)


/**
 通过正则表达式删除字符串

 @param pattern 正则表达式
 推荐的表达式
 @"[^a-zA-Z0-9\u4e00-\u9fa5]"  删除所有特殊字符和标点符号
 */
- (NSString *)tt_deleteCharactersWithPattern:(NSString *)pattern;

@end

NS_ASSUME_NONNULL_END

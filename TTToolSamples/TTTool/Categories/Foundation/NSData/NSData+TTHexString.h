//
//  NSData+TTHexString.h
//  Apple
//
//  Created by Tong on 2019/7/18.
//  Copyright © 2019 tongfy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/** 16进制字符串与NSData互转 */
@interface NSData (TTHexString)

/**
 * 将16进制字符串转为NSData对象
 */
+ (NSData *)tt_convertToData:(NSString*)hexString;

/**
 * 将NSData对象转为16进制字符串
 */
+ (NSString *)tt_convertToHexString:(NSData *)data;

@end

NS_ASSUME_NONNULL_END

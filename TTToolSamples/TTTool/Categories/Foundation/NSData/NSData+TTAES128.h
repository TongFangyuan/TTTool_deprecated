//
//  NSData+TTAES128.h
//  Apple
//
//  Created by Tong on 2019/7/18.
//  Copyright © 2019 tongfy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 AES128 加密
 */
@interface NSData (TTAES128)


/**
 AES128 ECB加密模式

 @param plainText 源数据
 @param key       密钥
 @return          加密后的数据
 */
+ (NSData *)tt_AES128ECBEncrypt:(NSString *)plainText key:(NSString *)key;

@end

NS_ASSUME_NONNULL_END

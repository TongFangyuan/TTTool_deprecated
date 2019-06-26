//
//  NSData+AES128TL.m
//  HelloWord
//
//  Created by admin on 2019/4/23.
//  Copyright © 2019年 008. All rights reserved.
//

#import "NSData+AES128TL.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation NSData (AES128TL)

/**
 *  根据CCOperation，确定加密还是解密
 *
 *  @param operation kCCEncrypt -> 加密  kCCDecrypt－>解密
 *  @param key       公钥
 *  @param iv        偏移量
 *
 *  @return 加密或者解密的NSData
 */
- (NSData *)AES128Operation:(CCOperation)operation key:(NSString *)key iv:(NSString *)iv

{
    
    char keyPtr[kCCKeySizeAES128 + 1];
    
    memset(keyPtr, 0, sizeof(keyPtr));
    
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    
    
    char ivPtr[kCCBlockSizeAES128 + 1];
    
    memset(ivPtr, 0, sizeof(ivPtr));
    
    [iv getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];
    
    
    
    NSUInteger dataLength = [self length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    
    void *buffer = malloc(bufferSize);
    
    
    
    size_t numBytesCrypted = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(operation,
                                          
                                          kCCAlgorithmAES128,
                                          
                                          kCCOptionPKCS7Padding,
                                          
                                          keyPtr,
                                          
                                          kCCBlockSizeAES128,
                                          
                                          ivPtr,
                                          
                                          [self bytes],
                                          
                                          dataLength,
                                          
                                          buffer,
                                          
                                          bufferSize,
                                          
                                          &numBytesCrypted);
    
    if (cryptStatus == kCCSuccess) {
        
        return [NSData dataWithBytesNoCopy:buffer length:numBytesCrypted];
        
    }
    
    free(buffer);
    
    return nil;
    
}


- (NSData *)AES128EncryptWithKey:(NSString *)key iv:(NSString *)iv

{
    
    return [self AES128Operation:kCCEncrypt key:key iv:iv];
    
}


- (NSData *)AES128DecryptWithKey:(NSString *)key iv:(NSString *)iv

{
    
    return [self AES128Operation:kCCDecrypt key:key iv:iv];
    
}

@end

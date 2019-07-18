//
//  NSData+TTAES128.m
//  Apple
//
//  Created by Tong on 2019/7/18.
//  Copyright © 2019 tongfy. All rights reserved.
//

#import "NSData+TTAES128.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation NSData (TTAES128)

+ (NSData *)tt_AES128ECBEncryptData:(NSData *)data key:(NSData *)key {
    return [self _aes128EncryptData:data key:key options:kCCOptionECBMode];
}


+ (NSData *)tt_AES128ECBDecryptData:(NSData *)data key:(NSData *)key {
    return [self _aes128DecryptData:data key:key options:kCCOptionECBMode];
}

+ (NSData *)tt_AES128PKCS7EncryptData:(NSData *)data key:(NSData *)key {
    return [self _aes128EncryptData:data key:key options:kCCOptionPKCS7Padding];
}

+ (NSData *)tt_AES128PKCS7DecryptData:(NSData *)data key:(NSData *)key {
    return [self _aes128DecryptData:data key:key options:kCCOptionPKCS7Padding];
}

+ (NSData *)tt_AES128EncryptData:(NSData *)data key:(NSData *)key {
    return [self _aes128EncryptData:data key:key options:kCCOptionPKCS7Padding|kCCOptionECBMode];
}

+ (NSData *)tt_AES128DecryptData:(NSData *)data key:(NSData *)key {
    return [self _aes128DecryptData:data key:key options:kCCOptionPKCS7Padding|kCCOptionECBMode];
}

+ (NSData *)_aes128EncryptData:(NSData *)data
                           key:(NSData *)key
                       options:(CCOptions)options
{
    
    NSData* result = nil;
    
    // setup key
    // 设置密钥
    unsigned char cKey[kCCKeySizeAES128];
    bzero(cKey, sizeof(cKey));
    [key getBytes:cKey length:kCCKeySizeAES128];
    
    // setup output buffer
    // 设置输出数据长度
    size_t bufferSize = [data length] + kCCKeySizeAES128;
    void *buffer = malloc(bufferSize);
    
    // do encrypt
    // 开始加密
    size_t encryptedSize = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmAES128,
                                          options,
                                          cKey,
                                          kCCKeySizeAES128,
                                          nil,
                                          [data bytes],
                                          [data length],
                                          buffer,
                                          bufferSize,
                                          &encryptedSize);
    if (cryptStatus == kCCSuccess) {
        result = [NSData dataWithBytesNoCopy:buffer length:encryptedSize];
    } else {
        free(buffer);
        NSLog(@"[ERROR] failed to encrypt|CCCryptoStatus: %d", cryptStatus);
    }
    
    return result;
}

+ (NSData *)_aes128DecryptData:(NSData *)data
                           key:(NSData *)key
                       options:(CCOptions)options
{
    NSData* result = nil;
    
    // setup key
    // 设置密钥
    unsigned char cKey[kCCKeySizeAES128];
    bzero(cKey, sizeof(cKey));
    [key getBytes:cKey length:kCCKeySizeAES128];
    
    // setup output buffer
    // 设置输出数据长度
    size_t bufferSize = [data length] + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    // do decrypt
    // 开始解密
    size_t decryptedSize = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmAES128,
                                          options,
                                          cKey,
                                          kCCKeySizeAES128,
                                          nil,
                                          [data bytes],
                                          [data length],
                                          buffer,
                                          bufferSize,
                                          &decryptedSize);
    
    if (cryptStatus == kCCSuccess) {
        result = [NSData dataWithBytesNoCopy:buffer length:decryptedSize];
    } else {
        free(buffer);
        NSLog(@"[ERROR] failed to decrypt| CCCryptoStatus: %d", cryptStatus);
    }
    
    return result;
}

@end

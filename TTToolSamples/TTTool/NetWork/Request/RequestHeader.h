//
//  RequestHeader.h
//  VoiceCollection
//
//  Created by Tong on 2019/6/17.
//  Copyright © 2019 ZhouJinhua. All rights reserved.
//

#ifndef RequestHeader_h
#define RequestHeader_h

#define REQUEST @"https://audiocollect.ccsmart.com.cn:8445"  //服务器地址

#pragma mark - 用户
#define AddUser @"/user/add"

#pragma mark - 噪音
#define NoiseUpload   @"/audio/noise/upload"

#pragma mark - 语音
#define AudioList     @"/audio/list"
#define AudioSearch   @"/audio/search"
#define AudioDetail   @"/audio/detail"
#define AudioUpload   @"/audio/upload"
#define AudioFinish   @"/audio/finish"


#ifdef DEBUG
#define TTNetLog(xx, ...)  NSLog(@"%s(%d): \n\n" xx "\n", __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define TTNetLog(xx, ...)
#endif


#endif /* RequestHeader_h */

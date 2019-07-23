//
//  RequestHeader.h
//  VoiceCollection
//
//  Created by Tong on 2019/6/17.
//  Copyright © 2019 ZhouJinhua. All rights reserved.
//

#ifndef RequestHeader_h
#define RequestHeader_h

#define REQUEST @"填写你得服务器地址"  //服务器地址

#pragma mark - 定义接口路径
#define AddUser @"/user/add"


#ifdef DEBUG
#define TTNetLog(xx, ...)  NSLog(@"%s(%d): \n\n" xx "\n", __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define TTNetLog(xx, ...)
#endif


#endif /* RequestHeader_h */

//
//  CCRequestManager.h
//  VoiceCollection
//
//  Created by Tong on 2019/6/17.
//  Copyright © 2019 ZhouJinhua. All rights reserved.
//
//  第三方依赖 AFN https://github.com/AFNetworking/AFNetworking
//

#import <Foundation/Foundation.h>
#import "RequestHeader.h"
#import "AFNetworking.h"

typedef enum : NSUInteger {
    TTRequestMethodTypeGET,
    TTRequestMethodTypePOST,
} TTRequestMethodType;

typedef void(^SuccessBlock)(id _Nullable responseObject);

typedef void(^FaildBlock)(NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface TTRequestManager : NSObject

/**
 *  请求API
 *  type : 请求方式
 *  code : 请求接口API，定义在  RequestHeader.h 文件
 *  parameters :  请求参数， 可为nil
 *  headerParameters  : 请求头参数, 可为nil
 *  success  : 请求成功返回
 *  faild  : 请求失败返回
 */
+ (void)sendRequestWithRequestMethodType:(TTRequestMethodType)type
                          requestAPICode:(NSString *)code
                       requestParameters:(nullable NSDictionary *)parameters
                           requestHeader:(nullable NSDictionary *)headerParameters
                                 success:(SuccessBlock)success
                                   faild:(FaildBlock)faild;


/**
 音频上传API

 @param filepath         文件路径
 @param code             请求接口API，定义在  RequestHeader.h 文件
 @param parameters       请求参数，可为nil
 @param headerParameters 请求头参数，可为nil
 @param success          请求成功返回
 @param faild            请求失败返回
 */
+ (void)uploadAudioWithFilepath:(NSString *)filepath
                 requestAPICode:(NSString *)code
              requestParameters:(nullable NSDictionary *)parameters
                  requestHeader:(nullable NSDictionary *)headerParameters
                        success:(SuccessBlock)success
                          faild:(FaildBlock)faild;

@end

NS_ASSUME_NONNULL_END

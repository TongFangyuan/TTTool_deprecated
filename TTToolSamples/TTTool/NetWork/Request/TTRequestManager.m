//
//  TTRequestManager.m
//  VoiceCollection
//
//  Created by Tong on 2019/6/17.
//  Copyright © 2019 ZhouJinhua. All rights reserved.
//

#import "TTRequestManager.h"

@implementation TTRequestManager

// 请求API
+ (void)sendRequestWithRequestMethodType:(CCRequestMethodType)type
                          requestAPICode:(NSString *)code
                       requestParameters:(NSDictionary *)parameters
                           requestHeader:(NSDictionary *)headerParameters
                                 success:(SuccessBlock)success
                                   faild:(FaildBlock)faild
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 30;  // 超时时间设置为10s
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    if (headerParameters != nil)
    {
        // 有自定义的请求头
        for (NSString *httpHeaderField in headerParameters.allKeys) {
            NSString *value = headerParameters[httpHeaderField];
            [manager.requestSerializer setValue:value forHTTPHeaderField:httpHeaderField];
        }
    }
    
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@",REQUEST,code];
    
    dispatch_main_async_safe(^{
        [UIApplication.sharedApplication setNetworkActivityIndicatorVisible:YES];
    });

    NSLog(@"----- 请求的接口：%@ ------- 请求的参数： %@ ",requestUrl,parameters);
    
    if (type == CCRequestMethodTypeGET)
    {
        // Get请求
        [manager GET:requestUrl parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"reponse: %@",responseObject);
            dispatch_main_async_safe(^{
                [UIApplication.sharedApplication setNetworkActivityIndicatorVisible:NO];
                success(responseObject);
            });
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"error: %@",error);
            dispatch_main_async_safe(^{
                [UIApplication.sharedApplication setNetworkActivityIndicatorVisible:NO];
                faild(error);
            });
        }];
    }
    else
    {
        // Post请求
        [manager POST:requestUrl parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"reponse: %@",responseObject);
            dispatch_main_async_safe(^{
                [UIApplication.sharedApplication setNetworkActivityIndicatorVisible:NO];
                success(responseObject);
            });
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"error: %@",error);
            dispatch_main_async_safe(^{
                [UIApplication.sharedApplication setNetworkActivityIndicatorVisible:NO];
                faild(error);
            });
        }];
    }
}


+ (void)uploadAudioWithFilepath:(NSString *)filepath
                 requestAPICode:(NSString *)code
              requestParameters:(NSDictionary *)parameters
                  requestHeader:(NSDictionary *)headerParameters
                        success:(SuccessBlock)success
                          faild:(FaildBlock)faild

{
    AFHTTPSessionManager * manager = [[AFHTTPSessionManager alloc] init];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/xml",@"text/html", @"text/plain",@"application/x-www-form-urlencoded",@"multipart/form-data",nil];
    NSString *postURL = [NSString stringWithFormat:@"%@%@",REQUEST,code];
    NSURL *url = [NSURL URLWithString:filepath];
    NSData *audioData = [NSData dataWithContentsOfURL:url];
    
//    AudioStreamBasicDescription _format;
//    _format.mFormatID = kAudioFormatLinearPCM;
//    _format.mFormatFlags = kLinearPCMFormatFlagIsSignedInteger | kLinearPCMFormatFlagIsPacked;
//    _format.mBitsPerChannel = 16;
//    _format.mChannelsPerFrame = 1;
//    _format.mBytesPerPacket = _format.mBytesPerFrame = (_format.mBitsPerChannel / 8) * _format.mChannelsPerFrame;
//    _format.mFramesPerPacket = 1;
//    _format.mSampleRate = 16000.0f;
//    NSData *wavData = [audioData jk_wavDataWithPCMFormat:_format];
    
    NSLog(@"----- 请求的接口：%@ ------- 请求的参数： %@ ------- 上传的文件路径： %@ ",postURL,parameters,url);
    dispatch_main_async_safe(^{
        [UIApplication.sharedApplication setNetworkActivityIndicatorVisible:YES];
    });
    [manager POST:postURL parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:audioData name:@"file" fileName:@"file.wav" mimeType:@"audio"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"upload audio progress %@",uploadProgress.localizedDescription);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"reponse: %@",responseObject);
        dispatch_main_async_safe(^{
            [UIApplication.sharedApplication setNetworkActivityIndicatorVisible:NO];
            success(responseObject);
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error: %@",error);
        dispatch_main_async_safe(^{
            [UIApplication.sharedApplication setNetworkActivityIndicatorVisible:NO];
            faild(error);
        });
    }];
}

@end

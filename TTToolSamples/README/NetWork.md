# NetWork模块

##  TTNetWork

### 第三方依赖
`pod 'AFNetworking', '~> 3.0'`

### `RequestHeader.h`

定义服务器地址和接口地址的文件
```
#define REQUEST @"填写你得服务器地址"  //服务器地址
#define AddUser @"/user/add"
...
more
```

### 开始使用

```
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
```

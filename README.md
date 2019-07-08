# FYCategory
开发中写的扩展，总结收集一下，节省开发时间
## NSString
```objc
// 判断是否为合法的手机号码
- (BOOL)fy_isPhoneNumber; 
```


Tool模块
===
一些工具类

FYTimeWatch
---
检测事件运行时间,在DEBUG模式下才会生效,不会影响线上版本
用法示例
```
// 事件开始执行,开启计时器
[FYTimeWatch startForEventName:@"FYTimeWatch test"];


// 事件执行完毕,关闭计时器,后台会打印运行的时间
[FYTimeWatch stop];
```
控制台输出:
```
2018-03-29 11:32:53.307860+0800 FYCategoryExample[41804:23640123] >>>>>>> [FYTimeWatch test] took 3.448325 seconds
```


# 加密

## AES加密
`TTAES128Encrypter`类
```
---------参数---------
|   密码（key）:encrypt123456789
|   偏移量（iv）:edecrypt12345678
|   加密模式：CBC
|   填充：PKCS7Padding
|   编码：utf-8
---------加密----------
|   输入：手机回收加密测试
|   加密：5b73a4ae6ab2a698b6a22ccc449fc24dfc08baf9754cc40b4cc2d8d9e18afab2
----------------------
```

iOS笔记
---
- [iOS资料整理201808.md](https://github.com/TongFangyuan/WorkSummary/blob/master/iOS%E8%B5%84%E6%96%99%E6%95%B4%E7%90%86%EF%BC%888%E6%9C%88%EF%BC%89.md)

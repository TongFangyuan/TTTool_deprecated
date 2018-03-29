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

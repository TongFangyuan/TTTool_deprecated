//
//  NSFileManager+TTFile.h
//  TTToolSamples
//
//  Created by Tong on 2019/6/25.
//  Copyright © 2019 Tongfy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSFileManager (TTFile)

/**
 检测 iCloud 可用性
 这个方法内部会查找当前应用拥有的 iCloud 容器， 如果找到就会返回这个容器的 URL， 证明当前应用的 iCloud 容器可用。 如果找不到，就会返回 nil， 证明当前应用的 iCloud 不可用。
 这个方法接受一个参数， 就是要获取的容器标识。 所谓容器标识， 大多数应用只会用到一个 iCloud 容器，所以我们这里传入 nil， 就代表默认获取第一个可用的容器。
 http://swiftcafe.io/2016/08/16/icloud/
 
 Returns a file URL for the root of the ubiquity container directory corresponding to the supplied container ID.
 Returns nil if the mobile container does not exist or could not be determined.
 */
+ (NSURL *)tt_URLForICloudContainerIdentifier:(nullable NSString *)identifier;

@end

NS_ASSUME_NONNULL_END

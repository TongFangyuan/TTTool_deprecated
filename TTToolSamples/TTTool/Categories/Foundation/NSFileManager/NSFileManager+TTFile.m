//
//  NSFileManager+TTFile.m
//  iBox
//
//  Created by Tong on 2019/6/25.
//  Copyright © 2019 Tongfy. All rights reserved.
//

#import "NSFileManager+TTFile.h"

@implementation NSFileManager (TTFile)

/**
 检测 iCloud 可用性
 这个方法接受一个参数， 就是要获取的容器标识。 所谓容器标识， 大多数应用只会用到一个 iCloud 容器，所以我们这里传入 nil， 就代表默认获取第一个可用的容器。
 
 Returns a file URL for the root of the ubiquity container directory corresponding to the supplied container ID.
 Returns nil if the mobile container does not exist or could not be determined.
 */
+ (NSURL *)tt_URLForICloudContainerIdentifier:(nullable NSString *)identifier {
    return [NSFileManager.defaultManager URLForUbiquityContainerIdentifier:identifier];
}

@end

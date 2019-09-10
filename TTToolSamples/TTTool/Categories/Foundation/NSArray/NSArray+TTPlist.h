//
//  NSArray+TTPlist.h
//  TTToolSamples
//
//  Created by Tong on 2019/7/5.
//  Copyright © 2019 Tongfy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (TTPlist)


/**
 加载 mainBundle 中的 plist 文件中的数据

 @param fileName 文件名称
 */
+ (NSArray *)tt_loadArrayWithPlist:(NSString *)fileName;


/**
 加载 plist 文件中的数据

 @param bundle 包
 @param fileName 文件名称
 */
+ (NSArray *)tt_loadArrayFromBundle:(NSBundle *)bundle
                              plist:(NSString *)fileName;

@end

NS_ASSUME_NONNULL_END

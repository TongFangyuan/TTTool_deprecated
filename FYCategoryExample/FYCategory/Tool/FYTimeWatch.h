//
//  FYTimeTestTool.h
//  FYCategoryExample
//
//  Created by admin on 2018/3/29.
//  Copyright © 2018年 IOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FYTimeWatch : NSObject

+ (void)startForEventName:(NSString *)name;
+ (NSTimeInterval)stop;

@end

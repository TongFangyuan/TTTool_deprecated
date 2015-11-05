//
//  NSArray+FYRemove.h
//  GWIM
//
//  Created by apple on 15/11/5.
//  Copyright © 2015年 绿网天下. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (FYRemove)

// 移除空的字符串 如:@""
- (NSArray *)fy_removeEmptyString;

@end

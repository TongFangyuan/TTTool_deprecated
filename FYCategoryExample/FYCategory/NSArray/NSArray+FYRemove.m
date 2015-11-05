//
//  NSArray+FYRemove.m
//  GWIM
//
//  Created by apple on 15/11/5.
//  Copyright © 2015年 绿网天下. All rights reserved.
//

#import "NSArray+FYRemove.h"

@implementation NSArray (FYRemove)

- (NSArray *)fy_removeEmptyString{
    
    NSMutableArray *newMutableArray = [NSMutableArray array];
    
    for (NSString *aString in self) {
        
        if (![aString isKindOfClass:[NSString class]]) {
            [newMutableArray addObject:aString];
            break;
        }
        
        if (![aString isEqualToString:@""]) {
            [newMutableArray addObject:aString];
        }
    }
    
    return [newMutableArray copy];
}

@end

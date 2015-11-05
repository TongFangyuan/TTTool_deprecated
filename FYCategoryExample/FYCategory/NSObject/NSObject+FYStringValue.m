//
//  NSObject+FYStringValue.m
//  GWIM
//
//  Created by apple on 15/10/22.
//  Copyright © 2015年 绿网天下. All rights reserved.
//

#import "NSObject+FYStringValue.h"

@implementation NSObject (FYStringValue)

- (NSString *)fy_stringValue:(NSInteger)integer{
    return [NSString stringWithFormat:@"%zd", integer];
}
@end

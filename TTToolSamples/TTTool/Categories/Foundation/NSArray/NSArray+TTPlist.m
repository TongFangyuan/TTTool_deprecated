//
//  NSArray+TTPlist.m
//  TTToolSamples
//
//  Created by Tong on 2019/7/5.
//  Copyright © 2019 Tongfy. All rights reserved.
//

#import "NSArray+TTPlist.h"

@implementation NSArray (TTPlist)

+ (NSArray *)tt_loadArrayWithPlist:(NSString *)fileName {
    return [self tt_loadArrayFromBundle:[NSBundle mainBundle] plist:fileName];
}

+ (NSArray *)tt_loadArrayFromBundle:(NSBundle *)bundle plist:(NSString *)fileName {
    NSString *plistPath = [bundle pathForResource:fileName ofType:@"plist"];
    return [[NSArray alloc] initWithContentsOfFile:plistPath];
}

@end

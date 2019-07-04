//
//  NSBundle+TTBundle.m
//  TTToolSamples
//
//  Created by Tong on 2019/7/4.
//  Copyright © 2019 tongfy. All rights reserved.
//

#import "NSBundle+TTBundle.h"

@implementation NSBundle (TTBundle)

+ (nullable UIView *)tt_loadXibViewWithName:(NSString *)name
{
    return [[[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil] firstObject];
}

+ (nullable NSString *)tt_filePathWithName:(NSString *)fileName
                                      type:(NSString *)type
{
    return [[NSBundle mainBundle] pathForResource:fileName ofType:type];
}

@end

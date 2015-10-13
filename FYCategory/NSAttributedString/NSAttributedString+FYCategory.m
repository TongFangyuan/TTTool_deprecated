//
//  NSAttributedString+FYCategory.m
//  GWIM
//
//  Created by IOS on 15/10/13.
//  Copyright (c) 2015年 绿网天下. All rights reserved.
//

#import "NSAttributedString+FYCategory.h"

@implementation NSAttributedString (FYCategory)

- (NSAttributedString *)fy_markString:(NSString *)aString{
    NSMutableAttributedString * mutStr = [self mutableCopy];
    NSString *textStr = [self.string mutableCopy];
    NSRange range = [textStr rangeOfString:aString options:NSLiteralSearch];
    if (range.location == NSNotFound) {
        return mutStr;
    }
    [mutStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:range];
    return mutStr;
}
@end

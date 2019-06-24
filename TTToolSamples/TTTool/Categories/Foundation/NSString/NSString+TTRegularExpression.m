//
//  NSString+TTRegularExpression.m
//  TTToolSamples
//
//  Created by Tong on 2019/6/24.
//  Copyright © 2019 tongfy. All rights reserved.
//

#import "NSString+TTRegularExpression.h"

@implementation NSString (TTRegularExpression)

- (NSString *)tt_deleteCharactersWithPattern:(NSString *)pattern {
    if (self.length==0 || !self) return nil;
    NSError *error = nil;
    NSRegularExpression *regularExpress = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    NSString *string = [regularExpress stringByReplacingMatchesInString:self options:0 range:NSMakeRange(0, [self length]) withTemplate:@""];
    return string;
}

@end

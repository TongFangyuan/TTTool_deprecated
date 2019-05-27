//
//  NSDictionary+String.m
//  Host
//
//  Created by 童方园 on 2019/5/7.
//  Copyright © 2019 童方园. All rights reserved.
//

#import "NSDictionary+String.h"

@implementation NSDictionary (String)

- (NSString *)tt_toString
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&parseError];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@" " withString:@""];
    return jsonString;
}

@end

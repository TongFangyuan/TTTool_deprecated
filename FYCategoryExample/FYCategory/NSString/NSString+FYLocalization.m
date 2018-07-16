//
//  NSString+Localization.m
//  FYCategoryExample
//
//  Created by admin on 2018/7/16.
//  Copyright © 2018年 IOS. All rights reserved.
//

#import "NSString+FYLocalization.h"

@implementation NSString (FYLocalization)

- (NSString *)fy_localizedString {
    return NSLocalizedString(self, nil);
}

@end

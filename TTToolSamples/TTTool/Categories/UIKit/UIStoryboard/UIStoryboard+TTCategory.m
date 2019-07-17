//
//  UIStoryboard+TTCategory.m
//  iBox
//
//  Created by Tong on 2019/7/4.
//  Copyright © 2019 Tongfy. All rights reserved.
//

#import "UIStoryboard+TTCategory.h"

@implementation UIStoryboard (TTCategory)

+ (__kindof UIViewController *)tt_loadViewControllerWithsbName:(NSString *)sbName
                                           identifier:(NSString *)identifier
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:sbName bundle:nil];
    return [sb instantiateViewControllerWithIdentifier:identifier];
}

@end

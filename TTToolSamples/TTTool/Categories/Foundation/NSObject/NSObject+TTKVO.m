//
//  NSObject+TTKVO.m
//  TTToolSamples
//
//  Created by Tong on 2018/7/17.
//  Copyright © 2019 tongfy. All rights reserved.
//

#import "NSObject+TTKVO.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation NSObject (TTKVO)

- (void)tt_addObserverForValueChange
{
    NSArray *allPropertyKeys = [self tt_propertyKeys];
    void *context = nil;
    if ([self respondsToSelector:@selector(tt_KVOContext)]) {
        context = (__bridge void *)([self performSelector:@selector(tt_KVOContext)]);
    }
    for (NSString *keyPath in allPropertyKeys) {
        [self addObserver:self forKeyPath:keyPath options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:context];
    }
//    NSLog(@"observer Property Keys: %@",allPropertyKeys);
}

- (void)tt_removeObserverForValueChange
{
    NSArray *allPropertyKeys = [self tt_propertyKeys];
    void *context = nil;
    if ([self respondsToSelector:@selector(tt_KVOContext)]) {
        context = (__bridge void *)([self performSelector:@selector(tt_KVOContext)]);
    }
    for (NSString *keyPath in allPropertyKeys) {
        [self removeObserver:self forKeyPath:keyPath  context:context];
    }
}

- (NSArray *)tt_propertyKeys
{
    NSMutableArray *array = [NSMutableArray array];
    Class class = [self class];
    while (class != [NSObject class])
    {
        unsigned int propertyCount;
        objc_property_t *properties = class_copyPropertyList(class, &propertyCount);
        for (int i = 0; i < propertyCount; i++)
        {
            // 获取所有属性
            objc_property_t property = properties[i];
            const char *propertyName = property_getName(property);
            NSString *key = [NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding];
            
            // 判断是否 readonly
            BOOL readonly = NO;
            const char *attributes = property_getAttributes(property);
            NSString *encoding = [NSString stringWithCString:attributes encoding:NSUTF8StringEncoding];
            if ([[encoding componentsSeparatedByString:@","] containsObject:@"R"])
            {
                readonly = YES;
                
                //see if there is a backing ivar with a KVC-compliant name
                NSRange iVarRange = [encoding rangeOfString:@",V"];
                if (iVarRange.location != NSNotFound)
                {
                    NSString *iVarName = [encoding substringFromIndex:iVarRange.location + 2];
                    if ([iVarName isEqualToString:key] ||
                        [iVarName isEqualToString:[@"_" stringByAppendingString:key]])
                    {
                        //setValue:forKey: will still work
                        readonly = NO;
                    }
                }
            }
            
            // 是否在移除列表
            if ([self respondsToSelector:@selector(tt_ignoredChangeKeys)]) {
                NSArray *ignoredkeys = [self performSelector:@selector(tt_ignoredChangeKeys)];
                for (NSString *aKey in ignoredkeys) {
                    if ([aKey isEqualToString:key]) {
                        readonly = YES;
                    }
                }
            }
            
            if (!readonly)
            {
                //exclude read-only properties
                [array addObject:key];
            }
        }
        free(properties);
        class = [class superclass];
    }
    return array;
}

@end

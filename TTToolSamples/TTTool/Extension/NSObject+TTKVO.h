//
//  NSObject+TTKVO.h
//  HelloWord
//
//  Created by admin on 2018/7/17.
//  Copyright © 2018年 008. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol TTKVO <NSObject>

@required
/// 不观察的属性数组
- (NSArray<NSString *> *)tt_ignoredChangeKeys;
- (void *)tt_KVOContext;
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context;

@end

@interface NSObject (TTKVO)


/// 添加监听
- (void)tt_addObserverForValueChange;
/// 移除监听
- (void)tt_removeObserverForValueChange;
/// 当前观察的属性数组
- (NSArray *)tt_propertyKeys;

@end

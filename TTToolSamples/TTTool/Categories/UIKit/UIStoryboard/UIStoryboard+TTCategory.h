//
//  UIStoryboard+TTCategory.h
//  TTToolSamples
//
//  Created by Tong on 2019/7/4.
//  Copyright © 2019 Tongfy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 唯一标志符
typedef NSString * UIStoryboardIdentifier;

@interface UIStoryboard (TTCategory)


/**
 加载Storyboard中的控制器

 @param sbName Storyboard名称
 @param identifier 控制器的唯一标识
 */
+ (__kindof UIViewController *)tt_loadViewControllerWithsbName:(NSString *)sbName
                                           identifier:(NSString *)identifier;
@end

NS_ASSUME_NONNULL_END

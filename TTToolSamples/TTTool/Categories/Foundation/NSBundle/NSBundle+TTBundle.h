//
//  NSBundle+TTBundle.h
//  TTToolSamples
//
//  Created by Tong on 2019/7/4.
//  Copyright © 2019 tongfy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (TTBundle)

+ (nullable UIView *)tt_loadXibViewWithName:(NSString *)name;

+ (nullable NSString *)tt_filePathWithName:(NSString *)fileName
                                      type:(NSString *)type;

@end

NS_ASSUME_NONNULL_END

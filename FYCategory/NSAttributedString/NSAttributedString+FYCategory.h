//
//  NSAttributedString+FYCategory.h
//  GWIM
//
//  Created by IOS on 15/10/13.
//  Copyright (c) 2015年 绿网天下. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (FYCategory)

/**
 *  给某个字符串中的字符标红
 */
- (NSAttributedString *)fy_markString:(NSString *)aString;

@end

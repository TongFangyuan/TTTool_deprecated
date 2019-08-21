//
//  NSDate+TTInternetDateTime.h
//  Host
//
//  Created by Tong on 2019/8/21.
//  Copyright © 2019 童方园. All rights reserved.
//

#import <Foundation/Foundation.h>

// Formatting hints
typedef enum {
    DateFormatHintNone,
    DateFormatHintRFC822,
    DateFormatHintRFC3339
} DateFormatHint;

NS_ASSUME_NONNULL_BEGIN

/**
 服务器时间格式化
 */
@interface NSDate (TTInternetDateTime)

// Get date from RFC3339 or RFC822 string
// - A format/specification hint can be used to speed up,
//   otherwise both will be attempted in order to get a date
+ (NSDate *)tt_dateFromInternetDateTimeString:(NSString *)dateString
                                formatHint:(DateFormatHint)hint;

// Get date from a string using a specific date specification
+ (NSDate *)tt_dateFromRFC3339String:(NSString *)dateString;
+ (NSDate *)tt_dateFromRFC822String:(NSString *)dateString;

@end

NS_ASSUME_NONNULL_END

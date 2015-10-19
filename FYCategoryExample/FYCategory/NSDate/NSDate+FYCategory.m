//
//  NSDate+FYCategory.m
//  GWIM
//
//  Created by IOS on 15/7/14.
//  Copyright (c) 2015年 绿网天下. All rights reserved.
//

typedef struct DATEPARTS_t {
    int year;
    int month;
    int day;
} DATEPARTS;

#import "NSDate+FYCategory.h"
#import "NSDateFormatter+FYCategory.h"

@implementation NSDate (FYCategory)

+ (NSString *)fy_formattedTimeFromTimeInterval:(long long)time Fmt24:(BOOL)fmt24 Simple:(BOOL)simple {
    return [[NSDate fy_dateWithTimeIntervalInMilliSecondSince1970:time] fy_formattedTime:fmt24 Simple:simple];
}

+ (NSDate *)fy_dateWithTimeIntervalInMilliSecondSince1970:(double)timeIntervalInMilliSecond {
    NSDate *ret = nil;
    double timeInterval = timeIntervalInMilliSecond;
    
    if(timeIntervalInMilliSecond > 140000000000) {
        timeInterval = timeIntervalInMilliSecond / 1000;
    }
    ret = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    
    return ret;
}

/*标准时间日期描述*/
- (NSString *)fy_formattedTime:(BOOL)fmt24 Simple:(BOOL)isSimple {
    
    NSInteger year = [self fy_compareYear];
    NSInteger month = [self fy_compareMonth];
    NSInteger day = [self fy_compareDay];
    NSDateFormatter *dateFormatter = [NSDateFormatter fy_dateFormatterWithFormat:@"MM-dd HH:mm"];
    NSString *ret = @"";
    
     if (year == 0){ //当年
        
        if (month == 0 && day == 0) { //今天
            dateFormatter = [NSDateFormatter fy_dateFormatterWithFormat:@"HH:mm"];
        } else if (month == 0 && day == -1){ //昨天
            dateFormatter = [NSDateFormatter fy_dateFormatterWithFormat:@"昨天"];
        } else {
             dateFormatter = [NSDateFormatter fy_dateFormatterWithFormat:@"MM-dd"];
        }
     } else {
         
        dateFormatter = [NSDateFormatter fy_dateFormatterWithFormat:@"YYYY-MM-dd HH:mm"];
        
     }
    
    ret = [dateFormatter stringFromDate:self];
    return ret;
}



// 以下各方法均计算为本地时间

- (void)fy_dateParts:(DATEPARTS *)parts {
    time_t t = (time_t)[self timeIntervalSince1970];
    struct tm * tm_ = localtime(&t);
    parts->year = tm_->tm_year + 1900;
    parts->month = tm_->tm_mon + 1;
    parts->day = tm_->tm_mday;
}

- (int)fy_year{
    time_t t = (time_t)[self timeIntervalSince1970];
    struct tm * tm_ = localtime(&t);
    return tm_->tm_year + 1900;
}

- (int)fy_month {
    time_t t = (time_t)[self timeIntervalSince1970];
    struct tm * tm_ = localtime(&t);
    return tm_->tm_mon + 1;
}

- (int)fy_day {
    time_t t = (time_t)[self timeIntervalSince1970];
    struct tm * tm_ = localtime(&t);
    return tm_->tm_mday;
}

#pragma mark 作业卡片截至时间布置
+ (NSString *)fy_formattedDeadTimeFromTimeInterval:(long long)time Fmt24:(BOOL)fmt24 Simple:(BOOL)simple {
    return [[NSDate fy_dateWithTimeIntervalInMilliSecondSince1970:time] fy_formattedDeadTime:fmt24 Simple:simple];
}

- (NSString *)fy_formattedDeadTime:(BOOL)fmt24 Simple:(BOOL)isSimple{
    
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [NSDateFormatter fy_dateFormatterWithFormat:@"MM-dd HH:mm"];
    NSString *ret = @"";
    NSInteger minute = [self fy_minutesAfterDate:date];
    NSInteger compareDay = [self fy_compareDay];
    NSInteger year = [self fy_compareYear];
    NSInteger month = [self fy_compareMonth];
    
    if (minute<=0) {
         dateFormatter = [NSDateFormatter fy_dateFormatterWithFormat:@"已截止"];
    } else if (minute>0){ //未截止
        
        if (year == 0 && month == 0) {
            if (compareDay == 0) {
                dateFormatter = [NSDateFormatter fy_dateFormatterWithFormat:@"HH:mm"];
            } else if (compareDay == 1){
                dateFormatter = [NSDateFormatter fy_dateFormatterWithFormat:@"明天 HH:mm"];
            } else {
                dateFormatter = [NSDateFormatter fy_dateFormatterWithFormat:@"MM-dd HH:mm"];
            }
        } else if (year == 1){
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"YYYYMMddHHmm"];
            NSString * dateNow = [formatter stringFromDate:[NSDate date]];
            NSInteger dayNow= [[dateNow substringWithRange:NSMakeRange(6,2)] integerValue];
            
            if (month == -11 && dayNow == 1 ) {
                dateFormatter = [NSDateFormatter fy_dateFormatterWithFormat:@"明天 HH:mm"];
            }
        } else {
           dateFormatter = [NSDateFormatter fy_dateFormatterWithFormat:@"YYYY-MM-dd HH:mm"];
        }
        
    }
    
    ret = [dateFormatter stringFromDate:self];
    return ret;
    
}

- (NSInteger)fy_minutesAfterDate: (NSDate *) aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / D_MINUTE);
}

- (NSInteger)fy_minutesBeforeDate: (NSDate *) aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / D_MINUTE);
}

- (NSInteger)fy_hoursAfterDate: (NSDate *) aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / D_HOUR);
}

- (NSInteger)fy_hoursBeforeDate: (NSDate *) aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / D_HOUR);
}

- (NSInteger)fy_daysAfterDate: (NSDate *) aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
//    [self fy_compareDay];
    return (NSInteger) (ti / D_DAY);
}

- (NSInteger)fy_daysBeforeDate: (NSDate *) aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / D_DAY);
}

/**
 *  比较同年同月的天数 0表示当天,1表示明天,-1表示昨天
 *
 *  @return
 */
- (NSInteger)fy_compareDay
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYYMMddHHmm"];
    NSString * dateNow = [formatter stringFromDate:[NSDate date]];
    NSInteger dayNow= [[dateNow substringWithRange:NSMakeRange(6,2)] integerValue];
    NSString * dateSelf = [formatter stringFromDate:self];
    NSInteger daySelf= [[dateSelf substringWithRange:NSMakeRange(6,2)] integerValue];
    
    return (daySelf-dayNow);
}


/**
 *  比较同年的月份 0表示当月，1和-11表示下一个月，-1表示上一个月
 *
 */
- (NSInteger)fy_compareMonth
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYYMMddHHmm"];
    NSString * dateNow = [formatter stringFromDate:[NSDate date]];
    NSInteger monthNow= [[dateNow substringWithRange:NSMakeRange(4,2)] integerValue];
    NSString * dateSelf = [formatter stringFromDate:self];
    NSInteger monthSelf= [[dateSelf substringWithRange:NSMakeRange(4,2)] integerValue];
    
    return (monthSelf - monthNow);
}

/**
 *  比较年份 0表示当当年，1表示明年，-1表示去年
 *
 */
- (NSInteger)fy_compareYear
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYYMMddHHmm"];
    NSString * dateNow = [formatter stringFromDate:[NSDate date]];
    NSInteger yearNow= [[dateNow substringWithRange:NSMakeRange(0,4)] integerValue];
    NSString * dateSelf = [formatter stringFromDate:self];
    NSInteger yearSelf= [[dateSelf substringWithRange:NSMakeRange(0,4)] integerValue];
    
    return (yearSelf - yearNow);
}
@end

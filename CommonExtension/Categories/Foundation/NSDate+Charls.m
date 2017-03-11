//
//  NSDate+Charls.m
//  CommonExtension
//
//  Created by charls on 16/9/9.
//  Copyright © 2016年 Charls. All rights reserved.
//

#import "NSDate+Charls.h"
#import "NSDateFormatter+Charls.h"

// 日历单元
#define DATE_COMPONENTS (NSCalendarUnitEra| NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay |  NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitNanosecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekOfYear | NSCalendarUnitYearForWeekOfYear | NSCalendarUnitQuarter)
// 当前日历
#define CURRENT_CALENDAR [NSCalendar currentCalendar]

#pragma mark - NSDate
@implementation NSDate (Charls)

@end

#pragma mark - 常用属性
@implementation NSDate (ExtendedProperties)

// 纪元、年代
- (NSInteger)era {
    return [[CURRENT_CALENDAR components:NSCalendarUnitEra fromDate:self] era];
}

// 年份
- (NSInteger)year {
    return [[CURRENT_CALENDAR components:NSCalendarUnitYear fromDate:self] year];
}

// 月份
- (NSInteger)month {
    return [[CURRENT_CALENDAR components:NSCalendarUnitMonth fromDate:self] month];
}

// 天 (1~31)
- (NSInteger)day {
    return [[CURRENT_CALENDAR components:NSCalendarUnitDay fromDate:self] day];
}

// 时 (0~59)
- (NSInteger)hour {
    return [[CURRENT_CALENDAR components:NSCalendarUnitHour fromDate:self] hour];
}

// 分 (0~59)
- (NSInteger)minute {
    return [[CURRENT_CALENDAR components:NSCalendarUnitMinute fromDate:self] minute];
}

// 秒
- (NSInteger)second {
    return [[CURRENT_CALENDAR components:NSCalendarUnitSecond fromDate:self] second];
}

// 纳秒
- (NSInteger)nanosecord {
    return [[CURRENT_CALENDAR components:NSCalendarUnitNanosecond fromDate:self] nanosecond];
}

// 星期 (1~7)，如果系统设置以星期天为一个星期的起始，那么 “1” 代表星期天
- (NSInteger)weekday {
    return [[CURRENT_CALENDAR components:NSCalendarUnitWeekday fromDate:self] weekday];
}

// 该月中的第几个周x (x为该日期的星期x)
- (NSInteger)weekdayOrdinal {
    return [[CURRENT_CALENDAR components:NSCalendarUnitWeekdayOrdinal fromDate:self] weekdayOrdinal];
}

// 该月份的第几周
- (NSInteger)weekOfMonth {
    return [[CURRENT_CALENDAR components:NSCalendarUnitWeekOfMonth fromDate:self] weekOfMonth];
}

// 该年的第几周
- (NSInteger)weekOfYear {
    return [[CURRENT_CALENDAR components:NSCalendarUnitWeekOfYear fromDate:self] weekOfYear];
}

// 返回该日期的周的所在年份
- (NSInteger)yearForWeekOfYear {
    return [[CURRENT_CALENDAR components:NSCalendarUnitYearForWeekOfYear fromDate:self] yearForWeekOfYear];
}

// 当前年中的第几个季度
- (NSInteger)quarter {
    return [[CURRENT_CALENDAR components:NSCalendarUnitQuarter fromDate:self] quarter];
}

// 是否闰月
- (BOOL)isLeapMonth {
    return [[CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self] isLeapMonth];
}

// 是否闰年 (判断条件: 1、能整除4且不能整除100  2、能整除400)
- (BOOL)isLeapYear {
    NSUInteger year = self.year;
    return ((year % 400 == 0) || ((year % 100 != 0) && (year % 4 == 0)));
}

// 判断日期是否是昨天
- (BOOL)isYesterday {
    NSDate *yesterday = [NSDate yesterday];
    if (yesterday == nil) return NO;
    
    return [self isEqualToDateIgnoringTime:yesterday];
}

// 判断日期是否是今天
- (BOOL)isToday {
    return [self isEqualToDateIgnoringTime:[NSDate date]];
}


// 判断日期是否是明天
- (BOOL)isTomorrow {
    NSDate *tomorrow = [NSDate tomorrow];
    if (tomorrow == nil) return NO;
    
    return [self isEqualToDateIgnoringTime:tomorrow];
}

// 判断日期是否是今年
- (BOOL)isThisYear {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:self];
    NSInteger thisYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    return selfYear == thisYear;
}

@end

#pragma mark - 日期比较
@implementation NSDate (Compare)

// 与另一个日期判断是否是同一天
- (BOOL)isEqualToDateIgnoringTime:(nonnull NSDate *)date {
    NSCalendarUnit unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *selfComponents = [[NSCalendar currentCalendar] components:unitFlags fromDate:self];
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:unitFlags fromDate:date];
    return ((selfComponents.year == dateComponents.year) && (selfComponents.month == dateComponents.month) && (selfComponents.day == dateComponents.day));
}

// 与另一个日期判断是否是同一时间 (忽略分秒)
- (BOOL)isEqualToHourIgnoringMinute:(NSDate *)date {
    if (![self isEqualToDateIgnoringTime:date]) {
        return NO;
    }
    NSCalendarUnit unitFlags = NSCalendarUnitHour;
    NSDateComponents *selfComponents = [[NSCalendar currentCalendar] components:unitFlags fromDate:self];
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:unitFlags fromDate:date];
    return (selfComponents.hour == dateComponents.hour);
}

// 比较两个日期之间的差值
+ (nonnull NSDateComponents *)deltaFromDate:(nonnull NSDate *)fromDate toDate:(nonnull NSDate *)toDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unitFlags fromDate:fromDate toDate:toDate options:NSCalendarWrapComponents];
}

@end

#pragma mark - 调整日期
@implementation NSDate (AdjustingDate)

// 获取当前时间戳
+ (NSTimeInterval)currentTimeStamp {
    return [NSDate dateWithTimeIntervalSinceNow:0.0].timeIntervalSince1970;
}

// 返回昨天此刻的日期
+ (nullable instancetype)yesterday {
    return [[NSDate date] dateByAddingDays:-1];
}

// 返回明天此刻的日期
+ (nullable instancetype)tomorrow {
    return [[NSDate date] dateByAddingDays:1];
}

// 在参照日期的基础上增加多少秒（使用负数来减少）
- (nullable NSDate*)dateByAddingSeconds:(NSTimeInterval)seconds {
    return [NSDate dateWithTimeInterval:seconds sinceDate:self];
}

// 在参照日期的基础上增加多少分钟（使用负数来减少）
- (nullable NSDate*)dateByAddingMinutes:(NSInteger)minutes {
    return [NSDate dateWithTimeInterval:(60 * minutes) sinceDate:self];
}

// 在参照日期的基础上增加多少小时（使用负数来减少）
- (nullable NSDate*)dateByAddingHours:(NSInteger)hours {
    return [NSDate dateWithTimeInterval:(3600 * hours) sinceDate:self];
}

// 在参照日期的基础上增加多少天（使用负数来减少天数）
- (nullable NSDate*)dateByAddingDays:(NSInteger)days {
    NSDateComponents *dateComponents = [NSDateComponents new];
    dateComponents.day = days;
    return [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
}

// 在参照日期的基础上增加多少周（使用负数来减少周数）
- (nullable NSDate *)dateByAddingWeeks:(NSInteger)weeks {
    NSDateComponents *dateComponents = [NSDateComponents new];
    dateComponents.weekOfYear = weeks;
    return [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
}

// 在参照日期的基础上增加多少月（用负数来减少月数）
- (nullable NSDate*)dateByAddingMonths:(NSInteger)months {
    NSDateComponents *dateComponents = [NSDateComponents new];
    dateComponents.month = months;
    return [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
}

// 在参照日期的基础上增加多少年（用负数来减少年数）
- (nullable NSDate*)dateByAddingYears:(NSInteger)years {
    NSDateComponents *dateComponents = [NSDateComponents new];
    dateComponents.year = years;
    return [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
}

@end


@implementation NSDate (Format)

// 获取标准格式的日期字符串，格式为：2016-01-01T00:00:00+0800
- (nonnull NSString *)stringWithISOFormat {
    return [[NSDateFormatter isoFormatter] stringFromDate:self];
}

// 获取常用的日期字符串，格式为：2016-01-01 00:00:00
- (nonnull NSString *)stringWithRoutineFormat {
    return [[NSDateFormatter routineFormatter] stringFromDate:self];
}

// 获取常用的日期字符串，格式为：2016年1月1日
- (nonnull NSString *)stringWithYearMonthAndDayFormat {
    return [[NSDateFormatter yearMonthAndDayFormat] stringFromDate:self];
}

// 获取常用的日期字符串，格式为：1月1日
- (nonnull NSString *)stringWithMonthAndDayFormat {
    return [[NSDateFormatter monthAndDayFormat] stringFromDate:self];
}

// 获取常用的日期字符串，格式为：上午 9:30
- (nonnull NSString *)stringWithHourAndMinuteFormat {
    return [[NSDateFormatter hourAndMinuteFormat] stringFromDate:self];
}

/**
 * 将日期转为指定格式的字符串
 * 格式如下:
 *  今年
 *    今天
 *      1分钟内
 *          刚刚
 *      1小时内
 *          xx分钟前
 *      大于1小时
 *          xx小时前
 *    昨天
 *      昨天 18:56:34
 *    早于昨天, 根据参数 showThisYear 是否显示年份
 *      1月23日 19:56:23 或 2016年1月23日 19:56:23
 * 非今年
 *    2015年2月8日 18:45:30
 */
- (nonnull NSString *)stringWithCommonFormatAndShowThisYear:(BOOL)showThisYear {
    // 今天
    if (self.isToday) {
        NSDateComponents *cmps = [NSDate deltaFromDate:self toDate:[NSDate  date]];
        if (cmps.hour >= 1) {
            return [NSString stringWithFormat:@"%d小时前", (int)cmps.hour];
        } else if (cmps.minute >= 1) {
            return [NSString stringWithFormat:@"%d分钟前", (int)cmps.minute];
        } else if (cmps.second >= 0) {
            return @"刚刚";
        }
    }
    
    NSString *formatStr;
    if (self.isYesterday) {
        formatStr = @"昨天 HH:mm";
    } else if (self.isThisYear && (showThisYear == NO)) {
        formatStr = @"M月d日 HH:mm";
    } else {
        formatStr = @"yyyy年M月d日 HH:mm:ss";
    }
    return [self stringWithFormat:formatStr];
}

// 根据参数返回指定格式的日期字符串
- (nonnull NSString *)stringWithFormat:(nonnull NSString *)formatStr
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = formatStr;
    formatter.locale = [NSLocale currentLocale];
    return [formatter stringFromDate:self];
}

// 根据参数返回指定格式的日期字符串
- (nonnull NSString *)stringWithFormat:(nonnull NSString *)formatStr
                              timeZone:(nullable NSTimeZone *)timeZone
                                locale:(nullable NSLocale *)locale
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = formatStr;
    [formatter setTimeZone:timeZone];
    [formatter setLocale:locale];
    return [formatter stringFromDate:self];
}

// 根据参数返回指定格式的日期
+ (nullable instancetype)dateWithString:(nonnull NSString *)dateString
                                 format:(nonnull NSString *)formatStr
{
    if (dateString == nil || dateString.length == 0) return nil;
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = formatStr;
    formatter.locale = [NSLocale currentLocale];
    return [formatter dateFromString:dateString];
}

// 根据参数返回指定格式的日期
+ (nullable instancetype)dateWithString:(nonnull NSString *)dateString
                                 format:(nonnull NSString *)formatStr
                               timeZone:(nullable NSTimeZone *)timeZone
                                 locale:(nullable NSLocale *)locale
{
    if (dateString == nil || dateString.length == 0) return nil;
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = formatStr;
    [formatter setTimeZone:timeZone];
    [formatter setLocale:locale];
    return [formatter dateFromString:dateString];
}

@end


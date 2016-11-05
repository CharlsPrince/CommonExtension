//
//  NSDate+Charls.h
//  CommonExtension
//
//  Created by charls on 16/9/9.
//  Copyright © 2016年 Charls. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Charls)

@end

#pragma mark - 常用属性
@interface NSDate (ExtendedProperties)

@property (nonatomic, assign, readonly) NSInteger era;    // 纪元
@property (nonatomic, assign, readonly) NSInteger year;   //年份
@property (nonatomic, assign, readonly) NSInteger month;  // 月份 (1~12)
@property (nonatomic, assign, readonly) NSInteger day;       // 天 (1~31)
@property (nonatomic, assign, readonly) NSInteger hour;      // 时 (0~59)
@property (nonatomic, assign, readonly) NSInteger minute;    // 分 (0~59)
@property (nonatomic, assign, readonly) NSInteger second;   // 秒 (0~59)
@property (nonatomic, assign, readonly) NSInteger nanosecord;    // 纳秒
@property (nonatomic, assign, readonly) NSInteger weekday;   // 星期 (1~7)，如果系统设置以星期天为一个星期的起始，那么 “1” 代表星期天
@property (nonatomic, assign, readonly) NSInteger weekdayOrdinal;  // 该月中的第几个周x (x为该日期的星期x)
@property (nonatomic, assign, readonly) NSInteger weekOfMonth;   // 该月份的第几周 (1~5)
@property (nonatomic, assign, readonly) NSInteger weekOfYear;   // 该年的第几周 (1~53)
@property (nonatomic, assign, readonly) NSInteger yearForWeekOfYear;   // 返回该日期的周的所在年份
@property (nonatomic, assign, readonly) NSInteger quarter;   // 当前年中的第几个季度

@property (nonatomic, assign, readonly) BOOL isLeapMonth;   // 是否是闰月
@property (nonatomic, assign, readonly) BOOL isLeapYear;    // 是否是闰年
@property (nonatomic, assign, readonly) BOOL isYesterday;   // 判断日期是否是昨天
@property (nonatomic, assign, readonly) BOOL isToday;       // 判断日期是否是今天
@property (nonatomic, assign, readonly) BOOL isTomorrow;    // 判断日期是否是明天
@property (nonatomic, assign, readonly) BOOL isThisYear;    // 判断时期是否是今年

@end

#pragma mark - 比较日期
@interface NSDate (Compare)

/**
 *  @brief 与参照日期对比 判断是否同一天 (忽略时分秒)
 */
- (BOOL)isEqualToDateIgnoringTime:(nonnull NSDate *)date;

/**
 *  @brief 与参照日期对比 判断是否同一时间 (忽略分秒)
 */
- (BOOL)isEqualToHourIgnoringMinute:(nonnull NSDate *)date;

/**
 *  @brief 比较两个日期之间的差值
 */
+ (nonnull NSDateComponents *)deltaFromDate:(nonnull NSDate *)fromDate toDate:(nonnull NSDate *)toDate;

@end

#pragma mark - 调整日期
@interface NSDate (AdjustingDate)

/**
 *  获取当前时间戳
 */
+ (NSTimeInterval)currentTimeStamp;

/**
 *  返回昨天此刻的日期
 */
+ (nullable instancetype)yesterday;

/**
 *  返回明天此刻的日期
 */
+ (nullable instancetype)tomorrow;

/**
 *  在参照日期的基础上增加多少秒（使用负数来减少）
 */
- (nullable NSDate*)dateByAddingSeconds:(NSTimeInterval)seconds;

/**
 *  在参照日期的基础上增加多少分钟（使用负数来减少）
 */
- (nullable NSDate*)dateByAddingMinutes:(NSInteger)minutes;

/**
 *  在参照日期的基础上增加多少小时（使用负数来减少）
 */
- (nullable NSDate*)dateByAddingHours:(NSInteger)hours;

/**
 *  在参照日期的基础上增加多少天（使用负数来减少天数）
 */
- (nullable NSDate*)dateByAddingDays:(NSInteger)days;

/**
 *  在参照日期的基础上增加多少周（使用负数来减少周数）
 */
- (nullable NSDate*)dateByAddingWeeks:(NSInteger)weeks;

/**
 *  在参照日期的基础上增加多少月（用负数来减少月数）
 */
- (nullable NSDate*)dateByAddingMonths:(NSInteger)months;

/**
 *  在参照日期的基础上增加多少年（用负数来减少年数）
 */
- (nullable NSDate*)dateByAddingYears:(NSInteger)years;

@end

#pragma mark - 格式化
@interface NSDate (Format)

/**
 *  获取标准格式的日期字符串，格式为：2016-01-01T00:00:00+0800
 */
- (nonnull NSString *)stringWithISOFormat;

/**
 *  获取常用的日期字符串，格式为：2016-01-01 00:00:00
 */
- (nonnull NSString *)stringWithRoutineFormat;

/**
 *  获取常用的日期字符串，格式为：2016年1月1日
 */
- (nonnull NSString *)stringWithYearMonthAndDayFormat;

/**
 *  获取常用的日期字符串，格式为：1月1日
 */
- (nonnull NSString *)stringWithMonthAndDayFormat;

/**
 *  获取常用的日期字符串，格式为：上午 9:30
 */
- (nonnull NSString *)stringWithHourAndMinuteFormat;

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
- (nonnull NSString *)stringWithCommonFormatAndShowThisYear:(BOOL)showThisYear;

/**
 *  根据参数返回指定格式的日期字符串
 */
- (nonnull NSString *)stringWithFormat:(nonnull NSString *)formatStr;

/**
 *  根据参数返回指定格式的日期字符串
 */
- (nonnull NSString *)stringWithFormat:(nonnull NSString *)formatStr
                              timeZone:(nullable NSTimeZone *)timeZone
                                locale:(nullable NSLocale *)locale;

/**
 *  根据参数返回指定格式的日期
 */
+ (nullable instancetype)dateWithString:(nonnull NSString *)dateString
                                 format:(nonnull NSString *)formatStr;

/**
 *  根据参数返回指定格式的日期
 */
+ (nullable instancetype)dateWithString:(nonnull NSString *)dateString
                                 format:(nonnull NSString *)formatStr
                               timeZone:(nullable NSTimeZone *)timeZone
                                 locale:(nullable NSLocale *)locale;

@end



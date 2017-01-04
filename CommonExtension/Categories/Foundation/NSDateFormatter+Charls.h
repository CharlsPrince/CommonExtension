//
//  NSDateFormatter+Charls.h
//  CommonExtension
//
//  Created by charls on 16/9/9.
//  Copyright © 2016年 Charls. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDateFormatter (Charls)

/**
 *  获取标准日期格式的NSDateFormatter，格式为：2016-01-01T00:00:00+0800
 */
+ (nonnull instancetype)isoFormatter;

/**
 *  获取常用日期格式的NSDateFormatter，格式为：2016-01-01 00:00:00
 */
+ (nonnull instancetype)routineFormatter;

/**
 *  获取常用日期格式的NSDateFormatter，格式为：2016年1月1日
 */
+ (nonnull instancetype)yearMonthAndDayFormat;

/**
 *  获取常用日期格式的NSDateFormatter，格式为：1月1日
 */
+ (nonnull instancetype)monthAndDayFormat;

/**
 *  获取常用日期格式的NSDateFormatter，格式为：上午 9:30
 */
+ (nonnull instancetype)hourAndMinuteFormat;


/**
 *  获取通用格式的NSDateFormatter
 *
 *  @param showTSeparator 是否显示'T'分隔符
 *  @param showTimeZone   是否显示时区
 *
 *  根据参数有可能的格式为:
 *    1.yyyy-MM-dd'T'HH:mm:ss+0800
 *    2.yyyy-MM-dd'T'HH:mm:ss
 *    3.yyyy-MM-dd HH:mm:ss+0800
 *    4.yyyy-MM-dd HH:mm:ss
 */
+ (nonnull instancetype)routineFormatByShowTSeparator:(BOOL)showTSeparator showTimeZone:(BOOL)showTimeZone;

@end

NS_ASSUME_NONNULL_END

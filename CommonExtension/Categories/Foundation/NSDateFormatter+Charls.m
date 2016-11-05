//
//  NSDateFormatter+Charls.m
//  CommonExtension
//
//  Created by charls on 16/9/9.
//  Copyright © 2016年 Charls. All rights reserved.
//

#import "NSDateFormatter+Charls.h"

@implementation NSDateFormatter (Charls)

// 获取标准日期格式的NSDateFormatter，格式为：2016-01-01T00:00:00+0800
+ (nonnull instancetype)isoFormatter {
    return [NSDateFormatter routineFormatByShowTSeparator:YES showTimeZone:YES];
}

// 获取常用日期格式的NSDateFormatter，格式为：2016-01-01 00:00:00
+ (nonnull instancetype)routineFormatter {
    return [NSDateFormatter routineFormatByShowTSeparator:NO showTimeZone:NO];
}

// 获取常用日期格式的NSDateFormatter，格式为：2016年1月1日
+ (nonnull instancetype)yearMonthAndDayFormat {
    static NSDateFormatter *formatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [NSDateFormatter new];
        formatter.locale = [NSLocale currentLocale];
        formatter.dateFormat = @"yyyy年M月d日";
    });
    return formatter;
}

// 获取常用日期格式的NSDateFormatter，格式为：1月1日
+ (nonnull instancetype)monthAndDayFormat {
    static NSDateFormatter *formatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [NSDateFormatter new];
        formatter.locale = [NSLocale currentLocale];
        formatter.dateFormat = @"M月d日";
    });
    return formatter;
}

// 获取常用日期格式的NSDateFormatter，格式为：上午 9:30
+ (nonnull instancetype)hourAndMinuteFormat {
    static NSDateFormatter *formatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [NSDateFormatter new];
        formatter.locale = [NSLocale currentLocale];
        formatter.AMSymbol = @"上午";
        formatter.PMSymbol = @"下午";
        formatter.dateFormat = @"a h:mm";
    });
    return formatter;
}

// 获取通用格式的NSDateFormatter
+ (nonnull instancetype)routineFormatByShowTSeparator:(BOOL)showTSeparator showTimeZone:(BOOL)showTimeZone {
    static NSDateFormatter *formatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [NSDateFormatter new];
        formatter.locale = [NSLocale currentLocale];
    });
    
    NSString *formatStr = @"yyyy-MM-dd";
    formatStr = (showTSeparator) ? [formatStr stringByAppendingString:@"'T'"] : [formatStr stringByAppendingString:@" "];
    formatStr = [formatStr stringByAppendingString:@"HH:mm:ss"];
    if (showTimeZone) formatStr = [formatStr stringByAppendingString:@"Z"];
    
    formatter.dateFormat = formatStr;
    return formatter;
}

@end

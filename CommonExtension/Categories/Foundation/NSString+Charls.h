//
//  NSString+Charls.h
//  CommonExtension
//
//  Created by charls on 2016/11/30.
//  Copyright © 2016年 Charls. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Charls)

@end

@interface NSString (Trimming)

/*!
 *  @brief 去除首尾空字符（包括换行符）
 *
 *  @return 去除首尾空字符后的字符串
 */
- (NSString *)trim;

/*!
 *  @brief 判断字符串是否包含空字符
 *
 *  @discussion 根据 [NSCharacterSet whitespaceAndNewlineCharacterSet] 判断
 *
 *  @return `YES` 含有空格、制表符、回车符或换行符； `NO` 不包含空字符
 */
- (BOOL)hasBlank;


/**
 判断字符串是否包含中文

 @return ‘YES’ 含有中文；‘NO’ 不包含中文
 */
- (BOOL)hasChinese;

/*!
 *  @brief 判断字符串是否包含特定字符
 *
 *  @param set 需要判断的字符集
 *
 *  @return `YES` or `NO`
 */
- (BOOL)containsCharacterSet:(NSCharacterSet *)set;

/*!
 *  @brief 返回字符串范围
 *
 *  @return [self rangeOfComposedCharacterSequenceAtIndex:self.length]
 */
- (NSRange)rangeOfAll;

@end

@interface NSString (UTF8)

/*!
 *  @brief 将 NSData 转为 UTF8 编码的字符串
 *
 *  @param data 数据
 *
 *  @return NSString or nil
 */
+ (nullable instancetype)stringWithUTF8Data:(NSData *)data;

/*!
 *  @brief 返回 UTF8 编码的NSData，等同于：[self dataUsingEncoding:NSUTF8StringEncoding]
 *
 *  @return NSData or nil
 */
- (nullable NSData *)toUTF8Data;

@end


NS_ASSUME_NONNULL_END

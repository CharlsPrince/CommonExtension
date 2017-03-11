//
//  NSArray+Charls.h
//  CommonExtension
//
//  Created by charls on 16/9/8.
//  Copyright © 2016年 Charls. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - NSArray
@interface NSArray<ObjectType> (Charls)
@end

#pragma mark - 序列化
@interface NSArray<ObjectType> (PropertyListSerialization)

/// ================================================================
///  @name: - plistData
/// ================================================================

/**
 将数组转为 plist 数据
 
 @discussion NSJSONWritingOptions 为 kNilOptions
 @return NSData or nil
 */
- (nullable NSData *)toPlistData;

/**
 将数组转为 plist 数据
 
 @discussion NSJSONWritingOptions 为 kNilOptions
 @param error 如果转换失败将会传递错误给该参数
 @return NSData or nil
 */
- (nullable NSData *)toPlistDataWithError:(NSError **)error;

/**
 通过 plist 数据实例化数组

 @param plistData plist 数据
 @return NSArray or nil
 */
+ (nullable NSArray<ObjectType> *)arrayWithPlistData:(NSData *)plistData;

/**
 通过 plist 数据实例化数组

 @param plistData plist 数据
 @param error 如果转换失败将会传递错误给该参数
 @return NSArray or nil
 */
+ (nullable NSArray<ObjectType> *)arrayWithPlistData:(NSData *)plistData error:(NSError **)error;


/// ================================================================
///  @name: - plistString
/// ================================================================

/**
 将数组转为 plist 字符串

 @return NSString or nil
 */
- (nullable NSString *)toPlistString;

/**
 将数组转为 plist 字符串

 @param error 如果转换失败将传递错误给改参数
 @return NSString or nil
 */
- (nullable NSString *)toPlistStringWithError:(NSError **)error;

/**
 将数组转为 plist 字符串

 @param format 转换格式
 @param error 如果转换失败将传递错误给改参数
 @return NSString or nil
 */
- (nullable NSString *)toPlistStringWithFormat:(NSPropertyListFormat)format error:(NSError **)error;

/**
 通过 plist 字符串实例化数组

 @param plistString plist 字符串
 @return NSArray or nil
 */
+ (nullable NSArray<ObjectType> *)arrayWithPlistString:(nonnull NSString *)plistString;


/// ================================================================
///  @name: - JSONData
/// ================================================================

/**
 将数组转为 JSON 数据
 
 @discussion NSJSONWritingOptions 为 kNilOptions
 @return NSData or nil
 */
- (nullable NSData *)toJSONData;

/**
 将数组转为 JSON 数据

 @param opt JSON 转换选项
 @param error 如果转换失败将传递错误给该参数
 @return NSData or nil
 */
- (nullable NSData *)toJSONDataWithOptions:(NSJSONWritingOptions)opt error:(NSError **)error;

/**
 将 JSON 数据转为不可变数组

 @param data JSON 数据
 @return NSArray or nil
 */
+ (nullable NSArray<ObjectType> *)arrayWithJSONData:(NSData *)data;

/**
 将 JSON 数据转为不可变数组

 @param data JSON 数据
 @param error 如果转换失败将传递错误给该参数
 @return NSArray or nil
 */
+ (nullable NSArray<ObjectType> *)arrayWithJSONData:(NSData *)data error:(NSError **)error;


/// ================================================================
///  @name: - JSONString
/// ================================================================

/**
 将数组转为 JSON 字符串

 @return NSString or nil
 */
- (nullable NSString *)toJSONString;

/**
 将数组转为 JSON 字符串

 @param error 如果转换失败将传递错误给该参数
 @return NSString or nil
 */
- (nullable NSString *)toJSONStringWithError:(NSError **)error;

/**
 通过 JSON 字符串实例化数组

 @param string JSON 字符串
 @return NSArray or nil
 */
+ (nullable NSArray<ObjectType> *)arrayWithJSONString:(NSString *)string;


/**
 通过 JSON 字符串实例化数组

 @param string JSON 字符串
 @param error 如果转换失败将传递错误给该参数
 @return NSArray or nil
 */
+ (nullable NSArray<ObjectType> *)arrayWithJSONString:(NSString *)string error:(NSError **)error;

@end


#pragma mark - 元素

@interface NSArray<ObjectType> (Element)

/**
 随机元素

 @return id or nil
 */
- (nullable id)randomObject;

/**
 根据索引获取数组元素

 @param index 索引
 @return id or nil
 */
- (nullable id)objectOrNilAtIndex:(NSUInteger)index;

@end


#pragma mark - NSMutableArray

#pragma mark - 元素

@interface NSMutableArray<ObjectType> (Element)

/**
 *  @brief 弹出数组首元素
 *
 *  @return id or nil
 */
- (nullable id)popFirstObject;

/**
 *  @brief 弹出数组末元素
 *
 *  @return id or nil
 */
- (nullable id)popLastObject;

/**
 *  @brief 弹出数组元素
 *
 *  @param index 元素下标
 *
 *  @return id or nil
 */
- (nullable id)popObjectAtIndex:(int)index;

/**
 *  @brief 翻转数组元素
 */
- (void)reverse;

/**
 *  @brief 打乱数组元素
 */
- (void)shuffle;

/**
 安全添加元素

 @param object id
 */
- (void)safeAddObject:(_Nonnull id)object;

@end

NS_ASSUME_NONNULL_END

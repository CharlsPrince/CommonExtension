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
@interface NSArray (Charls)
@end

#pragma mark - 序列化
@interface NSArray (PropertyListSerialization)

/**
 *  @brief 通过plist 数据实例化 NSArray
 *
 *  @param plistData 属性列表数据
 *
 *  @return NSArray or nil
 */
+ (nullable instancetype)arrayWithPlistData:(nonnull NSData *)plistData;

/**
 *  @brief 通过 plist 字符串实例化 NSArray
 *
 *  @param plistString 属性列表字符串
 *
 *  @return NSArray or nil
 */
+ (nullable instancetype)arrayWithPlistString:(nonnull NSString *)plistString;

/**
 *  @brief 将数组转化为 plist data
 */
- (nullable NSData *)plistData;

/**
 *  @brief 将数组转化成 plist string (XML格式)
 *
 *  @return NSString or nil
 */
- (nullable NSString *)plistString;

/**
 *  @brief 将JSON数组转化成 json string
 *
 *  @return NSString or nil
 */
- (nullable NSString *)jsonStringEncoded;

@end




#pragma mark - NSMutableArray
#pragma mark - 元素
@interface NSMutableArray (Element)

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

@end

NS_ASSUME_NONNULL_END

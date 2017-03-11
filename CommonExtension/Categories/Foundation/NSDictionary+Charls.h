//
//  NSDictionary+Charls.h
//  CommonExtension
//
//  Created by charls on 16/9/8.
//  Copyright © 2016年 Charls. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - NSDictionary

@interface NSDictionary (Charls)

@end


#pragma mark - 序列化

@interface NSDictionary (PropertyListSerialization)

/**
 *  @brief 通过plist 数据实例化 NSDictionary
 *
 *  @param plistData 属性列表数据
 *
 *  @return NSDictionary or nil
 */
+ (nullable instancetype)dictionaryWithPlistData:(nonnull NSData *)plistData;

/**
 *  @brief 通过plist 字符串实例化 NSDictionary
 *
 *  @param plistString 属性列表字符串
 *
 *  @return NSDictionary or nil
 */
+ (nullable instancetype)dictionaryWithPlistString:(nonnull NSString *)plistString;

/**
 *  @brief 将字典转化成plist data
 */
- (nullable NSData *)plistData;

/**
 *  @brief 将字典转化成plist string (XML格式)
 * 
 *  @return NSString or nil
 */
- (nullable NSString *)plistString;

/**
 *  @brief 将JSON字典转化成 json string
 *
 *  @return NSString or nil
 */
- (nullable NSString *)jsonStringEncoded;

@end

#pragma mark - 排序
@interface  NSDictionary (Sorted)

/**
 *  @brief 返回排序后所有的key
 */
- (nullable NSArray *)allSortedKeys;

/**
 *  @brief 返回根据key排序的所有值
 */
- (nullable NSArray *)allSortedValues;

/**
 *  @brief 返回根据key排序的字典
 */
- (nullable NSDictionary *)sortForSortedKeys;

/**
 *  @brief 判断字典是否包含key对应的对象
 *
 *  @param key 查询键
 *
 *  @return 如果字典包含该key对应的对象将返回'YES'，否则返回'NO'
 */
- (BOOL)containsObjectForKey:(nonnull id)key;

@end

#pragma mark - NSMutableDictionary
#pragma mark - 元素
@interface NSDictionary (Element)

- (nullable id)popObjectForKey:(nonnull id)aKey;

- (nullable NSDictionary *)popEntriesForKeys:(nonnull NSArray *)keys;

@end

NS_ASSUME_NONNULL_END


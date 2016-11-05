//
//  NSDictionary+Charls.m
//  CommonExtension
//
//  Created by charls on 16/9/8.
//  Copyright © 2016年 Charls. All rights reserved.
//

#import "NSDictionary+Charls.h"

/**
 *  @brief 错误打印
 *
 *  @param msg   错误提示
 *  @param error 错误内容
 *
 *  @return nil
 */
// #define ErrorLog(msg, error) if (error != nil) { \
// if (DEBUG) { \
// NSLog((@"%s [Line %d] " msg @" {Error: %@}"), __PRETTY_FUNCTION__, __LINE__, [error localizedDescription]); \
// }; \
// }

#pragma mark - NSDictionary
@implementation NSDictionary (Charls)

@end

#pragma mark - 序列化
@implementation NSDictionary (PropertyListSerialization)
// 通过 plist 数据实例化 NSDictionary
+ (nullable instancetype)dictionaryWithPlistData:(nonnull NSData *)plistData {
    if (plistData == nil || plistData.length == 0) return nil;
    NSError *error;
    NSDictionary *dictionary = [NSPropertyListSerialization propertyListWithData:plistData options:NSPropertyListImmutable format:nil error:&error];
//     ErrorLog(@"plist转NSDictionary失败", error)
    return ([dictionary isKindOfClass:[NSDictionary class]]) ? dictionary : nil;
}

// 通过 plist 字符串实例化 NSDictionary
+ (nullable instancetype)dictionaryWithPlistString:(nonnull NSString *)plistString {
    if (plistString == nil || plistString.length == 0) return nil;
    NSData* data = [plistString dataUsingEncoding:NSUTF8StringEncoding];
    return [self dictionaryWithPlistData:data];
}

// 将字典转为 plist data
- (nullable NSData *)plistData {
    NSError *error;
    NSData *data = [NSPropertyListSerialization dataWithPropertyList:self format:NSPropertyListBinaryFormat_v1_0 options:kNilOptions error:&error];
//     ErrorLog(@"字典转 plist data 失败", error)
    return data;
}

// 将字典转为 plist string（XML格式）
- (nullable NSString *)plistString {
    NSError *error;
    NSData *xmlData = [NSPropertyListSerialization dataWithPropertyList:self format:NSPropertyListXMLFormat_v1_0 options:kNilOptions error:&error];
//     ErrorLog(@"字典转 plist string 失败", error)
    return ((xmlData != nil) ? [[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding] : nil);
}

// 将JSON字典转为JSON字符串
- (nullable NSString *)jsonStringEncoded {
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
//         ErrorLog(@"JSON字典转JSON字符串失败", error)
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return json;
    }
    return nil;
}

@end

#pragma mark - 排序
@implementation NSDictionary (Sorted)

// 返回排序后的所有key
- (nullable NSArray *)allSortedKeys {
    return [self.allKeys sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}

// 返回按照key排序的所有值
- (nullable NSArray *)allSortedValues {
    NSArray *sortedKeys = [self allSortedKeys];
    NSMutableArray *arr = @[].mutableCopy;
    for (id key in sortedKeys) {
        [arr addObject:self[key]];
    }
    return arr.copy;
}

// 返回根据key排序的字典
- (nullable NSDictionary *)sortForSortedKeys {
    return [[NSDictionary alloc] initWithObjects:[self allSortedValues] forKeys:[self allSortedKeys]];
}

// 判断字典是否包含key对应的对象
- (BOOL)containsObjectForKey:(nonnull id)key {
    if (key == nil) return NO;
    return self[key] != nil;
}


@end

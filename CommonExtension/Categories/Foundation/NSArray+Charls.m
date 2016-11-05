//
//  NSArray+Charls.m
//  CommonExtension
//
//  Created by charls on 16/9/8.
//  Copyright © 2016年 Charls. All rights reserved.
//

#import "NSArray+Charls.h"

/**
 *  @brief 错误打印
 *
 *  @param msg   错误提示
 *  @param error 错误内容
 *
 *  @return nil
 */
#define ErrorLog(msg, error) if (error != nil) { \
    if (DEBUG) { \
      NSLog((@"%s [Line %d] " msg @" {Error: %@}"), __PRETTY_FUNCTION__, __LINE__, [error localizedDescription]); \
    }; \
}

#pragma mark - NSArray
@implementation NSArray (Charls)
@end

#pragma mark - 序列化
@implementation NSArray (PropertyListSerialization)

// 通过 plist 数据实例化 NSArray
+ (nullable instancetype)arrayWithPlistData:(NSData *)plistData {
    if (plistData == nil || plistData.length == 0) return nil;
    NSError *error;
    NSArray *array = [NSPropertyListSerialization propertyListWithData:plistData options:NSPropertyListImmutable format:nil error:&error];
    ErrorLog(@"plist数据转Array失败", error)
    return ([array isKindOfClass:[NSArray class]]) ? array : nil;
}

// 通过 plist 字符串实例化 NSArray
+ (nullable instancetype)arrayWithPlistString:(NSString *)plistString {
    if (plistString == nil || plistString.length == 0) return nil;
    NSData* data = [plistString dataUsingEncoding:NSUTF8StringEncoding];
    return [self arrayWithPlistData:data];
}

// 将数组转为 plist data
- (nullable NSData *)plistData {
    NSError *error;
    NSData *data = [NSPropertyListSerialization dataWithPropertyList:self format:NSPropertyListBinaryFormat_v1_0 options:kNilOptions error:&error];
    ErrorLog(@"Array转plist data失败", error)
    return data;
}

// 将数组转为 plist string（XML格式）
- (nullable NSString *)plistString {
    NSError *error;
    NSData *xmlData = [NSPropertyListSerialization dataWithPropertyList:self format:NSPropertyListXMLFormat_v1_0 options:kNilOptions error:&error];
    ErrorLog(@"Array转plist string失败", error)
    return ((xmlData != nil) ? [[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding] : nil);
}

// 将JSON数组转为 json string
- (nullable NSString *)jsonStringEncoded {
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
        ErrorLog(@"JSON Array转JSON String失败", error)
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return json;
    }
    return nil;
}

@end





#pragma mark - 元素
@implementation NSMutableArray (Element)
// 弹出数组首元素
- (nullable id)popFirstObject {
    id obj = nil;
    if (self.count > 0) {
        obj = self.firstObject;
        [self removeObjectAtIndex:0];
    }
    return obj;
}

// 弹出数组末尾元素
- (nullable id)popLastObject {
    id obj = nil;
    if (self.count > 0) {
        obj = self.lastObject;
        [self removeLastObject];
    }
    return obj;
}

// 弹出数组第 index 个元素 当输入index 不在数组范围内时打印错误并返回 nil
- (nullable id)popObjectAtIndex:(int)index {
    id obj = nil;
    if (self.count > 0) {
        if (index >= self.count || index < 0) {
            NSError *error = [NSError errorWithDomain:@"" code:0 userInfo:@{@"reason":@"The index value is not greater than or equal to the number of array"}];
            ErrorLog(@"索引值不能大于或等于数组数量", error)
            return obj;
        } else {
            obj = [self objectAtIndex:index];
            [self removeObjectAtIndex:index];
            return obj;
        }
    }
    return obj;
}

// 倒转数组
- (void)reverse {
    NSUInteger count = self.count;
    int mid = floor(count / 2.0);
    for (NSUInteger i = 0; i < mid; i++) {
        [self exchangeObjectAtIndex:i withObjectAtIndex:(count - (i + 1))];
    }
}

// 打乱数组顺序
- (void)shuffle {
    for (NSUInteger i = self.count; i > 1; i--) {
        [self exchangeObjectAtIndex:(i - 1) withObjectAtIndex:arc4random_uniform((u_int32_t)i)];
    }
}


@end



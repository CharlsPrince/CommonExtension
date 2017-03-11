//
//  NSArray+Charls.m
//  CommonExtension
//
//  Created by charls on 16/9/8.
//  Copyright © 2016年 Charls. All rights reserved.
//

#import "NSArray+Charls.h"

#pragma mark - NSArray
@implementation NSArray (Charls)
@end

#pragma mark - 序列化
@implementation NSArray (PropertyListSerialization)

// 将数组转为 plist data
- (NSData *)toPlistData {
    return [self toPlistDataWithError:NULL];
}

- (NSData *)toPlistDataWithError:(NSError * _Nullable __autoreleasing *)error {
    NSData *data = [NSPropertyListSerialization dataWithPropertyList:self format:NSPropertyListBinaryFormat_v1_0 options:kNilOptions error:error];
    return data;
}

+ (NSArray *)arrayWithPlistData:(NSData *)plistData {
    return [NSArray arrayWithPlistData:plistData error:NULL];
}

// 通过 plist 数据实例化 NSArray
+ (NSArray *)arrayWithPlistData:(NSData *)plistData error:(NSError * _Nullable __autoreleasing * _Nullable)error{
    if (plistData == nil || plistData.length == 0) return nil;
    NSArray *array = [NSPropertyListSerialization propertyListWithData:plistData options:NSPropertyListImmutable format:nil error:error];
    return ([array isKindOfClass:[NSArray class]]) ? array : nil;
}




// 将数组转为 plist string（XML格式）
- (nullable NSString *)toPlistString {
    return [self toPlistStringWithError:NULL];
}

- (NSString *)toPlistStringWithError:(NSError * _Nullable __autoreleasing *)error {
    return [self toPlistStringWithFormat:NSPropertyListXMLFormat_v1_0 error:error];
}

- (NSString *)toPlistStringWithFormat:(NSPropertyListFormat)format error:(NSError * _Nullable __autoreleasing *)error {
    NSData *xmlData = [NSPropertyListSerialization
                       dataWithPropertyList:self
                       format:NSPropertyListXMLFormat_v1_0 options:kNilOptions
                       error:error];
    return ((xmlData != nil) ? [[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding] : nil);
}

// 通过 plist 字符串实例化 NSArray
+ (NSArray *)arrayWithPlistString:(NSString *)plistString {
    if (plistString == nil || plistString.length == 0) return nil;
    NSData* data = [plistString dataUsingEncoding:NSUTF8StringEncoding];
    return [self arrayWithPlistData:data error:NULL];
}



- (NSData *)toJSONData {
    return [self toJSONDataWithOptions:NSJSONWritingPrettyPrinted error:NULL];
}

- (NSData *)toJSONDataWithOptions:(NSJSONWritingOptions)opt error:(NSError * _Nullable __autoreleasing *)error {
    return [NSJSONSerialization dataWithJSONObject:self options:opt error:error];
}

+ (NSArray *)arrayWithJSONData:(NSData *)data {
    return [NSArray arrayWithJSONData:data error:NULL];
}

+ (NSArray *)arrayWithJSONData:(NSData *)data error:(NSError * _Nullable __autoreleasing *)error {
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data
                                                     options:NSJSONReadingAllowFragments
                                                       error:error];
    return ([array isKindOfClass:[NSArray class]] ? array : nil);
}




// 将JSON数组转为 json string
- (nullable NSString *)toJSONString {
    return [self toJSONStringWithError:NULL];
}

- (NSString *)toJSONStringWithError:(NSError * _Nullable __autoreleasing *)error {
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:error];
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return json;
    }
    return nil;
}

+ (NSArray *)arrayWithJSONString:(NSString *)string {
    return [NSArray arrayWithJSONString:string error:NULL];
}

+ (NSArray *)arrayWithJSONString:(NSString *)string error:(NSError * _Nullable __autoreleasing *)error {
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    if (data == nil) return nil;
    return [NSArray arrayWithJSONData:data error:error];
}


@end

@implementation NSArray (Element)

/// 返回随机元素
- (id)randomObject {
    if (self.count <= 0) {
        return nil;
    }
    return self[arc4random() % self.count];
}

- (id)objectOrNilAtIndex:(NSUInteger)index {
    return index < self.count ? self[index] : nil;
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

/// 安全地添加元素
- (void)safeAddObject:(id)object {
    if (object != nil) {
        [self addObject:object];
    }
}

@end



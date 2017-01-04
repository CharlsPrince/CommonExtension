//
//  NSUserDefaults+Charls.h
//  CommonExtension
//
//  Created by charls on 2017/1/4.
//  Copyright © 2017年 Charls. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSUserDefaults (Charls)

+ (void)setObject:(nullable id)value forKey:(NSString *)defaultName;

+ (void)setInteger:(NSInteger)value forKey:(NSString *)defaultName;

+ (void)setFloat:(float)value forKey:(NSString *)defaultName;

+ (void)setDouble:(double)value forKey:(NSString *)defaultName;

+ (void)setBool:(BOOL)value forKey:(NSString *)defaultName;

+ (void)setURL:(nullable NSURL *)url forKey:(NSString *)defaultName;

+ (void)removeObjectForKey:(NSString *)defaultName;

+ (nullable id)objectForKey:(NSString *)defaultName;

+ (nullable NSString *)stringForKey:(NSString *)defaultName;

+ (nullable NSArray *)arrayForKey:(NSString *)defaultName;

+ (nullable NSDictionary<NSString *, id> *)dictionaryForKey:(NSString *)defaultName;

+ (nullable NSData *)dataForKey:(NSString *)defaultName;

+ (nullable NSArray<NSString *> *)stringArrayForKey:(NSString *)defaultName;

+ (NSInteger)integerForKey:(NSString *)defaultName;

+ (float)floatForKey:(NSString *)defaultName;

+ (double)doubleForKey:(NSString *)defaultName;

+ (BOOL)boolForKey:(NSString *)defaultName;

+ (nullable NSURL *)URLForKey:(NSString *)defaultName;

@end

NS_ASSUME_NONNULL_END

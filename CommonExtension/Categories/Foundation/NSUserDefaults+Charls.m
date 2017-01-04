//
//  NSUserDefaults+Charls.m
//  CommonExtension
//
//  Created by charls on 2017/1/4.
//  Copyright © 2017年 Charls. All rights reserved.
//

#import "NSUserDefaults+Charls.h"

@implementation NSUserDefaults (Charls)

+ (void)setObject:(id)value forKey:(NSString *)defaultName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:value forKey:defaultName];
}

+ (void)setInteger:(NSInteger)value forKey:(NSString *)defaultName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:value forKey:defaultName];
}

+ (void)setFloat:(float)value forKey:(NSString *)defaultName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setFloat:value forKey:defaultName];
}

+ (void)setDouble:(double)value forKey:(NSString *)defaultName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:value forKey:defaultName];
}

+ (void)setBool:(BOOL)value forKey:(NSString *)defaultName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:value forKey:defaultName];
}

+ (void)setURL:(NSURL *)url forKey:(NSString *)defaultName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setURL:url forKey:defaultName];
}

+ (void)removeObjectForKey:(NSString *)defaultName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:defaultName];
}

+ (id)objectForKey:(NSString *)defaultName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:defaultName];
}

+ (NSString *)stringForKey:(NSString *)defaultName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults stringForKey:defaultName];
}

+ (NSArray *)arrayForKey:(NSString *)defaultName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults arrayForKey:defaultName];
}

+ (NSDictionary<NSString *,id> *)dictionaryForKey:(NSString *)defaultName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults dictionaryForKey:defaultName];
}

+ (NSData *)dataForKey:(NSString *)defaultName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults dataForKey:defaultName];
}

+ (NSArray<NSString *> *)stringArrayForKey:(NSString *)defaultName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults stringArrayForKey:defaultName];
}

+ (NSInteger)integerForKey:(NSString *)defaultName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults integerForKey:defaultName];
}

+ (float)floatForKey:(NSString *)defaultName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults floatForKey:defaultName];
}

+ (double)doubleForKey:(NSString *)defaultName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults doubleForKey:defaultName];
}

+ (BOOL)boolForKey:(NSString *)defaultName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:defaultName];
}

+ (NSURL *)URLForKey:(NSString *)defaultName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults URLForKey:defaultName];
}

@end

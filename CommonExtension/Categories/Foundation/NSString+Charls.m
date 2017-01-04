//
//  NSString+Charls.m
//  CommonExtension
//
//  Created by charls on 2016/11/30.
//  Copyright © 2016年 Charls. All rights reserved.
//

#import "NSString+Charls.h"

@implementation NSString (Charls)

@end

@implementation NSString (Trimming)

// 去除首尾空字符（包括换行符）
- (NSString *)trim
{
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:set];
}

// 判断字符串是否包含空字符
- (BOOL)hasBlank
{
    NSCharacterSet *blank = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for (NSInteger i = 0; i < self.length; ++i) {
        unichar c = [self characterAtIndex:i];
        if ([blank characterIsMember:c]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)hasChinese {
    //判断是否有中文
    for(int i=0; i< [self length];i++){
        int a = [self characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff)
        {
            return YES;
        }
    }
    return NO;
}

// 判断字符串是否包含特定字符
- (BOOL)containsCharacterSet:(NSCharacterSet *)set
{
    return [self rangeOfCharacterFromSet:set].location != NSNotFound;
}

// 返回字符串范围
- (NSRange)rangeOfAll
{
    return [self rangeOfComposedCharacterSequenceAtIndex:self.length];
}

@end

@implementation NSString (UTF8)

// 将 NSData 转为 UTF8 编码的字符串
+ (instancetype)stringWithUTF8Data:(NSData *)data
{
    return [[self alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

// 返回 UTF8 编码的NSData
- (NSData *)toUTF8Data
{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

@end


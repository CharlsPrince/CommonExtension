//
//  NSNumber+Charls.m
//  CommonExtension
//
//  Created by charls on 2016/11/30.
//  Copyright © 2016年 Charls. All rights reserved.
//

#import "NSNumber+Charls.h"
#import "NSString+Charls.h"

@implementation NSNumber (Charls)

@end

@implementation NSNumber (String)

// 根据字符串实例化 NSNumber 对象
+ (nullable instancetype)numberWithString:(nonnull NSString *)string {
    NSString *str = [string trim].lowercaseString;
    if ((str == nil) || (str.length == 0)) return nil;
    
    static NSDictionary *dic;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dic = @{@"true" :   @(YES),
                @"yes" :    @(YES),
                @"false" :  @(NO),
                @"no" :     @(NO),
                @"nil" :    [NSNull null],
                @"null" :   [NSNull null],
                @"<null>" : [NSNull null]};
    });
    NSNumber *num = dic[str];
    if (num != nil) {
        if (num == (id)[NSNull null]) return nil;
        return num;
    }
    
    // 十六进制
    int sign = 0;
    if ([str hasPrefix:@"0x"]) sign = 1;
    else if ([str hasPrefix:@"-0x"]) sign = -1;
    if (sign != 0) {
        NSScanner *scan = [NSScanner scannerWithString:str];
        unsigned num = -1;
        BOOL suc = [scan scanHexInt:&num];
        
        return ((suc) ? [NSNumber numberWithLong:((long)num * sign)] : nil);
    }
    
    // 十进制
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    return [formatter numberFromString:string];
}

@end

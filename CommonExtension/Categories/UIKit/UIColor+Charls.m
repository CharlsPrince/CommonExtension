//
//  UIColor+Charls.m
//  CommonExtension
//
//  Created by charls on 2017/1/4.
//  Copyright © 2017年 Charls. All rights reserved.
//

#import "UIColor+Charls.h"

@implementation UIColor (Charls)

@end

@implementation UIColor (Hex)

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha {
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6) {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

//默认alpha值为1
+ (UIColor *)colorWithHexString:(NSString *)color {
    return [self colorWithHexString:color alpha:1.0f];
}

+ (NSString *)hexStringFromColor:(UIColor *)color {
    if (CGColorGetNumberOfComponents(color.CGColor) < 4) {
        const CGFloat *components = CGColorGetComponents(color.CGColor);
        color = [UIColor colorWithRed:components[0]
                                green:components[0]
                                 blue:components[0]
                                alpha:components[1]];
    }
    
    if (CGColorSpaceGetModel(CGColorGetColorSpace(color.CGColor)) != kCGColorSpaceModelRGB) {
        return [NSString stringWithFormat:@"#FFFFFF"];
    }
    
    return [NSString stringWithFormat:@"#%X%X%X", (int)((CGColorGetComponents(color.CGColor))[0]*255.0),
            (int)((CGColorGetComponents(color.CGColor))[1]*255.0),
            (int)((CGColorGetComponents(color.CGColor))[2]*255.0)];
}

- (NSString *)hexString {
    return [UIColor hexStringFromColor:self];
}

- (UIColor *)colorWithSameRGBValue:(CGFloat)value {
    return UIColor_RGB(value, value, value);
}

@end

@implementation UIColor (Random)

+ (UIColor *)randomColor {
    return UIColor_RGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256));
}

+ (UIColor *)randomSameRGBValueColor {
    uint32_t value = arc4random_uniform(256);
    return UIColor_RGB(value, value, value);
}

+ (NSArray<UIColor *> *)randomColors {
    return [self randomColorsWithCount:100];
}

+ (NSArray<UIColor *> *)randomColorsWithCount:(int)count {
    NSMutableArray<UIColor *> *colors = [NSMutableArray<UIColor *> arrayWithCapacity:count];
    for (int i = 0; i < count; i ++) {
        [colors addObject:[self randomColor]];
    }
    return colors;
}

@end

@implementation UIColor (NormalColor)

+ (UIColor *)snowColor {
    return [self colorWithHexString:@"#FFFAFA"];
}

+ (UIColor *)ghostWhiteColor {
    return [self colorWithHexString:@"#F8F8FF"];
}

+ (UIColor *)whiteSmokeColor {
    return [self colorWithHexString:@"#F5F5F5"];
}

+ (UIColor *)lightSkyBlueColor {
    return [self colorWithHexString:@"#87CEFA"];
}

+ (UIColor *)lightCyanColor {
    return [self colorWithHexString:@"#E0FFFF"];
}

+ (UIColor *)lightYellowColor {
    return [self colorWithHexString:@"#FFFFE0"];
}

+ (UIColor *)indianRedColor {
    return [self colorWithHexString:@"#CD5C5C"];
}

+ (UIColor *)lightSalmonColor {
    return [self colorWithHexString:@"#FFA07A"];
}

+ (UIColor *)lightCoralColor {
    return [self colorWithHexString:@"#F08080"];
}

+ (UIColor *)pinkColor {
    return [self colorWithHexString:@"#FFC0CB"];
}

+ (UIColor *)lightPinkColor {
    return [self colorWithHexString:@"#FFB6C1"];
}

+ (UIColor *)mediumPurpleColor {
    return [self colorWithHexString:@"#9370DB"];
}

+ (UIColor *)lightGreenColor {
    return [self colorWithHexString:@"#90EE90"];
}

@end

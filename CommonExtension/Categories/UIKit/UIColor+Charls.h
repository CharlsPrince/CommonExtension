//
//  UIColor+Charls.h
//  CommonExtension
//
//  Created by charls on 2017/1/4.
//  Copyright © 2017年 Charls. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define UIColor_RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a*1.0f]  
#define UIColor_RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f]

@interface UIColor (Charls)

@end

//================================================================
//  MARK: - 十六进制颜色
//================================================================

@interface UIColor (Hex)

/**
 从十六进制字符串获取颜色

 @param color 16进制字符串：支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 @return UIColor 对象
 */
+ (UIColor *)colorWithHexString:(NSString *)color;

/**
 从十六进制字符串获取颜色

 @param color 16进制字符串：支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 @param alpha 透明度(0 ~ 1.0)
 @return UIColor 对象
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;


/**
 将UIColor对象转换成十六进制字符串

 @param color UIColor对象
 @return 十六进制字符串
 */
+ (NSString *)hexStringFromColor:(UIColor *)color;


/**
 将UIColor对象转成十六进制字符串

 @return 十六进制字符串
 */
- (NSString *)hexString;


/**
 创建R、G、B通道色值相同的UIColor对象

 @param value 通道值
 @return UIColor对象
 */
- (UIColor *)colorWithSameRGBValue:(CGFloat)value;

@end

//================================================================
//  MARK: - 随机颜色
//================================================================

@interface UIColor (Random)

/**
 随机色

 @return 返回随机颜色
 */
+ (UIColor *)randomColor;


/**
 随机色(但R、G、B的值是相同的)

 @return 返回随机色
 */
+ (UIColor *)randomSameRGBValueColor;


/**
 随机颜色数组(0 ~ 100)

 @return 返回随机颜色数组
 */
+ (nullable NSArray<__kindof UIColor *> *)randomColors;


/**
 固定数组，随机颜色数组(0 ~ count)

 @param count 颜色对象数量
 @return 随机颜色数组
 */
+ (nullable NSArray<__kindof UIColor *> *)randomColorsWithCount:(int)count;

@end

//================================================================
//  MARK: - 常用颜色
//================================================================

@interface UIColor (NormalColor)

/// 雪色
+ (UIColor *)snowColor;
/// 幽灵白
+ (UIColor *)ghostWhiteColor;
/// 烟白色
+ (UIColor *)whiteSmokeColor;
/// 浅天蓝
+ (UIColor *)lightSkyBlueColor;
/// 淡青色(浅蓝色)
+ (UIColor *)lightCyanColor;
/// 浅黄色
+ (UIColor *)lightYellowColor;
/// 印度红
+ (UIColor *)indianRedColor;
/// 浅肉色
+ (UIColor *)lightSalmonColor;
/// 浅珊瑚
+ (UIColor *)lightCoralColor;
/// 粉红色
+ (UIColor *)pinkColor;
/// 浅粉红色
+ (UIColor *)lightPinkColor;
/// 中紫色
+ (UIColor *)mediumPurpleColor;
/// 浅绿色
+ (UIColor *)lightGreenColor;

@end

NS_ASSUME_NONNULL_END

//
//  UIImage+Charls.h
//  CommonExtension
//
//  Created by charls on 2016/11/30.
//  Copyright © 2016年 Charls. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Charls)

@end

@interface UIImage (Color)

/*!
 *  @brief 生成1像素的纯色图片
 *
 *  @param color 颜色
 *
 *  @return UIImage
 */
+ (instancetype)imageWithColor:(UIColor *)color;

/*!
 *  @brief 生成纯颜色的图片
 *
 *  @param color 颜色
 *  @param size  尺寸
 *
 *  @return UIImage, 如果尺寸的宽度或高度为0将返回 nil
 */
+ (instancetype)imageWithColor:(UIColor *)color size:(CGSize)size;

@end

@interface UIImage (Round)  /// 圆角

/*!
 *  @brief 生成圆形图片
 *
 *  @return 圆形裁剪后的 UIImage
 */
- (nullable UIImage *)roundImage;

/*!
 *  @brief 生成圆角图片
 *
 *  @param radius 圆角角度
 *
 *  @return 圆角矩形裁剪后的 UIImage
 */
- (nullable UIImage *)roundRectWithCornerRadius:(CGFloat)radius;
@end


NS_ASSUME_NONNULL_END

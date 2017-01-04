//
//  UIImage+Charls.m
//  CommonExtension
//
//  Created by charls on 2016/11/30.
//  Copyright © 2016年 Charls. All rights reserved.
//

#import "UIImage+Charls.h"

@implementation UIImage (Charls)

@end

@implementation UIImage (Color)

// 生成1像素的纯色图片
+ (instancetype)imageWithColor:(UIColor *)color {
    return [self imageWithColor:color size:CGSizeMake(1, 1)];
}

// 生成纯颜色的图片
+ (instancetype)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    
    CGRect rect = { CGPointZero, size };
    
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

@end

@implementation UIImage (Round)

// 生成圆形图片
- (UIImage *)roundImage {
    UIGraphicsBeginImageContext(self.size);
    
    CGContextRef currnetContext = UIGraphicsGetCurrentContext();
    CGRect rect = { CGPointZero, self.size };
    
    CGContextAddEllipseInRect(currnetContext, rect);
    CGContextClip(currnetContext);
    
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

// 生成圆角图片
- (UIImage *)roundRectWithCornerRadius:(CGFloat)radius {
    UIGraphicsBeginImageContext(self.size);
    
    CGRect rect = { CGPointZero, self.size };
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius] addClip];
    
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

@end

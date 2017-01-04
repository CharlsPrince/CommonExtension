//
//  UIButton+Charls.h
//  CommonExtension
//
//  Created by charls on 2016/11/30.
//  Copyright © 2016年 Charls. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Charls)

@end

/// 按钮图片和文字的位置
typedef NS_ENUM(NSInteger, ButtonContentEdgeInsetsStyle) {
    ButtonContentEdgeInsetsStyleNone,   //! imageEdgeInsets 与 titleEdgeInsets 还原为 UIEdgeInsetsZero
    ButtonContentEdgeInsetsStyleTop,    //! image在上，label在下
    ButtonContentEdgeInsetsStyleLeft,   //! image在左，label在右
    ButtonContentEdgeInsetsStyleBottom, //! image在下，label在上
    ButtonContentEdgeInsetsStyleRight,  //! image在右，label在左
};

@interface UIButton (ContentEdgeInsets)

/// 设置 UIButton 的 titleLabel 和 imageView 的布局样式
- (void)layoutWithEdgeInsetsStyle:(ButtonContentEdgeInsetsStyle)style imageTitleSpace:(CGFloat)space;

@end

NS_ASSUME_NONNULL_END

//
//  UIButton+Charls.m
//  CommonExtension
//
//  Created by charls on 2016/11/30.
//  Copyright © 2016年 Charls. All rights reserved.
//

#import "UIButton+Charls.h"


@implementation UIButton (Charls)

@end

@implementation UIButton (ContentEdgeInsets)

- (void)layoutWithEdgeInsetsStyle:(ButtonContentEdgeInsetsStyle)style imageTitleSpace:(CGFloat)space {
    if (style == ButtonContentEdgeInsetsStyleNone) {
        self.imageEdgeInsets = UIEdgeInsetsZero;
        self.titleEdgeInsets = UIEdgeInsetsZero;
        return;
    }
    
    CGFloat imageWidth = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    if ((imageWidth < 0.0001) || (imageHeight < 0.0001)) return;
    
    CGFloat labelWidth = 0.f;
    CGFloat labelHeight = 0.f;
    
    if ([[[UIDevice currentDevice] systemVersion] compare:@"8" options:NSNumericSearch] >= NSOrderedSame) {
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    switch (style) {
        case ButtonContentEdgeInsetsStyleTop: {
            self.imageEdgeInsets = UIEdgeInsetsMake(-labelHeight - (space/2), 0.f, 0.f, -labelWidth);
            self.titleEdgeInsets = UIEdgeInsetsMake(0.f, -imageWidth, -imageHeight - (space/2), 0.f);
        } break;
            
        case ButtonContentEdgeInsetsStyleLeft: {
            self.imageEdgeInsets = UIEdgeInsetsMake(0.f, -space/2, 0.f, space/2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0.f, space/2, 0.f, -space/2);
        } break;
            
        case ButtonContentEdgeInsetsStyleBottom: {
            self.imageEdgeInsets = UIEdgeInsetsMake(0.f, 0.f, -labelHeight - (space/2), -labelWidth);
            self.titleEdgeInsets = UIEdgeInsetsMake(-imageHeight - (space/2), -imageWidth, 0.f, 0.f);
        } break;
            
        case ButtonContentEdgeInsetsStyleRight: {
            self.imageEdgeInsets = UIEdgeInsetsMake(0.f, labelWidth + (space/2), 0.f, -labelWidth - (space/2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0.f, -imageWidth - (space/2), 0.f, imageWidth + (space/2));
        } break;
            
        default: break;
    }
}

@end

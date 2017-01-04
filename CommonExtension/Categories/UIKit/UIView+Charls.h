//
//  UIView+Charls.h
//  CommonExtension
//
//  Created by charls on 2016/11/5.
//  Copyright © 2016年 Charls. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Charls)

@end

@interface UIView (Properties)

@property (nonatomic, assign) CGFloat left;    //! left    == self.frame.origin.x.
@property (nonatomic, assign) CGFloat top;     //! top     == self.frame.origin.y
@property (nonatomic, assign) CGFloat right;   //! right   == self.frame.origin.x + frame.size.width
@property (nonatomic, assign) CGFloat bottom;  //! bottom  == self.frame.origin.y + frame.size.height
@property (nonatomic, assign) CGFloat width;   //! width   == self.frame.size.width.
@property (nonatomic, assign) CGFloat height;  //! height  == self.frame.size.height.
@property (nonatomic, assign) CGFloat centerX; //! centerX == self.center.x
@property (nonatomic, assign) CGFloat centerY; //! centerY == self. center.y
@property (nonatomic, assign) CGPoint origin;  //! origin  == self.frame.origin.
@property (nonatomic, assign) CGSize  size;    //! size    == self.frame.size.

@end

@interface UIView (ViewController)

/**
 获取当前视图控制器

 @return 当前视图控制器
 */
- (nullable UIViewController *)getCurrentViewController;

@end

NS_ASSUME_NONNULL_END

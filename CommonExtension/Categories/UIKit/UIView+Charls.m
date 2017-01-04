//
//  UIView+Charls.m
//  CommonExtension
//
//  Created by charls on 2016/11/5.
//  Copyright © 2016年 Charls. All rights reserved.
//

#import "UIView+Charls.h"

@implementation UIView (Charls)

@end

@implementation UIView (Properties)

- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

@end

@implementation UIView (ViewController)

- (UIViewController *)getCurrentViewController {

    UIViewController *currentViewController = nil;
    /// 获取当前window
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for (UIWindow *tempWindow in windows) {
            if (tempWindow.windowLevel == UIWindowLevelNormal) {
                window = tempWindow;
                break;
            }
        }
    }
    
    /// 获取当前根视图控制器
    UIViewController *rootController = window.rootViewController;
    
    id nextResponder = nil;
    
    /// 如果有present视图
    if (rootController.presentationController) {
        nextResponder = rootController.presentedViewController;
    } else {
        UIView *frontView = [[window subviews] objectAtIndex:0];
        nextResponder = [frontView nextResponder];
    }
    
    /// 如果window下是UITabBarController
    if ([nextResponder isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarController = (UITabBarController *)nextResponder;
        UIViewController *selectedController = tabBarController.selectedViewController;
        if ([selectedController isKindOfClass:[UINavigationController class]]) { /// 如果tabBarController下是UINavigationController
            UINavigationController *selectedNavController = (UINavigationController *)selectedController;
            if (selectedNavController.presentedViewController) {
                currentViewController = selectedNavController.presentedViewController;
            } else {
                currentViewController = selectedNavController.childViewControllers.lastObject;
            }
        } else {
            currentViewController = selectedController;
        }
    } else if ([nextResponder isKindOfClass:[UINavigationController class]]) { /// 如果window下是UINavigationController
        UINavigationController *customNavController = (UINavigationController *)nextResponder;
        if (customNavController.presentedViewController) {
            currentViewController = customNavController.presentedViewController;
        } else {
            currentViewController = customNavController.childViewControllers.lastObject;
        }
    } else {
        currentViewController = nextResponder;
    }
    
    /// 如果有present视图
    if (currentViewController.presentedViewController) {
        currentViewController = currentViewController.presentedViewController;
    }
    
    return currentViewController;
}

@end

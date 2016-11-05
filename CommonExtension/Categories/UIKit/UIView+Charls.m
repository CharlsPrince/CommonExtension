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

@implementation UIView (viewController)

- (UIViewController *)getCurrentViewController {
    for (UIView* next = [self superview]; next; next = next.superview)
    {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            UIViewController *vc = (UIViewController *)nextResponder;
            return vc;
        }
    }
    return nil;
}

@end

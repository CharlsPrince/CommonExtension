//
//  NSTimer+Charls.m
//  CommonExtension
//
//  Created by charls on 16/9/9.
//  Copyright © 2016年 Charls. All rights reserved.
//

#import "NSTimer+Charls.h"

#pragma mark - NSTimer
@implementation NSTimer (Charls)

@end

#pragma mark - 实例化
@implementation NSTimer (Instantiate)

// 实例化NSTimer，并自动加入当前 run loop 中执行
+ (nonnull instancetype)scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(nonnull TimerHandler)block repeats:(BOOL)repeats {
    return [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(p_blockInvoke:) userInfo:[block copy] repeats:repeats];
}

// 实例化NSTimer
+ (nonnull instancetype)timerWithTimeInterval:(NSTimeInterval)interval block:(nonnull TimerHandler)block repeats:(BOOL)repeats {
    return [NSTimer timerWithTimeInterval:interval target:self selector:@selector(p_blockInvoke:) userInfo:[block copy] repeats:repeats];
}

// 私有方法，执行block内容
+ (void)p_blockInvoke:(nullable NSTimer *)timer {
    TimerHandler block = timer.userInfo;
    if (block) {
        block();
    }
}

@end

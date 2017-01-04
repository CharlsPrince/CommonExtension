//
//  NSNumber+Charls.h
//  CommonExtension
//
//  Created by charls on 2016/11/30.
//  Copyright © 2016年 Charls. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNumber (Charls)

@end

/*!
 *  @brief 转字符串方法扩展
 */
@interface NSNumber (String)

/*!
 *  @brief 根据字符串实例化 NSNumber 对象
 *
 *  @discussion 字符串格式可以为：@"18", @"-0x1F", @"3.14", @" .12e5 ", @"true",
 *      @"NO", @"nil" 等
 *
 *  @param string 字符串
 *
 *  @return NSNumber or nil
 */
+ (nullable instancetype)numberWithString:(NSString *)string;

@end

NS_ASSUME_NONNULL_END

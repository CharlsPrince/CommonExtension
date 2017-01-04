//
//  VerifyUtilities.h
//  CommonExtension
//
//  Created by charls on 2016/11/30.
//  Copyright © 2016年 Charls. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VerifyUtilities : NSObject

+ (BOOL)isMobile:(NSString*)mobile;
+ (BOOL)isEmail:(NSString*)email;
+ (BOOL)isPureInt:(NSString*)string;
+ (BOOL)isPureFloat:(NSString*)string;
+ (BOOL)isChinese:(NSString*)chinese;
+ (BOOL)isURL:(NSString*)url;
+ (BOOL)verifyIDCardNumber:(NSString *)IDCardNumber;

@end

NS_ASSUME_NONNULL_END

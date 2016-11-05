//
//  NSObject+Charls.h
//  CommonExtension
//
//  Created by charls on 16/9/9.
//  Copyright © 2016年 Charls. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - NSObject
@interface NSObject (Charls)

@end

#pragma mark - 持久化
@interface NSObject (Persistence)

/**
 *  将某个对象转为plist数据存到指定目录中
 *
 *  @param object    要保存的对象
 *  @param directory 目录，如：NSDocumentDirectory（输入0默认为这个目录）
 *  @param fileName  保存的名称
 *
 *  @return 保存成功返回'YES'，保存失败返回'NO'
 */
- (BOOL)writeToDirectory:(NSSearchPathDirectory)directory withName:(nonnull NSString *)fileName;

/**
 *  从指定目录中读取数据
 *
 *  @param fileName  文件名
 *  @param directory 目录，如：NSDocumentDirectory（输入0默认为这个目录）
 *
 *  @return NSData or nil
 */
+ (nullable instancetype)objectWithFile:(nonnull NSString *)fileName fromDirectory:(NSSearchPathDirectory)directory;

@end

#pragma mark - 动态关联属性
@interface NSObject (DynamicProperties)

- (void)setAssociatedValue:(id)value withKey:(void *)key withObjc_AssociationPolicy:(objc_AssociationPolicy)associatinPolicy;

- (void)setAssociatedRetainValue:(id)value withKey:(void *)key;

- (void)setAssociatedCopyValue:(id)value withKey:(void *)key;

- (void)setAssociatedAssginValue:(id)value withKey:(void *)key;

- (nullable id)getAssociatedValueForKey:(void *)key;

- (void)removeAssociatedValues;

@end

#pragma mark - 属性列表

@interface NSObject (PropertyListing)

- (NSArray *)getAllProperties;

- (NSDictionary *)properties_aps;

@end


NS_ASSUME_NONNULL_END

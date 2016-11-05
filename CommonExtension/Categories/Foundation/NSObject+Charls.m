//
//  NSObject+Charls.m
//  CommonExtension
//
//  Created by charls on 16/9/9.
//  Copyright © 2016年 Charls. All rights reserved.
//

#import "NSObject+Charls.h"

@implementation NSObject (Charls)

@end

#pragma mark - 持久化
@implementation NSObject (Persistence)

// 将某个对象转为plist数据存到指定目录中
- (BOOL)writeToDirectory:(NSSearchPathDirectory)directory withName:(nonnull NSString *)fileName {
    NSSearchPathDirectory dir = (directory == 0) ? NSDocumentDirectory : directory;
    NSString *path = NSSearchPathForDirectoriesInDomains(dir, NSUserDomainMask, YES).firstObject;
    if (path == nil || path.length == 0)  return NO;
    
    path = [path stringByAppendingPathComponent:fileName];
    NSError *error;
    NSData *plistData = [NSPropertyListSerialization dataWithPropertyList:self format:NSPropertyListBinaryFormat_v1_0 options:kNilOptions error:&error];
    if (plistData == nil || plistData.length == 0) return NO;
    
    return [plistData writeToFile:path atomically:YES];
}

// 从指定目录中读取数据
+ (nullable instancetype)objectWithFile:(nonnull NSString *)fileName fromDirectory:(NSSearchPathDirectory)directory {
    NSSearchPathDirectory dir = (directory == 0) ? NSDocumentDirectory : directory;
    NSString *path = NSSearchPathForDirectoriesInDomains(dir, NSUserDomainMask, YES).firstObject;
    if (path == nil || path.length == 0)  return nil;
    
    path = [path stringByAppendingPathComponent:fileName];
    NSData *plistData = [NSData dataWithContentsOfFile:path];
    if (plistData == nil || plistData.length == 0) return nil;
    
    NSError *error = nil;
    id plist = [NSPropertyListSerialization propertyListWithData:plistData options:NSPropertyListImmutable format:nil error:&error];
    if (error) return nil;
#if DEBUG
    NSLog((@"%s [Line %d] >>转换plist<%@>失败, Error: %@}"), __PRETTY_FUNCTION__, __LINE__, fileName, error.localizedDescription);
#endif
    
    return plist;
}

@end

#pragma mark - 动态关联属性

@implementation NSObject (DynamicProperties)

- (void)setAssociatedValue:(id)value withKey:(void *)key withObjc_AssociationPolicy:(objc_AssociationPolicy)associatinPolicy {
    objc_setAssociatedObject(self, key, value, associatinPolicy);
}

- (void)setAssociatedRetainValue:(id)value withKey:(void *)key {
    [self setAssociatedValue:value withKey:key withObjc_AssociationPolicy:OBJC_ASSOCIATION_RETAIN_NONATOMIC];
}

- (void)setAssociatedCopyValue:(id)value withKey:(void *)key {
    [self setAssociatedValue:value withKey:key withObjc_AssociationPolicy:OBJC_ASSOCIATION_COPY_NONATOMIC];
}

- (void)setAssociatedAssginValue:(id)value withKey:(void *)key {
    [self setAssociatedValue:value withKey:key withObjc_AssociationPolicy:OBJC_ASSOCIATION_ASSIGN];
}

- (id)getAssociatedValueForKey:(void *)key {
   return objc_getAssociatedObject(self, key);
}

- (void)removeAssociatedValues {
    objc_removeAssociatedObjects(self);
}

@end

#pragma mark - 属性列表

@implementation NSObject (PropertyListing)

- (NSArray *)getAllProperties {
    u_int count;
    objc_property_t *properties  = class_copyPropertyList([self class], &count);
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i<count; i++)
    {
        const char* propertyName = property_getName(properties[i]);
        [propertiesArray addObject: [NSString stringWithUTF8String: propertyName]];
    }
    free(properties);
    return propertiesArray;
}

- (NSDictionary *)properties_aps {
    NSMutableDictionary *props = [NSMutableDictionary dictionary];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i<outCount; i++)
    {
        objc_property_t property = properties[i];
        const char* char_f = property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        id propertyValue = [self valueForKey:(NSString *)propertyName];
        if (propertyValue) [props setObject:propertyValue forKey:propertyName];
    }
    free(properties);
    return props;
}

@end


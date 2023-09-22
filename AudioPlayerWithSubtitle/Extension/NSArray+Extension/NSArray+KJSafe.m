//
//  NSArray+KJSafe.m
//  BlueWhaleProject
//
//  Created by 李雪健 on 2021/12/2.
//

#import "NSArray+KJSafe.h"
#import "Swzzling.h"

@implementation NSArray (KJSafe)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        /// __NSArray0 空数组
        swizzling_exchangeMethod(objc_getClass("__NSArray0"), @selector(objectAtIndex:), @selector(emptyArray_objectAtIndex:));
        /// __NSSingleObjectArrayI 单元素数组
        swizzling_exchangeMethod(objc_getClass("__NSSingleObjectArrayI"), @selector(objectAtIndex:), @selector(singleObjectArrayI_objectAtIndex:));
        /// __NSArrayI 不可变数组
        swizzling_exchangeMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndex:), @selector(arrayI_objectAtIndex:));
        /// __NSArrayI 不可变数组
        swizzling_exchangeMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndexedSubscript:), @selector(arrayI_objectAtIndexedSubscript:));
        /// __NSArrayM 可变数组
        swizzling_exchangeMethod(objc_getClass("__NSArrayM"), @selector(objectAtIndex:), @selector(arrayM_objectAtIndex:));
        /// __NSArrayM 可变数组
        swizzling_exchangeMethod(objc_getClass("__NSArrayM"), @selector(objectAtIndexedSubscript:), @selector(arrayM_objectAtIndexedSubscript:));
    });
}

- (id)emptyArray_objectAtIndex:(NSUInteger)index {
    /// 空数组取值直接返回nil
    return nil;
}

- (id)arrayI_objectAtIndex:(NSUInteger)index {
    
    if (self.count > index) {
        return [self arrayI_objectAtIndex:index];
    }
    return nil;
}

- (id)arrayM_objectAtIndex:(NSUInteger)index {
    
    if (self.count > index) {
        return [self arrayM_objectAtIndex:index];
    }
    return nil;
}

- (id)singleObjectArrayI_objectAtIndex:(NSUInteger)index {
    
    if (self.count > index) {
        return [self singleObjectArrayI_objectAtIndex:index];
    }
    return nil;
}

- (id)arrayI_objectAtIndexedSubscript:(NSUInteger)index {
    
    if (self.count > index) {
        return [self arrayI_objectAtIndexedSubscript:index];
    }
    return nil;
}

- (id)arrayM_objectAtIndexedSubscript:(NSUInteger)index {
    
    if (self.count > index) {
        return [self arrayM_objectAtIndexedSubscript:index];
    }
    return nil;
}

@end

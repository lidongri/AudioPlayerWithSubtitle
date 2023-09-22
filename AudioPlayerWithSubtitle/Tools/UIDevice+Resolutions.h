//
//  UIDevice+Resolutions.h
//  ZDIPhone
//
//  Created by 李雪健 on 2020/6/15.
//  Copyright © 2019 悦商集团. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM (NSUInteger, UIDeviceResolution) {
    
    //iPhone 1,3,3GS 标准分辨率(320x480px)
    kUIDevice_iPhone320_480 = 1,
    //iPhone 4,4S 高清分辨率(640x960px)
    kUIDevice_iPhone640_960 = 2,
    //iPhone 5 高清分辨率(640x1136px)
    kUIDevice_iPhone640_1136 = 3,
    //iPhone 6,6s,7,8 高清分辨率(750x1334px)
    kUIDevice_iPhone750_1334 = 4,
    //iPhone 6 plus,6s plus,7 plus,8 plus 高清分辨率(1080x1920px)
    kUIDevice_iPhone1242_2208 = 5,
    //iPad 1,2 标准分辨率(1024x768px)
    kUIDevice_iPad1024_768 = 6,
    //iPad 3 High Resolution(2048x1536px)
    kUIDevice_iPad2048_1536 = 7,
    // iphone X iPhone XS iPhone 11 Pro 13mini
    kUIDevice_iPhone1125_2436 = 8,
    // iPhone XS Max iPhone 11 Pro Max
    kUIDevice_iPhone1242_2688 = 9,
    // iPhone XR iPhone 11
    kUIDevice_iPhone828_1792 = 10,
    // iPhone 12 mini
    kUIDevice_iPhone1080_2340 = 11,
    // iPhone 12 12 pro 13 13 pro
    kUIDevice_iPhone1170_2532 = 12,
    // iPhone 12 pro max 13 pro max
    kUIDevice_iPhone1284_2778 = 13
};

@interface UIDevice (Resolutions)

/**
 获取当前分辨率
 
 @return 返回分辨率类型
 */
+ (UIDeviceResolution) device_currentResolution;

/**
 当前是否为iPhone 5,5s, 屏幕分辨率（640x1136px）
 
 @return YES：是
 */
+ (BOOL)device_isRunningOniPhone5_andSoOn;

/**
 当前是否为iPhone 6,6s,7,8 屏幕分辨率（750x1334）
 
 @return YES：是
 */
+ (BOOL)device_isRunningOniPhone6_andSoOn;

/**
 当前是否为iPhone 6 plus,6s plus,7 plus,8 plus 系列 屏幕分辨率（1080x1920）
 
 @return YES：是
 */
+ (BOOL)device_isRunningOniPhone6plus_andSoOn;

/**
 当前是否为iPhoneX 屏幕分辨率（1125x2436）
 
 @return YES：是
 */
+ (BOOL)device_isRunningOniPhoneX;

/**
 当前是否小于iPhone 6,6s,7,8 屏幕分辨率（750x1343）
 
 @return YES：是
 */
+ (BOOL)device_lessThanIPhone6;

@end

NS_ASSUME_NONNULL_END

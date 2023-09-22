//
//  UIDevice+Resolutions.m
//  ZDIPhone
//
//  Created by 李雪健 on 2020/6/15.
//  Copyright © 2019 悦商集团. All rights reserved.
//

#import "UIDevice+Resolutions.h"

@implementation UIDevice (Resolutions)

+ (UIDeviceResolution)device_currentResolution {
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        
        if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
            CGSize result = [[UIScreen mainScreen] bounds].size;
            result = CGSizeMake(result.width * [UIScreen mainScreen].scale, result.height * [UIScreen mainScreen].scale);
            if (result.height <= 480.0f) {
                return kUIDevice_iPhone320_480;
            }
            else if(result.height == 960.0f) {
                return kUIDevice_iPhone640_960;
            }
            else if(result.height == 1136.0f) {
                return kUIDevice_iPhone640_1136;
            }
            else if(result.height == 1334.0f) {
                return kUIDevice_iPhone750_1334;
            }
            else if(result.height == 2208.0f) {
                return kUIDevice_iPhone1242_2208;
            }
            else if(result.height == 2436.0f) {
                return kUIDevice_iPhone1125_2436;
            }
            else if(result.height == 2688.0f) {
                return kUIDevice_iPhone1242_2688;
            }
            else if(result.height == 1792.0f) {
                return kUIDevice_iPhone828_1792;
            }
            else if(result.height == 2340.0f) {
                return kUIDevice_iPhone1080_2340;
            }
            else if(result.height == 2532.0f) {
                return kUIDevice_iPhone1170_2532;
            }
            else if(result.height == 2778.0f) {
                return kUIDevice_iPhone1284_2778;
            }
            else {
                return kUIDevice_iPhone640_960;
            }
        } else {
            return kUIDevice_iPhone640_960;
        }
    }
    else {
        return (([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) ? kUIDevice_iPad2048_1536 : kUIDevice_iPad1024_768);
    }
}

+ (BOOL)device_isRunningOniPhone5_andSoOn {
    
    if ([self device_currentResolution] == kUIDevice_iPhone640_960) {
        return YES;
    }
    return NO;
}

+ (BOOL)device_isRunningOniPhone6_andSoOn {
    
    if ([self device_currentResolution] == kUIDevice_iPhone750_1334) {
        return YES;
    }
    return NO;
}

+ (BOOL)device_isRunningOniPhone6plus_andSoOn {
    
    if ([self device_currentResolution] == kUIDevice_iPhone1242_2208) {
        return YES;
    }
    return NO;
}

+ (BOOL)device_isRunningOniPhoneX {
    

    if ([self device_currentResolution] == kUIDevice_iPhone1125_2436 ||
        [self device_currentResolution] == kUIDevice_iPhone1242_2688 ||
        [self device_currentResolution] == kUIDevice_iPhone828_1792 ||
        [self device_currentResolution] == kUIDevice_iPhone1080_2340 ||
        [self device_currentResolution] == kUIDevice_iPhone1170_2532 ||
        [self device_currentResolution] == kUIDevice_iPhone1284_2778) {
        return YES;
    }
    return NO;
}

+ (BOOL)device_lessThanIPhone6 {
    
    if ([self device_currentResolution] == kUIDevice_iPhone320_480 || [self device_currentResolution] == kUIDevice_iPhone640_960 || [self device_currentResolution] == kUIDevice_iPhone640_1136) {
        return YES;
    }
    return NO;
}

@end

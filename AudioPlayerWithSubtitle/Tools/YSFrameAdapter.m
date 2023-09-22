//
//  ZDFrameAdapter.m
//  ZDIPhone
//
//  Created by 李雪健 on 2020/6/15.
//  Copyright © 2019 悦商集团. All rights reserved.
//

#import "YSFrameAdapter.h"
#import "YSAppInfo.h"

@implementation YSFrameAdapter

+ (CGFloat)kScreenScaleWidthScale_6 {
    
    return [UIScreen mainScreen].bounds.size.width/375.0;
}

+ (CGFloat)kScreenScaleHeightScale_6 {
    
    return ([YSAppInfo isIphoneX] ? 1 : [UIScreen mainScreen].bounds.size.height/667.0);
}

+ (CGFloat)kFitWidth_6:(CGFloat)width {
    
    return (width * [YSFrameAdapter kScreenScaleWidthScale_6]);
}

+ (CGFloat)kFitHeight_6:(CGFloat)height {
    
    return (height * [YSFrameAdapter kScreenScaleHeightScale_6]);
}

+ (CGFloat)kFitWidth_x:(CGFloat)width {
    
    return (width * [YSFrameAdapter kScreenScaleWidthScale_x]);
}

+ (CGFloat)kFitHeight_x:(CGFloat)height {
    
    return (height * [YSFrameAdapter kScreenScaleHeightScale_x]);
}

+ (CGFloat)kScreenScaleWidthScale_x {
    
    return [UIScreen mainScreen].bounds.size.width/375.0;

}

+ (CGFloat)kScreenScaleHeightScale_x {
    
    return [UIScreen mainScreen].bounds.size.height/812.0;
}

+ (CGFloat)kFitHorizontalWidth_x:(CGFloat)width {
    
    return (width * [YSFrameAdapter kHorizontalScreenScaleWidthScale_x]);
}

+ (CGFloat)kFitHorizontalHeight_x:(CGFloat)height {
 
    return (height * [YSFrameAdapter kHorizontalScreenScaleHeightScale_x]);
}

+ (CGFloat)kHorizontalScreenScaleWidthScale_x {
    
    return [UIScreen mainScreen].bounds.size.width/812.0;
}

+ (CGFloat)kHorizontalScreenScaleHeightScale_x {
    
    return [UIScreen mainScreen].bounds.size.height/375.0;;
}

+ (CGFloat)kWindowWidth {
    
    return [[UIScreen mainScreen] bounds].size.width;
}

+ (CGFloat)kWindowHeight {
    
    return (([UIApplication sharedApplication].statusBarFrame.size.height > 20 && ![YSAppInfo isIphoneX] ) ? \
            (([[UIScreen mainScreen] bounds].size.height - [UIApplication sharedApplication].statusBarFrame.size.height + 20)) : \
            [[UIScreen mainScreen] bounds].size.height);
}

+ (CGFloat)kNavHeightWithStatusBar {
    
    return ([YSAppInfo isIphoneX]  ? 88 : 64);
}

+ (CGFloat)kTabBarHeight {
    
    return ([YSAppInfo isIphoneX] ? 83 : 49);
}

+ (CGFloat)kStatusBarHeight {
    
    return ([YSAppInfo isIphoneX] ? 44 : 20);
}

+ (CGFloat)kIPhoneXBottomSafeHeight {
    
    return ([YSAppInfo isIphoneX] ? 34 : 0);
}

+ (BOOL)isIphoneX {
    
    return [YSAppInfo isIphoneX];
}

@end

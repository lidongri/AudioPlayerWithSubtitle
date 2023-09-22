//
//  ZDFrameAdapter.h
//  ZDIPhone
//
//  Created by 李雪健 on 2020/6/15.
//  Copyright © 2019 悦商集团. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YSFrameAdapter : NSObject

/// 适配6系列尺寸
+ (CGFloat)kFitWidth_6:(CGFloat)width;
+ (CGFloat)kFitHeight_6:(CGFloat)height;
+ (CGFloat)kScreenScaleWidthScale_6;
+ (CGFloat)kScreenScaleHeightScale_6;

/// 适配x系列尺寸
+ (CGFloat)kFitWidth_x:(CGFloat)width;
+ (CGFloat)kFitHeight_x:(CGFloat)height;
+ (CGFloat)kScreenScaleWidthScale_x;
+ (CGFloat)kScreenScaleHeightScale_x;

/// 横屏状态适配x系列尺寸
+ (CGFloat)kFitHorizontalWidth_x:(CGFloat)width;
+ (CGFloat)kFitHorizontalHeight_x:(CGFloat)height;
+ (CGFloat)kHorizontalScreenScaleWidthScale_x;
+ (CGFloat)kHorizontalScreenScaleHeightScale_x;

/// 屏幕尺寸
+ (CGFloat)kWindowWidth;
+ (CGFloat)kWindowHeight;
+ (CGFloat)kNavHeightWithStatusBar;
+ (CGFloat)kTabBarHeight;
+ (CGFloat)kStatusBarHeight;
+ (CGFloat)kIPhoneXBottomSafeHeight;
+ (BOOL)isIphoneX;

@end

NS_ASSUME_NONNULL_END

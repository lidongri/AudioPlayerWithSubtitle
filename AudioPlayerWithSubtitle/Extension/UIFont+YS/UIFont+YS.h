//
//  UIFont+YS.h
//  YSTools
//
//  Created by 李雪健 on 2020/6/15.
//  Copyright © 2020 悦商集团. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (YS)

+ (NSArray *)supportFontNames;

/// 字体所占高度与真实大小的间距 regular
+ (CGFloat)gap:(CGFloat)fontSize;
/// 打印字体
+ (void)printFontNames;

#pragma mark - 附加比例
/// Light Font
+ (UIFont *)font_systemLightFontWithSize:(CGFloat)fontSize;

/// Regular Font
+ (UIFont *)font_systemRegularFontWithSize:(CGFloat)fontSize;

/// Medium Font
+ (UIFont *)font_systemMediumFontWithSize:(CGFloat)fontSize;

/// Semibold Font
+ (UIFont *)font_systemSemiboldFontWithSize:(CGFloat)fontSize;

#pragma mark - 不附加比例
/// Light No Scale Font
+ (UIFont *)font_systemLightFontWithNoScaleSize:(CGFloat)fontSize;

/// Regular No Scale Font
+ (UIFont *)font_systemRegularFontWithNoScaleSize:(CGFloat)fontSize;

/// Medium No Scale Font
+ (UIFont *)font_systemMediumFontWithNoScaleSize:(CGFloat)fontSize;

/// Semibold No Scale Font
+ (UIFont *)font_systemSemiboldFontWithNoScaleSize:(CGFloat)fontSize;

#pragma mark - publick methods
+ (UIFont *)kj_fontWithName:(NSString *)fontName size:(CGFloat)fontSize;

+ (UIFont *)kj_fontWithNoScaleName:(NSString *)fontName size:(CGFloat)fontSize;

@end

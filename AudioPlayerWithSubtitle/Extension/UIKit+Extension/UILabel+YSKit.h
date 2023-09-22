//
//  UILabel+YSKit.h
//  YSUtils
//
//  Created by Apple on 2021/1/15.
//  Copyright © 2021 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIFont+YS.h"
#import "UIColor+JGHexColor.h"

NS_ASSUME_NONNULL_BEGIN

typedef UILabel * _Nonnull (^YSLabelHidden) (BOOL hidden);
typedef UILabel * _Nonnull (^YSLabelFrame) (CGRect frame);
typedef UILabel * _Nonnull (^YSLabelShow) (UIView *superView);
typedef UILabel * _Nonnull (^YSLabelText) (NSString * title);
typedef UILabel * _Nonnull (^YSLabelFont) (UIFont *titleFont);
typedef UILabel * _Nonnull (^YSLabelRegularFont) (CGFloat titleRegularFont);
typedef UILabel * _Nonnull (^YSLabelMediumFont) (CGFloat titleMediumFont);
typedef UILabel * _Nonnull (^YSLabelTextColor) (UIColor * color);
typedef UILabel * _Nonnull (^YSLabelTintColor) (UIColor *tintColor);
typedef UILabel * _Nonnull (^YSLabelBackgroundColor) (UIColor *color);
typedef UILabel * _Nonnull (^YSLabelTextHexColor) (NSString *color);
typedef UILabel * _Nonnull (^YSLabelTintHexColor) (NSString *tintColor);
typedef UILabel * _Nonnull (^YSLabelBackgroundHexColor) (NSString *color);
typedef UILabel * _Nonnull (^YSLabelMasksToBounds) (BOOL masksToBounds);
typedef UILabel * _Nonnull (^YSLabelBorderWidth) (CGFloat borderWidth);
typedef UILabel * _Nonnull (^YSLabelCornerRadius) (CGFloat cornerRadius);
typedef UILabel * _Nonnull (^YSLabelBorderColor) (CGColorRef borderColor);
typedef UILabel * _Nonnull (^YSLabelBorderHexColor) (NSString *borderColor);
typedef UILabel * _Nonnull (^YSLabelTextAlignment) (NSTextAlignment textAlignment);
typedef UILabel * _Nonnull (^YSLabelLineBreakMode) (NSLineBreakMode lineBreakMode);
typedef UILabel * _Nonnull (^YSLabelAttributedText) (NSAttributedString *attributedText);
typedef UILabel * _Nonnull (^YSLabelUserInteractionEnabled) (BOOL userInteractionEnabled);
typedef UILabel * _Nonnull (^YSLabelNumberOfLines) (NSInteger numberOfLines);
typedef UILabel * _Nonnull (^YSLabelAdjustsFontSize) (BOOL adjusts);

@interface UILabel (YSKit)

+ (instancetype)ys_label;

/// 名称
@property (nonatomic, copy, readonly) YSLabelText ys_text;
/// 字号
@property (nonatomic, copy, readonly) YSLabelFont ys_font;
/// 字号
@property (nonatomic, copy, readonly) YSLabelRegularFont ys_regularFont;
/// 字号
@property (nonatomic, copy, readonly) YSLabelMediumFont ys_mediumFont;
/// 颜色
@property (nonatomic, copy, readonly) YSLabelTextColor ys_textColor;
/// 颜色
@property (nonatomic, copy, readonly) YSLabelTextHexColor ys_textHexColor;
/// 对齐方式
@property (nonatomic, copy, readonly) YSLabelTextAlignment ys_textAlignment;
/// 换行方式
@property (nonatomic, copy, readonly) YSLabelLineBreakMode ys_lineBreakMode;
/// 富文本
@property (nonatomic, copy, readonly) YSLabelAttributedText ys_attributedText;
/// 背景颜色
@property (nonatomic, copy, readonly) YSLabelBackgroundColor ys_backgroundColor;
/// 背景颜色
@property (nonatomic, copy, readonly) YSLabelBackgroundHexColor ys_backgroundHexColor;
/// 圆角 设置后默认masksToBounds=YES
@property (nonatomic, copy, readonly) YSLabelCornerRadius ys_cornerRadius;
/// 是否切割边缘
@property (nonatomic, copy, readonly) YSLabelMasksToBounds ys_masksToBounds;
/// 交互
@property (nonatomic, copy, readonly) YSLabelUserInteractionEnabled ys_userInteractionEnabled;
/// 边缘颜色
@property (nonatomic, copy, readonly) YSLabelBorderColor ys_borderColor;
/// 边缘颜色
@property (nonatomic, copy, readonly) YSLabelBorderHexColor ys_borderHexColor;
/// 边缘宽度
@property (nonatomic, copy, readonly) YSLabelBorderWidth ys_borderWidth;
/// tintColor
@property (nonatomic, copy, readonly) YSLabelTintColor ys_tintColor;
/// tintColor
@property (nonatomic, copy, readonly) YSLabelTintHexColor ys_tintHexColor;
/// 布局
@property (nonatomic, copy, readonly) YSLabelFrame ys_frame;
/// 显示
@property (nonatomic, copy, readonly) YSLabelShow ys_show;
/// 行数
@property (nonatomic, copy, readonly) YSLabelNumberOfLines ys_numberOfLines;
/// 隐藏
@property (nonatomic, copy, readonly) YSLabelHidden ys_hidden;
/// 根据宽高适配字体
@property (nonatomic, copy, readonly) YSLabelAdjustsFontSize ys_adjusts;

@end

NS_ASSUME_NONNULL_END

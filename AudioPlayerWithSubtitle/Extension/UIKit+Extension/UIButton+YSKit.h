//
//  UIButton+YSKit.h
//  YSUtils
//
//  Created by Apple on 2021/1/15.
//  Copyright © 2021 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+Position.h"
#import "UIFont+YS.h"
#import "UIColor+JGHexColor.h"

NS_ASSUME_NONNULL_BEGIN

typedef UIButton * _Nonnull (^YSButtonFrame) (CGRect frame);
typedef UIButton * _Nonnull (^YSButtonShow) (UIView *superView);
typedef UIButton * _Nonnull (^YSButtonHidden) (BOOL hidden);
typedef UIButton * _Nonnull (^YSButtonTitleFont) (UIFont *titleFont);
typedef UIButton * _Nonnull (^YSButtonTitleRegularFont) (CGFloat titleRegularFont);
typedef UIButton * _Nonnull (^YSButtonTitleMediumFont) (CGFloat titleMediumFont);
typedef UIButton * _Nonnull (^YSButtonTintColor) (UIColor *tintColor);
typedef UIButton * _Nonnull (^YSButtonTintHexColor) (NSString *tintHexColor);
typedef UIButton * _Nonnull (^YSButtonTouchSize) (CGSize touchAreaSize);
typedef UIButton * _Nonnull (^YSButtonBackgroundColor) (UIColor *color);
typedef UIButton * _Nonnull (^YSButtonBackgroundHexColor) (NSString *hexColor);
typedef UIButton * _Nonnull (^YSButtonBorderWidth) (CGFloat borderWidth);
typedef UIButton * _Nonnull (^YSButtonMasksToBounds) (BOOL masksToBounds);
typedef UIButton * _Nonnull (^YSButtonCornerRadius) (CGFloat cornerRadius);
typedef UIButton * _Nonnull (^YSButtonBorderColor) (CGColorRef borderColor);
typedef UIButton * _Nonnull (^YSButtonBorderHexColor) (NSString *borderHexColor);
typedef UIButton * _Nonnull (^YSButtonImage) (UIImage *image, UIControlState state);
typedef UIButton * _Nonnull (^YSButtonNormalImage) (NSString *imageName);
typedef UIButton * _Nonnull (^YSButtonImagePosition) (DRImagePosition postion, CGFloat space);
typedef UIButton * _Nonnull (^YSButtonTitle) (NSString *title, UIControlState state);
typedef UIButton * _Nonnull (^YSButtonNormalTitle) (NSString *title);
typedef UIButton * _Nonnull (^YSButtonTitleColor) (UIColor * color, UIControlState state);
typedef UIButton * _Nonnull (^YSButtonTitleHexColor) (NSString * hexColor, UIControlState state);
typedef UIButton * _Nonnull (^YSButtonUserInteractionEnabled) (BOOL userInteractionEnabled);
typedef UIButton * _Nonnull (^YSButtonTargetAction) (id target, SEL sel, UIControlEvents event);

@interface UIButton (YSKit)

/// 用户保存信息
@property (nonatomic, strong) id info;


+ (instancetype)ys_button;

/// 图片
@property (nonatomic, copy, readonly) YSButtonNormalImage ys_normal_image;
/// 名称
@property (nonatomic, copy, readonly) YSButtonNormalTitle ys_normal_title;
/// 名称
@property (nonatomic, copy, readonly) YSButtonTitle ys_title;
/// 图片
@property (nonatomic, copy, readonly) YSButtonImage ys_image;
/// 文字 图片位置
@property (nonatomic, copy, readonly) YSButtonImagePosition ys_position;
/// 颜色
@property (nonatomic, copy, readonly) YSButtonTitleColor ys_titleColor;
/// 颜色
@property (nonatomic, copy, readonly) YSButtonTitleHexColor ys_titleHexColor;
/// 字号
@property (nonatomic, copy, readonly) YSButtonTitleFont ys_font;
/// 字号
@property (nonatomic, copy, readonly) YSButtonTitleRegularFont ys_regularFont;
/// 字号
@property (nonatomic, copy, readonly) YSButtonTitleMediumFont ys_mediumFont;
/// 事件
@property (nonatomic, copy, readonly) YSButtonTargetAction ys_action;
/// 点击区域
@property (nonatomic, copy, readonly) YSButtonTouchSize ys_touchSize;
/// 背景颜色
@property (nonatomic, copy, readonly) YSButtonBackgroundColor ys_backgroundColor;
/// 背景颜色
@property (nonatomic, copy, readonly) YSButtonBackgroundHexColor ys_backgroundHexColor;
/// 圆角 设置后默认masksToBounds=YES
@property (nonatomic, copy, readonly) YSButtonCornerRadius ys_cornerRadius;
/// 是否切割边缘
@property (nonatomic, copy, readonly) YSButtonMasksToBounds ys_masksToBounds;
/// 交互
@property (nonatomic, copy, readonly) YSButtonUserInteractionEnabled ys_userInteractionEnabled;
/// 边缘颜色
@property (nonatomic, copy, readonly) YSButtonBorderColor ys_borderColor;
/// 边缘颜色
@property (nonatomic, copy, readonly) YSButtonBorderHexColor ys_borderHexColor;
/// 边缘宽度
@property (nonatomic, copy, readonly) YSButtonBorderWidth ys_borderWidth;
/// tintColor
@property (nonatomic, copy, readonly) YSButtonTintColor ys_tintColor;
/// tintColor
@property (nonatomic, copy, readonly) YSButtonTintHexColor ys_tintHexColor;
/// 布局
@property (nonatomic, copy, readonly) YSButtonFrame ys_frame;
/// 显示
@property (nonatomic, copy, readonly) YSButtonShow ys_show;
/// 隐藏
@property (nonatomic, copy, readonly) YSButtonHidden ys_hidden;

@end

NS_ASSUME_NONNULL_END

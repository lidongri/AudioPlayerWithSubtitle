//
//  UIView+YSKit.h
//  YSUtils
//
//  Created by Apple on 2021/1/15.
//  Copyright © 2021 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIFont+YS.h"
#import "UIColor+JGHexColor.h"

NS_ASSUME_NONNULL_BEGIN

typedef UIView * _Nonnull (^YSViewFrame) (CGRect frame);
typedef UIView * _Nonnull (^YSViewHidden) (BOOL hidden);
typedef UIView * _Nonnull (^YSViewShow) (UIView *superView);
typedef UIView * _Nonnull (^YSViewTintColor) (UIColor *tintColor);
typedef UIView * _Nonnull (^YSViewBackgroundColor) (UIColor *color);
typedef UIView * _Nonnull (^YSViewBorderWidth) (CGFloat borderWidth);
typedef UIView * _Nonnull (^YSViewMasksToBounds) (BOOL masksToBounds);
typedef UIView * _Nonnull (^YSViewCornerRadius) (CGFloat cornerRadius);
typedef UIView * _Nonnull (^YSViewBorderColor) (CGColorRef borderColor);
typedef UIView * _Nonnull (^YSViewTintHexColor) (NSString *tintHexColor);
typedef UIView * _Nonnull (^YSViewBackgroundHexColor) (NSString *hexColor);
typedef UIView * _Nonnull (^YSViewBorderHexColor) (NSString *borderHexColor);
typedef UIView * _Nonnull (^YSViewUserInteractionEnabled) (BOOL userInteractionEnabled);

@interface UIView (YSKit)

+ (instancetype)ys_view;

/// 背景颜色
@property (nonatomic, copy, readonly) YSViewBackgroundColor ys_backgroundColor;
/// 背景颜色
@property (nonatomic, copy, readonly) YSViewBackgroundHexColor ys_backgroundHexColor;
/// 圆角 设置后默认masksToBounds=YES
@property (nonatomic, copy, readonly) YSViewCornerRadius ys_cornerRadius;
/// 是否切割边缘
@property (nonatomic, copy, readonly) YSViewMasksToBounds ys_masksToBounds;
/// 交互
@property (nonatomic, copy, readonly) YSViewUserInteractionEnabled ys_userInteractionEnabled;
/// 边缘颜色
@property (nonatomic, copy, readonly) YSViewBorderColor ys_borderColor;
/// 边缘颜色
@property (nonatomic, copy, readonly) YSViewBorderHexColor ys_borderHexColor;
/// 边缘宽度
@property (nonatomic, copy, readonly) YSViewBorderWidth ys_borderWidth;
/// tintColor
@property (nonatomic, copy, readonly) YSViewTintColor ys_tintColor;
/// tintColor
@property (nonatomic, copy, readonly) YSViewTintHexColor ys_tintHexColor;
/// 布局
@property (nonatomic, copy, readonly) YSViewFrame ys_frame;
/// 显示
@property (nonatomic, copy, readonly) YSViewShow ys_show;
/// 隐藏
@property (nonatomic, copy, readonly) YSViewHidden ys_hidden;

@end

NS_ASSUME_NONNULL_END

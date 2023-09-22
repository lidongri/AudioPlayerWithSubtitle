//
//  UIImageView+YSKit.h
//  YSUtils
//
//  Created by Apple on 2021/1/15.
//  Copyright © 2021 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+JGHexColor.h"

NS_ASSUME_NONNULL_BEGIN

typedef UIImageView * _Nonnull (^YSImageViewHidden) (BOOL hidden);
typedef UIImageView * _Nonnull (^YSImageViewImage) (UIImage *image);
typedef UIImageView * _Nonnull (^YSImageViewFrame) (CGRect frame);
typedef UIImageView * _Nonnull (^YSImageViewShow) (UIView *superView);
typedef UIImageView * _Nonnull (^YSImageViewTintColor) (UIColor *tintColor);
typedef UIImageView * _Nonnull (^YSImageViewBackgroundColor) (UIColor *color);
typedef UIImageView * _Nonnull (^YSImageViewTintHexColor) (NSString *tintColor);
typedef UIImageView * _Nonnull (^YSImageViewBackgroundHexColor) (NSString *color);
typedef UIImageView * _Nonnull (^YSImageViewBorderWidth) (CGFloat borderWidth);
typedef UIImageView * _Nonnull (^YSImageViewMasksToBounds) (BOOL masksToBounds);
typedef UIImageView * _Nonnull (^YSImageViewCornerRadius) (CGFloat cornerRadius);
typedef UIImageView * _Nonnull (^YSImageViewBorderColor) (CGColorRef borderColor);
typedef UIImageView * _Nonnull (^YSImageViewBorderHexColor) (NSString *borderColor);
typedef UIImageView * _Nonnull (^YSImageViewContentMode) (UIViewContentMode contentMode);
typedef UIImageView * _Nonnull (^YSImageViewUserInteractionEnabled) (BOOL userInteractionEnabled);

@interface UIImageView (YSKit)

+ (instancetype)ys_imageView;

/// 图片
@property (nonatomic, copy, readonly) YSImageViewImage ys_image;
/// 图片切割方式
@property (nonatomic, copy, readonly) YSImageViewContentMode ys_contentMode;
/// 背景颜色
@property (nonatomic, copy, readonly) YSImageViewBackgroundColor ys_backgroundColor;
/// 背景颜色
@property (nonatomic, copy, readonly) YSImageViewBackgroundHexColor ys_backgroundHexColor;
/// 圆角 设置后默认masksToBounds=YES
@property (nonatomic, copy, readonly) YSImageViewCornerRadius ys_cornerRadius;
/// 是否切割边缘
@property (nonatomic, copy, readonly) YSImageViewMasksToBounds ys_masksToBounds;
/// 交互
@property (nonatomic, copy, readonly) YSImageViewUserInteractionEnabled ys_userInteractionEnabled;
/// 边缘颜色
@property (nonatomic, copy, readonly) YSImageViewBorderColor ys_borderColor;
/// 边缘颜色
@property (nonatomic, copy, readonly) YSImageViewBorderHexColor ys_borderHexColor;
/// 边缘宽度
@property (nonatomic, copy, readonly) YSImageViewBorderWidth ys_borderWidth;
/// tintColor
@property (nonatomic, copy, readonly) YSImageViewTintColor ys_tintColor;
/// tintColor
@property (nonatomic, copy, readonly) YSImageViewTintHexColor ys_tintHexColor;
/// 布局
@property (nonatomic, copy, readonly) YSImageViewFrame ys_frame;
/// 显示
@property (nonatomic, copy, readonly) YSImageViewShow ys_show;
/// 隐藏
@property (nonatomic, copy, readonly) YSImageViewHidden ys_hidden;

@end

NS_ASSUME_NONNULL_END

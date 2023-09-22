//
//  UIView+YS_Corner.h
//  YSUtils
//
//  Created by Apple on 2020/7/23.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Corner)

/**
 设置view的圆角(四个角)
 
 @param size 圆角size
 */
- (void)ys_addCornerRoundWithCornerRadii:(CGSize)size;
/**
 *  设置部分圆角(绝对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 */
- (void)ys_addRoundedCorners:(UIRectCorner)corners
                   withRadii:(CGSize)radii;
/**
 *  设置部分圆角(相对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 *  @param rect    需要设置的圆角view的rect
 */
- (void)ys_addRoundedCorners:(UIRectCorner)corners
                   withRadii:(CGSize)radii
                    viewRect:(CGRect)rect;

@end

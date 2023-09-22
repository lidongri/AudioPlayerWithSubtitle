//
//  UIColor+Extension.h
//  DaRen
//
//  Created by Rainy on 2017/1/17.
//  Copyright © 2017年 Rainy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

#pragma mark - 随机色
+ (UIColor *)randomColor;

typedef NS_ENUM(NSInteger, YSShadeChangeDirection) {
    
    YSShadeChangeDirectionLevel,
    YSShadeChangeDirectionVertical,
    YSShadeChangeDirectionUpwardDiagonalLine,
    YSShadeChangeDirectionDownDiagonalLine,
};

/**
 创建渐变颜色

 @param size       渐变的size
 @param direction  渐变方式
 @param startcolor 开始颜色
 @param endColor   结束颜色

 @return 创建的渐变颜色
 */
+ (instancetype)ys_colorGradientChangeWithSize:(CGSize)size
                                     direction:(YSShadeChangeDirection)direction
                                    startColor:(UIColor *)startcolor
                                      endColor:(UIColor *)endColor;
@end

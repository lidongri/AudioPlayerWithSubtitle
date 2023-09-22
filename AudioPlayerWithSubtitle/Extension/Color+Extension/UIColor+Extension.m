//
//  UIColor+Extension.m
//  DaRen
//
//  Created by Rainy on 2017/1/17.
//  Copyright © 2017年 Rainy. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)

+ (UIColor *)randomColor {
    
    CGFloat r = arc4random_uniform(256);
    CGFloat g = arc4random_uniform(256);
    CGFloat b = arc4random_uniform(256);
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
}

+ (instancetype)ys_colorGradientChangeWithSize:(CGSize)size
                                     direction:(YSShadeChangeDirection)direction
                                    startColor:(UIColor *)startcolor
                                      endColor:(UIColor *)endColor {
    
    if (CGSizeEqualToSize(size, CGSizeZero) || !startcolor || !endColor) {
        return nil;
    }
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, size.width, size.height);

    CGPoint startPoint = CGPointZero;
    if (direction == YSShadeChangeDirectionDownDiagonalLine) {
        startPoint = CGPointMake(0.0, 1.0);
    }
    gradientLayer.startPoint = startPoint;
    
    CGPoint endPoint = CGPointZero;
    switch (direction) {
        case YSShadeChangeDirectionLevel:
            endPoint = CGPointMake(1.0, 0.0);
            break;
        case YSShadeChangeDirectionVertical:
            endPoint = CGPointMake(0.0, 1.0);
            break;
        case YSShadeChangeDirectionUpwardDiagonalLine:
            endPoint = CGPointMake(1.0, 1.0);
            break;
        case YSShadeChangeDirectionDownDiagonalLine:
            endPoint = CGPointMake(1.0, 0.0);
            break;
        default:
            break;
    }
    gradientLayer.endPoint = endPoint;
    gradientLayer.colors = @[(__bridge id)startcolor.CGColor, (__bridge id)endColor.CGColor];
    UIGraphicsBeginImageContext(size);
    [gradientLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [UIColor colorWithPatternImage:image];
}

@end

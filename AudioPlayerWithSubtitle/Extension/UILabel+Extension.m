//
//  UILabel+Extension.m
//  GongDan
//
//  Created by 了凡 on 16/1/20.
//  Copyright © 2016年 河北广联. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

+ (UILabel *)labelWithTextColor:(UIColor *)textColor font:(CGFloat)textFont backgroundColor:(UIColor *)backColor Text:(NSString *)text
{
    UILabel *label = [[UILabel alloc]init];
    //文字
    label.text = text;
    //文字颜色
    label.textColor = textColor;
    //字体
    label.font = [UIFont systemFontOfSize:textFont];
    //背景色
    if (backColor != nil) {
        label.backgroundColor = backColor;
    }
    return label;
}

@end

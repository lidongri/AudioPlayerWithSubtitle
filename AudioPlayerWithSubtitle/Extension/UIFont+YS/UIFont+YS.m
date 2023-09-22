//
//  UIFont+YS.m
//  YSTools
//
//  Created by 李雪健 on 2020/6/15.
//  Copyright © 2020 悦商集团. All rights reserved.
//

#import "UIFont+YS.h"

@implementation UIFont (YS)

+ (NSArray *)supportFontNames {
    
    return @[@"PingFangSC-Regular",
             @"zihun27hao-budingti",
             @"YOUSHEhaoshenti",
             @"SourceHanSerifCN-Bold",
             @"YouSheBiaoTiHei",
             @"lixukexingshu",
             @"HappyZcool-2016",
             @"PangMenZhengDao"];
}

+ (CGFloat)gap:(CGFloat)fontSize {
    
    return ([UIFont font_systemRegularFontWithSize:fontSize].lineHeight-fontSize*[UIFont kScreenScaleWidthScale_x])/2.0;
}

+ (void)printFontNames {
    
    [[UIFont familyNames] enumerateObjectsUsingBlock:^(NSString * _Nonnull familyNames, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"familyNames is %@", familyNames);
        [[UIFont fontNamesForFamilyName:familyNames] enumerateObjectsUsingBlock:^(NSString * _Nonnull fontName, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"fontName is %@", fontName);
        }];
        NSLog(@"==============");
    }];
}

+ (CGFloat)kScreenScaleWidthScale_x {
    
    return [UIScreen mainScreen].bounds.size.width/375.0;
}

+ (UIFont *)font_systemLightFontWithSize:(CGFloat)fontSize {
    
//    return [self font_systemFontWithSubName:@"Light" size:(fontSize)*[self kScreenScaleWidthScale_x]];
    return [self font_systemFontWithSubName:@"Light" size:(fontSize)*1];
}

+ (UIFont *)font_systemRegularFontWithSize:(CGFloat)fontSize {
    
//    return [self font_systemFontWithSubName:@"Regular" size:(fontSize)*[self kScreenScaleWidthScale_x]];
    return [self font_systemFontWithSubName:@"Regular" size:(fontSize)*1];
}

+ (UIFont *)font_systemMediumFontWithSize:(CGFloat)fontSize {
    
//    return [self font_systemFontWithSubName:@"Medium" size:(fontSize)*[self kScreenScaleWidthScale_x]];
    
    return [self font_systemFontWithSubName:@"Medium" size:(fontSize)*1];
}

+ (UIFont *)font_systemSemiboldFontWithSize:(CGFloat)fontSize {
    
//    return [self font_systemFontWithSubName:@"Semibold"
//                                       size:(fontSize)*[self kScreenScaleWidthScale_x]];
    
    return [self font_systemFontWithSubName:@"Semibold" size:(fontSize)*1];
}

+ (UIFont *)font_systemLightFontWithNoScaleSize:(CGFloat)fontSize {
    
    return [self font_systemFontWithSubName:@"Light" size:fontSize];
}

+ (UIFont *)font_systemRegularFontWithNoScaleSize:(CGFloat)fontSize {
    
    return [self font_systemFontWithSubName:@"Regular" size:fontSize];
}

+ (UIFont *)font_systemMediumFontWithNoScaleSize:(CGFloat)fontSize {
    
    return [self font_systemFontWithSubName:@"Medium" size:fontSize];
}

+ (UIFont *)font_systemSemiboldFontWithNoScaleSize:(CGFloat)fontSize {
    
    return [self font_systemFontWithSubName:@"Semibold" size:fontSize];
}

#pragma mark – private
/**
 根据font subName和size，返回font
 1.获取fontName，如：“.HelveticaNeueInterface-Light”
 2.如果获取失败，根据IOS版本不同，根据subName，设置默认字体
 
 @param fontSubName sub name string
 @param fontSize    字体大小
 
 @return 返回指定的font
 */
+ (UIFont *)font_systemFontWithSubName:(NSString *)fontSubName size:(CGFloat)fontSize {
    
    UIFont *systemFont = nil;
    
    if (!systemFont) {
        /// iOS9以上，默认为PingFangSC
        if (([[UIDevice currentDevice].systemVersion floatValue] >= 9.0)) {
            systemFont = [UIFont fontWithName:[NSString stringWithFormat:@"PingFangSC-%@", fontSubName] size:fontSize];
        }
        /// iOS9以下，默认为HelveticaNeue
        else {
            systemFont = [UIFont fontWithName:[NSString stringWithFormat:@"HelveticaNeue-%@", fontSubName] size:fontSize];
        }
    }
    /// 如果systemfont依然为nil，则返回系统字体
    return systemFont ? (systemFont) : ([UIFont systemFontOfSize:fontSize]);
}

+ (UIFont *)kj_fontWithName:(NSString *)fontName size:(CGFloat)fontSize {
    
    return [UIFont fontWithName:fontName size:(fontSize)*[self kScreenScaleWidthScale_x]];
}

+ (UIFont *)kj_fontWithNoScaleName:(NSString *)fontName size:(CGFloat)fontSize {
    
    return [UIFont fontWithName:fontName size:fontSize];
}

@end

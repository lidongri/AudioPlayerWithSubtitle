//
//  UILabel+YSKit.m
//  YSUtils
//
//  Created by Apple on 2021/1/15.
//  Copyright © 2021 Apple. All rights reserved.
//

#import "UILabel+YSKit.h"
#import "YSCheck.h"

@implementation UILabel (YSKit)

+ (instancetype)ys_label {
    
    return [[self alloc] init];
}

- (YSLabelText)ys_text {
    
    return ^id(NSString *text) {
        
        if (![YSCheck isBlankString:text]) {
            self.text = text;
        }
        return self;
    };
}

- (YSLabelFont)ys_font {
    
    return ^id(UIFont *font) {
        
        self.font = font;
        return self;
    };
}

- (YSLabelRegularFont)ys_regularFont {
    
    return ^id(CGFloat font) {
        
        self.font = [UIFont font_systemRegularFontWithSize:font];
        return self;
    };
}

- (YSLabelMediumFont)ys_mediumFont {
    
    return ^id(CGFloat font) {
        
        self.font = [UIFont font_systemMediumFontWithSize:font];
        
        return self;
    };
}

- (YSLabelTextColor)ys_textColor {
    
    return ^id(UIColor *color) {
        
        self.textColor = color;
        return self;
    };
}

- (YSLabelTextHexColor)ys_textHexColor {
    
    return ^id(NSString *hexColor) {
        
        self.textColor = [UIColor colorWithHexCode:hexColor];
        return self;
    };
}

- (YSLabelTextAlignment)ys_textAlignment {
    
    return ^id(NSTextAlignment textAlignment) {
        
        self.textAlignment = textAlignment;
        return self;
    };
}

- (YSLabelLineBreakMode)ys_lineBreakMode {
    
    return ^id(NSLineBreakMode lineBreakMode) {
        
        self.lineBreakMode = lineBreakMode;
        return self;
    };
}

- (YSLabelAttributedText)ys_attributedText {
    
    return ^id(NSAttributedString *attributedText) {
        
        self.attributedText = attributedText;
        return self;
    };
}

- (YSLabelBackgroundColor)ys_backgroundColor {
    
    return ^id(UIColor *color) {
        
        self.backgroundColor = color;
        return self;
    };
}

- (YSLabelBackgroundHexColor)ys_backgroundHexColor {
    
    return ^id(NSString *color) {
        
        self.backgroundColor = [UIColor colorWithHexCode:color];
        return self;
    };
}

- (YSLabelCornerRadius)ys_cornerRadius {
    
    return ^id(CGFloat cornerRadius) {
        
        self.layer.cornerRadius = cornerRadius;
        return self.ys_masksToBounds(YES);
    };
}

- (YSLabelMasksToBounds)ys_masksToBounds {
    
    return ^id(BOOL masksToBounds) {
        
        self.layer.masksToBounds = masksToBounds;
        return self;
    };
}

- (YSLabelUserInteractionEnabled)ys_userInteractionEnabled {
    
    return ^id(BOOL userInteractionEnabled) {
        
        self.userInteractionEnabled = userInteractionEnabled;
        return self;
    };
}

- (YSLabelBorderHexColor)ys_borderHexColor {
    
    return ^id(NSString *hexColor) {
        
        self.layer.borderColor = [UIColor colorWithHexCode:hexColor].CGColor;
        return self;
    };
}

- (YSLabelBorderColor)ys_borderColor {
    
    return ^id(CGColorRef borderColor) {
        
        self.layer.borderColor = borderColor;
        return self;
    };
}

- (YSLabelBorderWidth)ys_borderWidth {
    
    return ^id(CGFloat borderWidth) {
        
        self.layer.borderWidth = borderWidth;
        return self;
    };
}

- (YSLabelTintColor)ys_tintColor {
    
    return ^id(UIColor *color) {
        
        self.tintColor = color;
        return self;
    };
}

- (YSLabelTintHexColor)ys_tintHexColor {
    
    return ^id(NSString *color) {
        
        self.tintColor = [UIColor colorWithHexCode:color];
        return self;
    };
}

- (YSLabelFrame)ys_frame {
    
    return ^id(CGRect frame) {
        
        self.frame = frame;
        return self;
    };
}

- (YSLabelShow)ys_show {
    
    return ^id(UIView *superView) {
        
        if (superView != nil) [superView addSubview:self];
        return self;
    };
}

- (YSLabelNumberOfLines)ys_numberOfLines {
    
    return ^id(NSInteger numberOfLines) {
        
        self.numberOfLines = numberOfLines;
        return self;
    };
}

- (YSLabelHidden)ys_hidden {
    
    return ^id(BOOL hidden) {
        
        self.hidden = hidden;
        return self;
    };
}

- (YSLabelAdjustsFontSize)ys_adjusts {
    
    return ^id(BOOL adjusts) {
        self.adjustsFontSizeToFitWidth = adjusts;
        return self;
    };
}

@end

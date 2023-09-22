//
//  UIButton+YSKit.m
//  YSUtils
//
//  Created by Apple on 2021/1/15.
//  Copyright © 2021 Apple. All rights reserved.
//

#import "UIButton+YSKit.h"
#import <objc/runtime.h>
#import "YSCheck.h"

@implementation UIButton (YSKit)

- (id)info {
    
    return objc_getAssociatedObject(self, @selector(info));
}

- (void)setInfo:(id)info {
    
    objc_setAssociatedObject(self, @selector(info), info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (instancetype)ys_button {
    
    return [[self alloc] init];
}

- (YSButtonTitle)ys_title {
    
    return ^id(NSString * title, UIControlState state) {
        
        if (![YSCheck isBlankString:title]) {
            [self setTitle:title forState:state];
        }
        return self;
    };
}

- (YSButtonNormalTitle)ys_normal_title {
    
    return ^id(NSString * title) {
        
        if (![YSCheck isBlankString:title]) {
            [self setTitle:title forState:UIControlStateNormal];
        }
        return self;
    };
}
- (YSButtonNormalImage)ys_normal_image {
    
    return ^id(NSString * imageName) {
        
        [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        return self;
    };
}

- (YSButtonImage)ys_image {
    
    return ^id(UIImage *image, UIControlState state) {
        
        [self setImage:image forState:state];
        return self;
    };
}

- (YSButtonImagePosition)ys_position {
    
    return ^id(DRImagePosition position, CGFloat space) {
        
        [self setImagePosition:position spacing:space];
        return self;
    };
}

- (YSButtonTitleColor)ys_titleColor {
    
    return ^id(UIColor *color, UIControlState state) {
        
        [self setTitleColor:color forState:state];
        return self;
    };
}

- (YSButtonTitleHexColor)ys_titleHexColor {
    
    return ^id(NSString *hexColor, UIControlState state) {
        
        [self setTitleColor:[UIColor colorWithHexCode:hexColor] forState:state];
        return self;
    };
}

- (YSButtonBackgroundHexColor)ys_backgroundHexColor {
    
    return ^id(NSString *hexColor) {
        
        self.backgroundColor = [UIColor colorWithHexCode:hexColor];
        return self;
    };
}

- (YSButtonTargetAction)ys_action {
    
    return ^id(id target, SEL sel, UIControlEvents event) {
        
        [self addTarget:target action:sel forControlEvents:event];
        return self;
    };
}

- (YSButtonTitleFont)ys_font {
    
    return ^id(UIFont *titleFont) {
        
        self.titleLabel.font = titleFont;
        return self;
    };
}

- (YSButtonTitleRegularFont)ys_regularFont {
    
    return ^id(CGFloat fontSize) {
        
        self.titleLabel.font = [UIFont font_systemRegularFontWithSize:fontSize];
        return self;
    };
}

- (YSButtonTitleMediumFont)ys_mediumFont {
    
    return ^id(CGFloat fontSize) {
        
        self.titleLabel.font = [UIFont font_systemMediumFontWithSize:fontSize];
        return self;
    };
}

- (YSButtonTouchSize)ys_touchSize {
    
    return ^id(CGSize touchAreaSize) {
        
        self.ys_touchAreaSize = touchAreaSize;
        return self;
    };
}

- (YSButtonBackgroundColor)ys_backgroundColor {
    
    return ^id(UIColor *color) {
        
        self.backgroundColor = color;
        return self;
    };
}

- (YSButtonCornerRadius)ys_cornerRadius {
    
    return ^id(CGFloat cornerRadius) {
        
        self.layer.cornerRadius = cornerRadius;
        return self.ys_masksToBounds(YES);
    };
}

- (YSButtonMasksToBounds)ys_masksToBounds {
    
    return ^id(BOOL masksToBounds) {
        
        self.layer.masksToBounds = masksToBounds;
        return self;
    };
}

- (YSButtonUserInteractionEnabled)ys_userInteractionEnabled {
    
    return ^id(BOOL userInteractionEnabled) {
        
        self.userInteractionEnabled = userInteractionEnabled;
        return self;
    };
}

- (YSButtonBorderColor)ys_borderColor {
    
    return ^id(CGColorRef borderColor) {
        
        self.layer.borderColor = borderColor;
        return self;
    };
}

- (YSButtonBorderHexColor)ys_borderHexColor {
    
    return ^id(NSString *borderHexColor) {
        
        self.layer.borderColor = [UIColor colorWithHexCode:borderHexColor].CGColor;
        return self;
    };
}

- (YSButtonBorderWidth)ys_borderWidth {
    
    return ^id(CGFloat borderWidth) {
        
        self.layer.borderWidth = borderWidth;
        return self;
    };
}

- (YSButtonTintColor)ys_tintColor {
    
    return ^id(UIColor *color) {
        
        self.tintColor = color;
        return self;
    };
}

- (YSButtonTintHexColor)ys_tintHexColor {
    
    return ^id(NSString *hexColor) {
        
        self.tintColor = [UIColor colorWithHexCode:hexColor];
        return self;
    };
}

- (YSButtonFrame)ys_frame {
    
    return ^id(CGRect frame) {
        
        self.frame = frame;
        return self;
    };
}

- (YSButtonShow)ys_show {
    
    return ^id(UIView *superView) {
        
        if (superView != nil) [superView addSubview:self];
        return self;
    };
}

- (YSButtonHidden)ys_hidden {
    
    return ^id(BOOL hidden) {
        
        self.hidden = hidden;
        return self;
    };
}

@end

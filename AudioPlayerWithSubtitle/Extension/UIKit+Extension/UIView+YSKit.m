//
//  UIView+YSKit.m
//  YSUtils
//
//  Created by Apple on 2021/1/15.
//  Copyright © 2021 Apple. All rights reserved.
//

#import "UIView+YSKit.h"

@implementation UIView (YSKit)

+ (instancetype)ys_view {
    
    return [[self alloc] init];
}

- (YSViewBackgroundColor)ys_backgroundColor {
    
    return ^id(UIColor *color) {
        
        self.backgroundColor = color;
        return self;
    };
}

- (YSViewBackgroundHexColor)ys_backgroundHexColor {
    
    return ^id(NSString *hexColor) {
        
        self.backgroundColor = [UIColor colorWithHexCode:hexColor];
        return self;
    };
}

- (YSViewCornerRadius)ys_cornerRadius {
    
    return ^id(CGFloat cornerRadius) {
        
        self.layer.cornerRadius = cornerRadius;
        return self.ys_masksToBounds(YES);
    };
}

- (YSViewMasksToBounds)ys_masksToBounds {
    
    return ^id(BOOL masksToBounds) {
        
        self.layer.masksToBounds = masksToBounds;
        return self;
    };
}

- (YSViewUserInteractionEnabled)ys_userInteractionEnabled {
    
    return ^id(BOOL userInteractionEnabled) {
        
        self.userInteractionEnabled = userInteractionEnabled;
        return self;
    };
}

- (YSViewBorderColor)ys_borderColor {
    
    return ^id(CGColorRef borderColor) {
        
        self.layer.borderColor = borderColor;
        return self;
    };
}

- (YSViewBorderHexColor)ys_borderHexColor {
    
    return ^id(NSString *borderHexColor) {
        
        self.layer.borderColor = [UIColor colorWithHexCode:borderHexColor].CGColor;
        return self;
    };
}

- (YSViewBorderWidth)ys_borderWidth {
    
    return ^id(CGFloat borderWidth) {
        
        self.layer.borderWidth = borderWidth;
        return self;
    };
}

- (YSViewTintColor)ys_tintColor {
    
    return ^id(UIColor *color) {
        
        self.tintColor = color;
        return self;
    };
}

- (YSViewTintHexColor)ys_tintHexColor {
    
    return ^id(NSString *color) {
        
        self.tintColor = [UIColor colorWithHexCode:color];
        return self;
    };
}

- (YSViewFrame)ys_frame {
    
    return ^id(CGRect frame) {
        
        self.frame = frame;
        return self;
    };
}

- (YSViewShow)ys_show {
    
    return ^id(UIView *superView) {
        
        if (superView != nil) [superView addSubview:self];
        return self;
    };
}

- (YSViewHidden)ys_hidden {
    
    return ^id(BOOL hidden) {
        
        self.hidden = hidden;
        return self;
    };
}

@end

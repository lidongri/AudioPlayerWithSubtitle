//
//  UIImageView+YSKit.m
//  YSUtils
//
//  Created by Apple on 2021/1/15.
//  Copyright © 2021 Apple. All rights reserved.
//

#import "UIImageView+YSKit.h"

@implementation UIImageView (YSKit)

+ (instancetype)ys_imageView {
    
    return [[self alloc] init];
}

- (YSImageViewImage)ys_image {
    
    return ^id(UIImage *image) {
        
        if (image != nil) {
            self.image = image;
        }
        return self;
    };
}

- (YSImageViewContentMode)ys_contentMode {
    
    return ^id(UIViewContentMode contentMode) {
        
        self.contentMode = contentMode;
        return self;
    };
}

- (YSImageViewBackgroundColor)ys_backgroundColor {
    
    return ^id(UIColor *color) {
        
        self.backgroundColor = color;
        return self;
    };
}

- (YSImageViewBackgroundHexColor)ys_backgroundHexColor {
    
    return ^id(NSString *color) {
        
        self.backgroundColor = [UIColor colorWithHexCode:color];
        return self;
    };
}

- (YSImageViewCornerRadius)ys_cornerRadius {
    
    return ^id(CGFloat cornerRadius) {
        
        self.layer.cornerRadius = cornerRadius;
        return self.ys_masksToBounds(YES);
    };
}

- (YSImageViewMasksToBounds)ys_masksToBounds {
    
    return ^id(BOOL masksToBounds) {
        
        self.layer.masksToBounds = masksToBounds;
        return self;
    };
}

- (YSImageViewUserInteractionEnabled)ys_userInteractionEnabled {
    
    return ^id(BOOL userInteractionEnabled) {
        
        self.userInteractionEnabled = userInteractionEnabled;
        return self;
    };
}

- (YSImageViewBorderColor)ys_borderColor {
    
    return ^id(CGColorRef borderColor) {
        
        self.layer.borderColor = borderColor;
        return self;
    };
}

- (YSImageViewBorderHexColor)ys_borderHexColor {
    
    return ^id(NSString *borderColor) {
        
        self.layer.borderColor = [UIColor colorWithHexCode:borderColor].CGColor;
        return self;
    };
}

- (YSImageViewBorderWidth)ys_borderWidth {
    
    return ^id(CGFloat borderWidth) {
        
        self.layer.borderWidth = borderWidth;
        return self;
    };
}

- (YSImageViewTintColor)ys_tintColor {
    
    return ^id(UIColor *color) {
        
        self.tintColor = color;
        return self;
    };
}

- (YSImageViewTintHexColor)ys_tintHexColor {
    
    return ^id(NSString *color) {
        
        self.tintColor = [UIColor colorWithHexCode:color];
        return self;
    };
}

- (YSImageViewFrame)ys_frame {
    
    return ^id(CGRect frame) {
        
        self.frame = frame;
        return self;
    };
}

- (YSImageViewShow)ys_show {
    
    return ^id(UIView *superView) {
        
        if (superView != nil) [superView addSubview:self];
        return self;
    };
}

- (YSImageViewHidden)ys_hidden {
    
    return ^id(BOOL hidden) {
        
        self.hidden = hidden;
        return self;
    };
}

@end

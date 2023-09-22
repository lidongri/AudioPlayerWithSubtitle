//
//  UIButton+Position.m
//  DaRen
//
//  Created by 李雪健 on 2020/3/26.
//  Copyright © 2020 DR. All rights reserved.
//

#import "UIButton+Position.h"
#import <Objc/runtime.h>

static char *touchSizeKey = "ys_touchAreaSize";

@implementation UIButton (Position)

- (void)setImagePosition:(DRImagePosition)postion spacing:(CGFloat)spacing {
    
    [self setTitle:self.currentTitle forState:UIControlStateNormal];
    [self setImage:self.currentImage forState:UIControlStateNormal];
    
    /**
     上面代码的在设置Postion的时候，会改变状态
     */
    [self setImageOriginStatePosition:postion spacing:spacing];
    
}

- (void)setImageOriginStatePosition:(DRImagePosition)postion spacing:(CGFloat)spacing {
    
    CGFloat imageWidth = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    CGFloat labelWidth = [self.titleLabel.text sizeWithFont:self.titleLabel.font].width;
    CGFloat labelHeight = [self.titleLabel.text sizeWithFont:self.titleLabel.font].height;
#pragma clang diagnostic pop
    
    CGFloat imageOffsetX = (imageWidth + labelWidth) / 2 - imageWidth / 2;//image中心移动的x距离
    CGFloat imageOffsetY = imageHeight / 2 + spacing / 2;//image中心移动的y距离
    CGFloat labelOffsetX = (imageWidth + labelWidth / 2) - (imageWidth + labelWidth) / 2;//label中心移动的x距离
    CGFloat labelOffsetY = labelHeight / 2 + spacing / 2;//label中心移动的y距离
    
    CGFloat tempWidth = MAX(labelWidth, imageWidth);
    CGFloat changedWidth = labelWidth + imageWidth - tempWidth;
    CGFloat tempHeight = MAX(labelHeight, imageHeight);
    CGFloat changedHeight = labelHeight + imageHeight + spacing - tempHeight;
    
    switch (postion) {
        case eDRImagePositionLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2, 0, spacing/2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, -spacing/2);
            self.contentEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, spacing/2);
            break;
        case eDRImagePositionRight:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + spacing/2, 0, -(labelWidth + spacing/2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageWidth + spacing/2), 0, imageWidth + spacing/2);
            self.contentEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, spacing/2);
            break;
        case eDRImagePositionTop:
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            self.contentEdgeInsets = UIEdgeInsetsMake(imageOffsetY, -changedWidth/2, changedHeight-imageOffsetY, -changedWidth/2);
            break;
        case eDRImagePositionBottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            self.contentEdgeInsets = UIEdgeInsetsMake(changedHeight-imageOffsetY, -changedWidth/2, imageOffsetY, -changedWidth/2);
            break;
        default:
            break;
    }
}

- (void)setYs_touchAreaSize:(CGSize)ys_touchAreaSize {
    
    objc_setAssociatedObject(self, &touchSizeKey, [NSValue value:&ys_touchAreaSize withObjCType:@encode(CGSize)], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGSize)ys_touchAreaSize {
    
    NSValue *value = objc_getAssociatedObject(self, &touchSizeKey);
    return value.CGSizeValue;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    if (!CGSizeEqualToSize(self.ys_touchAreaSize, CGSizeZero)) {
        CGRect bounds =self.bounds;
        CGFloat fixWidth = self.ys_touchAreaSize.width - bounds.size.width;
        CGFloat fixHeight = self.ys_touchAreaSize.height- bounds.size.height;
        bounds = CGRectInset(bounds, - 0.5 * fixWidth, - 0.5 * fixHeight);
        return CGRectContainsPoint(bounds, point);
    } else {
        return [super pointInside:point withEvent:event];
    }
}

@end

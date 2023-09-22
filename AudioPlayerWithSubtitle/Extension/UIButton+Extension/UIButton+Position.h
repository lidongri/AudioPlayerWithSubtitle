//
//  UIButton+Position.h
//  DaRen
//
//  Created by 李雪健 on 2020/3/26.
//  Copyright © 2020 DR. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  @brief button 上设置图片和文字位置和间距
 */
typedef NS_ENUM(NSInteger, DRImagePosition) {
    /**
     *  图片在左，文字在右，默认
     */
    eDRImagePositionLeft = 0,
    /**
     *  图片在右，文字在左
     */
    eDRImagePositionRight = 1,
    /**
     *  图片在上，文字在下
     */
    eDRImagePositionTop = 2,
    /**
     *  图片在下，文字在上
     */
    eDRImagePositionBottom = 3,
};

@interface UIButton (Position)

/// button 点击区域  用以扩大button的点击区域
@property (nonatomic, assign) CGSize ys_touchAreaSize;

/// 设置图片文字相对位置
/// @param postion 位置
/// @param spacing 间距
- (void)setImagePosition:(DRImagePosition)postion spacing:(CGFloat)spacing;

@end

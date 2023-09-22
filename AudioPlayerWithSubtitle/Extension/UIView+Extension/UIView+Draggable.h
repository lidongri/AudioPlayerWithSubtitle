//
//  UIView+Draggable.h
//  ZDIPhone
//
//  Created by mac on 2019/10/31.
//  Copyright © 2019 北京定辉文化传媒有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ZDDraggingType) {
    /// 不能拖拽
    eZDDraggingTypeDisabled,
    /// 正常拖拽
    eZDDraggingTypeNormal,
    /// 释放后还原
    eZDDraggingTypeRevert,
    /// 自动靠边,只会靠左右两边
    eZDDraggingTypePullOver,
    /// 靠边时自动吸附边缘，可吸附四周
    eZDDraggingTypeAdsorb,
};

typedef NS_ENUM(NSUInteger, ZDScrollIndicatorType) {
    /// 所有方向
    eZDScrollIndicatorTypeDefault,
    /// 横向
    eZDScrollIndicatorTypeHorizontal,
    /// 竖向
    eZDScrollIndicatorTypeVertical
};

@protocol DraggingDelegate <NSObject>

@optional
- (void)draggingDidBegan:(UIView *)view;
- (void)draggingDidChanged:(UIView *)view;
- (void)draggingDidEnded:(UIView *)view;
- (BOOL)shouldReceivePanGesture:(UIGestureRecognizer *)gestureRecognizer;

@end

@interface UIView (Draggable)
<
UIGestureRecognizerDelegate
>

/// 拖拽事件委托，可监听拖拽的开始、变化以及结束事件。
@property (nonatomic, weak) id <DraggingDelegate> delegate;

/// 拖拽方式，默认是eZDDraggingTypeDisabled
@property (nonatomic, assign) ZDDraggingType draggingType;

/// 是否可只能在subView的范围内，默认是NO
/// 如果NO，超出subView范围的部分无法响应拖拽。剪裁超出部分可直接使用superView.clipsToBounds=YES
@property (nonatomic, assign) BOOL draggingInBounds;

/// 触发滑动手势的rect 默认整个frame
@property (nonatomic, assign) CGRect supportRect;

/// 支持的方向 默认所有方向
@property (nonatomic, assign) ZDScrollIndicatorType indicatorType;

/// 主动靠边并吸附
- (void)adsorbingAnimated:(BOOL)animated;

/// 主动靠边
- (void)pullOverAnimated:(BOOL)animated;

/// 主动还原位置
- (void)revertAnimated:(BOOL)animated;

@end

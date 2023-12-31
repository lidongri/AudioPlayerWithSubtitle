//
//  UIView+Extension.h
//  GongDan
//
//  Created by 了凡 on 16/1/14.
//  Copyright © 2016年 河北广联. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, GradientDirection) {
    GradientTypeTopToBottom = 0,//从上到下
    GradientTypeLeftToRight = 1,//从左到右
};

typedef enum {
    kAXIS_Y,
    kAXIS_X,
    kAXIS_X_Y,
}kAXIS;

typedef enum {
    kLAYOUT_AXIS_Y,
    kLAYOUT_AXIS_X,
}kLAYOUT_AXIS;

typedef enum {
    kDIR_LEFT,
    kDIR_RIGHT,
    kDIR_UP,
    kDIR_DOWN,
}kDIRECTION;


//  offParameter结构体
struct OffPara
{
    CGFloat offStart;
    CGFloat offEnd;
    BOOL    autoCalu;
};
typedef struct OffPara OffPara;

//  offParameter内联
CG_INLINE OffPara
OffParaMake(CGFloat offStart, CGFloat offEnd, BOOL autoCalu)
{
    OffPara offPara;
    offPara.offStart    = offStart;
    offPara.offEnd      = offEnd;
    offPara.autoCalu    = autoCalu;
    return offPara;
}


//  gapParameter结构体
struct GapPara
{
    CGFloat gapDistance;
    BOOL    autoCalu;
};
typedef struct GapPara GapPara;

//  gapParameter内联
CG_INLINE GapPara
GapParaMake(CGFloat gapDistance, BOOL autoCalu)
{
    GapPara gapPara;
    gapPara.gapDistance = gapDistance;
    gapPara.autoCalu    = autoCalu;
    return gapPara;
}


@interface UIView (Extension)

/**
 *  普通的方法
 */

// 毛玻璃效果处理
- (void)blurEffectWithStyle:(UIBlurEffectStyle)style Alpha:(CGFloat)alpha;

// 设置边框
- (void)setMyBorder:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

// 自定义分割线View OffY
- (void)setMySeparatorLineOffY:(int)offStart offEnd:(int)offEnd lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor offY:(CGFloat)offY;

// 自定义底部分割线View
- (void)setMySeparatorLine:(CGFloat)offStart offEnd:(CGFloat)offEnd lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor;

// 通过view，画任意方向的线
- (void)drawLine:(CGPoint)startPoint endPoint:(CGPoint)endPoint lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor;


// 通过layer，画任意方向的线
- (void)drawLineWithLayer:(CGPoint)startPoint endPoint:(CGPoint)endPoint lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor;





/**
 *  布局扩展方法
 */


//  Getter

- (CGFloat)x;
- (CGFloat)y;
- (CGFloat)maxX;
- (CGFloat)maxY;
- (CGFloat)width;
- (CGFloat)height;
- (CGPoint)origin;
- (CGSize)size;

- (CGFloat)centerX;
- (CGFloat)centerY;


//Setter

- (void)setX:(CGFloat)x;
- (void)setMaxX:(CGFloat)maxX;
- (void)setMaxX_DontMoveMinX:(CGFloat)maxX;

- (void)setY:(CGFloat)y;
- (void)setMaxY:(CGFloat)maxY;
- (void)setMaxY_DontMoveMinY:(CGFloat)maxY;

- (void)setWidth:(CGFloat)width;
- (void)setHeight:(CGFloat)height;
- (void)setOrigin:(CGPoint)point;
- (void)setOrigin:(CGPoint)point sizeToFit:(BOOL)sizeToFit;
- (void)setSize:(CGSize)size;

- (void)setCenterX:(CGFloat)x;
- (void)setCenterY:(CGFloat)y;

- (void)setWidth_DonotMoveCenter:(CGFloat)width;
- (void)setHeight_DonotMoveCenter:(CGFloat)height;
- (void)setSize_DonotMoveCenter:(CGSize)size;
- (void)sizeToFit_DonotMoveSide:(kDIRECTION)dir centerRemain:(BOOL)centerRemain;


/**
 *  和父类view剧中
 *
 *  当前view和父类view的 X轴／Y轴／中心点 对其
 */
- (void)BearSetCenterToParentViewWithAxis:(kAXIS)axis;


/**
 *  和指定的view剧中
 *
 *  当前view和指定view的 X轴／Y轴／中心点 对其
 */
- (void)BearSetCenterToView:(UIView *)destinationView withAxis:(kAXIS)axis;


/**
 *  view与view的相对位置
 */
- (void)BearSetRelativeLayoutWithDirection:(kDIRECTION)direction destinationView:(UIView *)destinationView parentRelation:(BOOL)parentRelation distance:(CGFloat)distance center:(BOOL)center;


/**
 *  view的相对布局，带sizeToFit
 */
- (void)BearSetRelativeLayoutWithDirection:(kDIRECTION)direction destinationView:(UIView *)destinationView parentRelation:(BOOL)parentRelation distance:(CGFloat)distance center:(BOOL)center sizeToFit:(BOOL)sizeToFit;


/**
 *  根据子view自动布局 自动计算:起始点，结束点，间距（三值相等）
 *  说明： 在父类view尺寸不等于需求尺寸时，会显示日志并且取消布局
 */
+ (void)BearAutoLayViewArray:(NSMutableArray *)viewArray layoutAxis:(kLAYOUT_AXIS)layoutAxis center:(BOOL)center;


/**
 *  根据子view自动布局 需要设置:起始点，结束点; 自动计算:间距
 *  说明： 在父类view尺寸不等于需求尺寸时，会显示日志并且取消布局
 */
+ (void)BearAutoLayViewArray:(NSMutableArray *)viewArray layoutAxis:(kLAYOUT_AXIS)layoutAxis center:(BOOL)center offStart:(CGFloat)offStart offEnd:(CGFloat)offEnd;


/**
 *  根据子view自动布局 需要设置:间距; 自动计算:起始点，结束点
 *  说明： 在父类view尺寸不等于需求尺寸时，会显示日志并且取消布局
 */
+ (void)BearAutoLayViewArray:(NSMutableArray *)viewArray layoutAxis:(kLAYOUT_AXIS)layoutAxis center:(BOOL)center gapDistance:(CGFloat)gapDistance;


/**
 *  根据子view自动布局 需要设置:起始点，结束点，间距
 *  说明： 在父类view尺寸不等于需求尺寸时，会自动变化
 */
+ (void)BearAutoLayViewArray:(NSMutableArray *)viewArray layoutAxis:(kLAYOUT_AXIS)layoutAxis center:(BOOL)center offStart:(CGFloat)offStart offEnd:(CGFloat)offEnd gapDistance:(CGFloat)gapDistance;


/**
 *  根据子view自动布局 需要设置:gapArray间距比例数组，间距总和
 *  说明： 在父类view尺寸不等于需求尺寸时，会自动变化
 */
+ (void)BearAutoLayViewArray:(NSMutableArray *)viewArray layoutAxis:(kLAYOUT_AXIS)layoutAxis center:(BOOL)center gapAray:(NSArray *)gapArray gapDisAll:(CGFloat)gapDisAll;




/**
 *  批量移除视图
 *
 *  @param views 需要移除的视图数组
 */
+(void)removeViews:(NSArray *)views;

-(void)setRadius:(CGFloat)r;



/**
 *  设置部分圆角(相对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners  添加多个圆角用|隔开就行
 *  @param radius   需要设置的圆角大小 例如 20.0f
 *  @param rect    需要设置的圆角view的rect
 */
-(void)setCornerRadiusRectCorner: (UIRectCorner)corners andRadius:(CGFloat)radius viewRect:(CGRect)rect;

/**
 *  添加边框
 */
-(void)setBorder:(UIColor *)color width:(CGFloat)width;


/**
 *  添加边框 圆角
 */
-(void)setBorder:(UIColor *)color width:(CGFloat)width  cornerRadius:(CGFloat)radius;
/**
 *  设置阴影
 */
-(void)setShadowWithColor:(UIColor *)color offSet:(CGSize)offSet opacity:(float)opacity radius:(CGFloat)radius;

/**
 *  设置阴影圆角
 */
-(void)setShadowWithColor:(UIColor *)color offSet:(CGSize)offSet opacity:(float)opacity radius:(CGFloat)radius cornerRadius:(CGFloat)cornerRadius;

/**
 *  添加内阴影
 */
-(void)setInnerShadowWithRect:(CGRect)rect shadowColor:(UIColor *)color offSet:(CGSize)offSet opacity:(float)opacity radius:(CGFloat)radius;
/**
*  添加渐变颜色
*/
-(void)addGradientWithColors:(NSArray*)colors rect:(CGRect)rect gradientType:(GradientDirection)type;
/**
 *   返回视图的视图控制器
 */
@property (nonatomic, strong, readonly) UIViewController *viewController;


@end

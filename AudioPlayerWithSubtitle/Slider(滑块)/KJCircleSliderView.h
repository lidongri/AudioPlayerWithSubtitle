//
//  KJCircleSliderView.h
//  BlueWhaleProject
//
//  Created by 李雪健 on 2021/12/22.
//  圆环形滑块，和UISlider类似，既可以显示进度又可以改变进度

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KJCircleSliderView : UIControl

/// 圆环的背景色
@property (nullable, nonatomic, strong) UIColor *backgroundTintColor;
/// 圆环滑过的颜色
@property (nullable, nonatomic, strong) UIColor *minimumTrackTintColor;
/// 圆环加载进度的颜色，加载完成后就相当于圆环未滑过的颜色
@property (nullable, nonatomic, strong) UIColor *maximumTrackTintColor;
/// 滑块的颜色
@property (nullable, nonatomic, strong) UIColor *thumbTintColor;
/// 设置滑块图片
@property (nullable, nonatomic, strong) UIImage *thumbImage;
/// 圆的宽度
@property (nonatomic, assign) CGFloat circleBorderWidth;
/// 圆形进度条的半径，一般比view的宽高中最小者还要小24
@property (nonatomic, assign) CGFloat circleRadius;
/// 滑块正常的半径
@property (nonatomic, assign) CGFloat thumbRadius;
/// 滑块放大的半径
@property (nonatomic, assign) CGFloat thumbExpandRadius;
/// 点击在限定的区域为YES，否则为NO.
@property (nonatomic, assign, readonly) BOOL interaction;
/// 是否可以重复拖动。默认为NO，即只能转到360；否则任意角度。
@property (nonatomic, assign) BOOL canRepeat;
/// slider当前的value
@property (nonatomic, assign) float value;
/// slider加载的进度
@property (nonatomic, assign) float loadProgress;

@end

NS_ASSUME_NONNULL_END

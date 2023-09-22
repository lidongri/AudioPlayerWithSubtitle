//
//  UIView+Shake.m
//  BlueWhaleProject
//
//  Created by 李雪健 on 2021/12/16.
//

#import "UIView+Shake.h"

#define kShakingRadian(R) ((R) / 180.0 * M_PI)
@implementation UIView (Shake)

- (void)shakeWithDuration:(CGFloat)duration repeatCount:(NSInteger)repeatCount {

    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.rotation";
    animation.values = @[@(kShakingRadian(-5)),  @(kShakingRadian(5)), @(kShakingRadian(-5))];
    animation.duration = duration;
    /// 动画的重复执行次数
    animation.repeatCount = repeatCount;
    /// 保持动画执行完毕后的状态
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeForwards;
    [self.layer addAnimation:animation forKey:@"sh_animation_shake"];
}

@end

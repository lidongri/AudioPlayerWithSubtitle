//
//  UIView+Shake.h
//  BlueWhaleProject
//
//  Created by 李雪健 on 2021/12/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Shake)

- (void)shakeWithDuration:(CGFloat)duration repeatCount:(NSInteger)repeatCount;

@end

NS_ASSUME_NONNULL_END

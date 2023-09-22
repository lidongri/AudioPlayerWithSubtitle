//
//  BWSliderView.m
//  BlueWhaleProject
//
//  Created by 李雪健 on 2022/1/11.
//

#import "BWSliderView.h"
#import "YSFrameAdapter.h"

@implementation BWSliderView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.height = [YSFrameAdapter kFitWidth_x:15];
    }
    return self;
}

- (CGRect)minimumValueImageRectForBounds:(CGRect)bounds {

    return self.bounds;
}

- (CGRect)maximumValueImageRectForBounds:(CGRect)bounds {
    
    return self.bounds;
}

/// 控制slider的宽和高
- (CGRect)trackRectForBounds:(CGRect)bounds {
    
    CGRect rect = [super trackRectForBounds:bounds];
    CGFloat y = (bounds.size.height-self.height)/2.0;
    return CGRectMake(rect.origin.x, y, bounds.size.width, self.height);
}

- (CGRect)thumbRectForBounds:(CGRect)bounds trackRect:(CGRect)rect value:(float)value {
    
    return [super thumbRectForBounds:bounds trackRect:rect value:value];
}

@end

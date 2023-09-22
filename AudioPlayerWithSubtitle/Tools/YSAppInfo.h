//
//  ZDAppInfo.h
//  ZDIPhone
//
//  Created by 李雪健 on 2020/6/15.
//  Copyright © 2019 悦商集团. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YSAppInfo : NSObject

+ (BOOL)isIphoneX;

+ (BOOL)isIPAD;

+ (NSString *)appName;

@end

NS_ASSUME_NONNULL_END

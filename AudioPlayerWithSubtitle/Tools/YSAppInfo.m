//
//  ZDAppInfo.m
//  ZDIPhone
//
//  Created by 李雪健 on 2020/6/15.
//  Copyright © 2019 悦商集团. All rights reserved.
//

#import "YSAppInfo.h"
#import "UIDevice+Resolutions.h"
#import <sys/param.h>
#import <sys/mount.h>
#import <sys/sysctl.h>

@implementation YSAppInfo

+ (NSString *)appName {
    
    return [[[NSBundle mainBundle] infoDictionary]
            objectForKey:@"CFBundleDisplayName"];
}

+ (BOOL)isIphoneX {
    
    return [UIDevice device_isRunningOniPhoneX];
}

+ (BOOL)isIPAD {
    
    return ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad);
}

@end

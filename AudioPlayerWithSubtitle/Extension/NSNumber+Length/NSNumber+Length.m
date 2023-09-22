//
//  NSNumber+Length.m
//  DaRen
//
//  Created by Apple on 2020/5/20.
//  Copyright © 2020 DR. All rights reserved.
//

#import "NSNumber+Length.h"

@implementation NSNumber (Length)

- (NSInteger)length {

    return [[NSString stringWithFormat:@"%@", self] length];
}

- (BOOL)isEqualToString:(NSString *)string {

    return [[NSString stringWithFormat:@"%@", self] isEqualToString:string];
}

@end

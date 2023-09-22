//
//  NSObject+SwitchCase.m
//  BlueWhaleProject
//
//  Created by 李雪健 on 2021/12/30.
//

#import "NSObject+SwitchCase.h"

const double  eps = 1e-8;
#define FEQUAL(a, b) (fabs((a) - (b)) < eps)

@implementation NSObject (SwitchCase)

- (void)switchInCases:(NSDictionary <id <NSCopying>, KJCaseBlock> *)cases {
    
    [self switchInCases:cases withDefault:nil];
}

- (void)switchInCases:(NSDictionary <id <NSCopying>, KJCaseBlock> *)cases withDefault:(KJCaseBlock)defaultBlock {
    
    NSAssert([self conformsToProtocol:@protocol(NSCopying)], @"must confirm to <NSCopying>");
    KJCaseBlock caseBlock = nil;
    
    if ([self isKindOfClass:[NSNumber class]]) {
        NSNumber *numKey = (NSNumber *)self;
        NSNumber *numInDic = [self findEquivalentNumber:numKey inDictionary:cases];
        if (numInDic) {
            caseBlock = cases[numInDic];
        }
    } else {
        caseBlock = cases[(id<NSCopying>)self];
    }
    
    if (caseBlock) {
        caseBlock();
    } else if (defaultBlock) {
        defaultBlock();
    }
}

- (NSNumber *)findEquivalentNumber:(NSNumber *)num inDictionary:(NSDictionary *)dic {
    
    double doubleKey = [num doubleValue];
    for (NSNumber *numIndic in dic.allKeys) {
        if ([numIndic isKindOfClass:[NSNumber class]]) {
            double doubleIndic = [numIndic doubleValue];
            if (FEQUAL(doubleIndic, doubleKey)) {
                return numIndic;
            }
        }
    }
    return nil;
}

@end

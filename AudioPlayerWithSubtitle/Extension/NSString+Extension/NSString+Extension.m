//
//  NSString+Extension.m
//  BlueWhaleProject
//
//  Created by 李雪健 on 2021/12/8.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (NSString *)kj_verticalString {
    
    NSMutableString * str = [[NSMutableString alloc] initWithString:self];
    NSInteger count = str.length;
    for (int i = 1; i < count; i ++) {
        [str insertString:@"\n" atIndex:i*2 - 1];
    }
    return str;
}

- (NSMutableAttributedString *)kj_attribute {
    
    if ([NSString isBlankString:self]) {
        return [[NSMutableAttributedString alloc] initWithString:@""];
    }
    return [[NSMutableAttributedString alloc] initWithString:self];
}

+ (BOOL)isBlankString:(id )string {
    
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if (string == nil || string == NULL) {
        return YES;
    }
    
    string = [NSString stringWithFormat:@"%@",string];
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0 ||
        [string length] == 0) {
        return YES;
    }
    
    if ([string isEqualToString:@"(null)"] ||
        [string isEqualToString:@"<null>"]) {
        return YES;
    }
    return NO;
}

- (NSString *)trim
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

//根据宽度求高度  content 计算的内容  width 计算的宽度 font字体大小
+ (CGFloat)getHeightWithContent:(NSString *)content width:(CGFloat)width font:(UIFont *)font{
    
    CGRect rect = [content boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                        options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:@{NSFontAttributeName:font}
                                        context:nil];
    
    return rect.size.height;
}

//根据高度度求宽度  content 计算的内容  Height 计算的高度 font字体大小
+ (CGFloat)getWidthWithContent:(NSString *)content height:(CGFloat)height font:(UIFont *)font{
    
    CGRect rect = [content boundingRectWithSize:CGSizeMake(MAXFLOAT, height)
                                        options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:@{NSFontAttributeName:font}
                                        context:nil];
    return rect.size.width;
}

@end

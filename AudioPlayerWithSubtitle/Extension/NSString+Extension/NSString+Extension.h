//
//  NSString+Extension.h
//  BlueWhaleProject
//
//  Created by 李雪健 on 2021/12/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extension)

- (NSString *)kj_verticalString;

- (NSMutableAttributedString *)kj_attribute;
/**
 *  返回去除前后空格的文本
 *
 */
- (NSString *)trim;
//根据label的宽获取高
+ (CGFloat)getHeightWithContent:(NSString *)content width:(CGFloat)width font:(UIFont *)font;
//根据label的高获取宽
+ (CGFloat)getWidthWithContent:(NSString *)content height:(CGFloat)height font:(UIFont *)font;

@end

NS_ASSUME_NONNULL_END

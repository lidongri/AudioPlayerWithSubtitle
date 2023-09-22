//
//  ZDCheck.h
//  ZDIPhone
//
//  Created by 李雪健 on 2020/6/15.
//  Copyright © 2019 悦商集团. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YSCheck : NSObject

/// 判断输入的密码是否符合要求 num=1-数字和字母 num=2-中英文和字母.
+ (BOOL)isValidatePassWrod:(NSString *)password num:(int)num;
/// 判断是否是中文
+ (BOOL)isChinese:(NSString *)str;
/// 判断是否是英文
+ (BOOL)isEnglish:(NSString *)str;
/// 判断是否是数字
+ (BOOL)isNumber:(NSString *)str;
/// 判断是否中/英文与数字
+ (BOOL)checkIsHanziAndIsEnglist:(NSString *)str;
/// 判断是否数字与英文
+ (BOOL)checkIsNumberAndIsEnglist:(NSString *)str;
/// 判断邮箱是否合法
+ (BOOL)isValidateEmail:(NSString *)email;
/// 判断手机号是否合法
+ (BOOL)isValidateMobile:(NSString *)mobile;

/// 判断是不是空字符串.
+ (BOOL)isBlankString:(id )string;

/// 限制输入的长度，能不能再输入
+ (BOOL)canChangeText:(NSString *)textCount maxTextCount:(NSInteger)maxtextCount;
// 计算输入的内容长度，能不能再输入
+ (NSInteger)canChangeText:(NSString *)textCount maxNumberCount:(NSInteger)maxtextCount;
// 计算输入的内容长度
+ (NSInteger)canChangeText:(NSString *)textCount;

/// 校验身份证是不是合法.
+ (BOOL)checkIdentityStringValid:(NSString *)identityString;
///  判断是不是九宫格.
+ (BOOL)isNineKeyBoard:(NSString *)string;
/// 判断字符串中是否存在emoji.
+ (BOOL)stringContainsEmoji:(NSString *)string;
/// 判断银行卡号是否合法.
+ (BOOL)isBankCard:(NSString *)cardNumber;

@end

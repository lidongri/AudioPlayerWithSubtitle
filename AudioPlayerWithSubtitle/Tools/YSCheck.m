//
//  ZDCheck.m
//  ZDIPhone
//
//  Created by 李雪健 on 2020/6/15.
//  Copyright © 2019 悦商集团. All rights reserved.
//

#import "YSCheck.h"

@implementation YSCheck

/// 判断输入的密码是否符合要求 num=1-数字和字母 num=2-中英文和字母.
+ (BOOL)isValidatePassWrod:(NSString *)password num:(int)num {
    
    NSString * mystring = password;
    if (num == 1) {
        // 判断密码是否 字母或数字  !#$%^&*.~,><:;+-_|'"=`(){}[]
        // - [] /\ "这些不能用的
        NSString * numRegex = @"^[A-Za-z0-9^*()%&+{}_|!#~<>、:'.@,;=?$-]+$";
        NSPredicate * charAndnum = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numRegex];
        if ([charAndnum evaluateWithObject:mystring] == NO) {
            return NO;
        }
    } else if (num == 2) {
        // 中英文和字母  @"[a-zA-Z\u4e00-\u9fa5][a-zA-Z0-9\u4e00-\u9fa5]+"; ^([\u4e00-\u9fa5]+|([a-z]+\s?)+)$
        // ^[a-zA-Z\u4e00-\u9fa5\\s]+$  这个是中英文组合 其中 英文之间可以有空格
        NSString * strRegex = @"^[a-zA-Z\u4e00-\u9fa5\\s]+$";
        NSPredicate * strText = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",strRegex];
        if ([strText evaluateWithObject:mystring] == NO) {
            return NO;
        }
    } else if (num == 3) {
        // 判断密码是否 字母或数字  !#$%^&*.~,><:;+-_|'"=`(){}[]
        // - [] /\ "这些不能用的
        NSString * numRegex = @"^[A-Za-z0-9]+$";
        NSPredicate * charAndnum = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numRegex];
        if ([charAndnum evaluateWithObject:mystring] == NO) {
            return NO;
        }
    }
    return YES;
}

/// 判断是否是中文
+ (BOOL)isChinese:(NSString *)str {
    
    NSString * strRegex = @"^[\u4e00-\u9fa5]+$";
    NSPredicate * strText = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",strRegex];
    NSString * mystring = str;
    return [strText evaluateWithObject:mystring];
}

/// 判断是否是英文
+ (BOOL)isEnglish:(NSString *)str {
    
    NSString * strRegex = @"[A-Za-z]+$";
    NSPredicate * strText = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",strRegex];
    NSString * mystring = str;
    return [strText evaluateWithObject:mystring];
}

/// 判断是否是数字
+ (BOOL)isNumber:(NSString *)str {
    
    NSString * strRegex = @"^[0-9]*$";
    NSPredicate * strText = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",strRegex];
    NSString * mystring = str;
    return [strText evaluateWithObject:mystring];
}

/// 判断是否中/英文与数字
+ (BOOL)checkIsHanziAndIsEnglist:(NSString *)str {
    
    if([YSCheck isChinese:str] ||
       [YSCheck isEnglish:str] ||
       [YSCheck isValidatePassWrod:str num:2] ||
       [str isEqualToString:@""]) {
        return YES;
    }
    return NO;
}

/// 判断是否数字与英文
+ (BOOL)checkIsNumberAndIsEnglist:(NSString *)str {
    
    if([YSCheck isNumber:str] ||
       [YSCheck isEnglish:str] ||
       [YSCheck isValidatePassWrod:str num:3] ||
       [str isEqualToString:@""]){
        return YES;
    }
    return NO;
}

/// 判断邮箱是否合法
+ (BOOL)isValidateEmail:(NSString *)email {
    
    NSString * emailRegex = @"[A-Z0-9a-z._-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate * emailPre = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",emailRegex];
    return [emailPre evaluateWithObject:email];
}

/// 判断手机号是否合法
+ (BOOL)isValidateMobile:(NSString *)mobile {
    
    // 手机号以13，15，18开头，八个 \d 数字字符  ^(13[0-9]|15[0-9]|18[0|6|8|9])\d{8}$
    // NSString *phoneRegex = @"^((13[0-9])|(14[0-9])|(15[0-9])|(19[0-9])|(18[0-9])|(17[0-9]))\\d{8}$";
    
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString * phoneRegex = @"^((13[0-9])|(17[0-9])|(16[0-9])|(14[0-9])|19[0-9]|(15[0-9])|(18[0,0-9]))\\d{8}$";
    NSPredicate * phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

/// 判断字符串是否为空
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

/// 限制字符串的长度
+ (BOOL)canChangeText:(NSString *)text maxTextCount:(NSInteger)maxtextCount {
    
    // 字符串长度为空
    if((text == nil) || ([text length] == 0)) {
        return YES;
    }
    NSInteger characterLen = [YSCheck canChangeText:text];
    if(characterLen <= maxtextCount) {
        return YES;
    } else {
        return NO;
    }
}

/// 计算输入的内容长度
+ (NSInteger)canChangeText:(NSString *)text maxNumberCount:(NSInteger)maxtextCount {
    
    // 字符串长度为空
    NSInteger characterLen = 0;
    for(NSInteger i = 0; i < [text length]; i++) {
        unichar character = [text characterAtIndex:i];
        // 中文
        if((character >= 0x4e00) && (character <= 0x9fbb)) {
            // 一个中文算2个长度
            characterLen += 2;
        } else {
            characterLen += 1;
        }
    }
    return maxtextCount-characterLen;
}

+ (NSInteger)canChangeText:(NSString *)text {
    
    /// 字符串长度为空
    BOOL wordNum = YES;  /// 开关 单数开始计数,2个非中文字符计数-1
    NSInteger characterLen = 0;
    for(NSInteger i = 0; i < [text length]; i++) {
        unichar character = [text characterAtIndex:i];
        if(!((character >= 0x4e00) && (character <= 0x9fbb))) { //改变开关状态
            wordNum = !wordNum;
        }
        if((character >= 0x4e00) && (character <= 0x9fbb)) {//中文
            // 一个中文算2个长度
            characterLen += 1;
        } else {
            // 英文
            characterLen += (wordNum ? 1 : 0 );
        }
    }
    return characterLen;
}

+ (BOOL)checkIdentityStringValid:(NSString *)identityString {
    
    NSString *regex = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *identityStringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    //如果通过该验证，说明身份证格式正确，但准确性还需计算
    if(![identityStringPredicate evaluateWithObject:identityString]) return NO;
    if (identityString.length == 18) {
        //将前17位加权因子保存在数组里
        NSArray *idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
        //这是除以11后，可能产生的11位余数、验证码，也保存成数组
        NSArray *idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
        //用来保存前17位各自乖以加权因子后的总和
        NSInteger idCardWiSum = 0;
        for(int i = 0;i < 17;i++) {
            NSInteger subStrIndex = [[identityString substringWithRange:NSMakeRange(i, 1)] integerValue];
            NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
            idCardWiSum+= subStrIndex * idCardWiIndex;
        }
        //计算出校验码所在数组的位置
        NSInteger idCardMod=idCardWiSum % 11;
        //得到最后一位身份证号码
        NSString *idCardLast= [identityString substringWithRange:NSMakeRange(17, 1)];
        //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
        if(idCardMod==2) {
            if(![idCardLast isEqualToString:@"X"]||![idCardLast isEqualToString:@"x"]) {
                return NO;
            }
        }else{
            //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
            if(![idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]]) {
                return NO;
            }
        }
    }
    return YES;
}

//根据身份证号获取生日
+ (NSString *)birthdayStrFromIdentityCard:(NSString *)numberStr {
    
    NSMutableString *result = [NSMutableString stringWithCapacity:0];
    NSString *year = nil;
    NSString *month = nil;
    BOOL isAllNumber = YES;
    NSString *day = nil;
    if([numberStr length]<14)
        return result;
    
    //**截取前14位
    NSString *fontNumer = [numberStr substringWithRange:NSMakeRange(0, 13)];
    
    //**检测前14位否全都是数字;
    const char *str = [fontNumer UTF8String];
    const char *p = str;
    while (*p!='\0') {
        
        if(!(*p>='0'&&*p<='9'))
            
            isAllNumber = NO;
        p++;
        
    }
    if(!isAllNumber)
        return result;
    year = [numberStr substringWithRange:NSMakeRange(6, 4)];
    month = [numberStr substringWithRange:NSMakeRange(10, 2)];
    day = [numberStr substringWithRange:NSMakeRange(12,2)];
    [result appendString:year];
    [result appendString:@"-"];
    [result appendString:month];
    [result appendString:@"-"];
    [result appendString:day];
    return result;
}

+ (BOOL)isNineKeyBoard:(NSString *)string {
    
    NSString *other = @"➋➌➍➎➏➐➑➒";
    int len = (int)string.length;
    for(int i=0;i<len;i++)
    {
        if(!([other rangeOfString:string].location != NSNotFound))
            return NO;
    }
    return YES;
}

+ (BOOL)stringContainsEmoji:(NSString *)string {
    
    __block BOOL returnValue = NO;
    
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        
        const unichar hs = [substring characterAtIndex:0];
        // surrogate pair
        if (0xd800 <= hs && hs <= 0xdbff) {
            if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f77f) {
                    returnValue = YES;
                }
            }
        } else if (substring.length > 1) {
            const unichar ls = [substring characterAtIndex:1];
            if (ls == 0x20e3) {
                returnValue = YES;
            }
            
        } else {
            // non surrogate
            if (0x2100 <= hs && hs <= 0x27ff) {
                returnValue = YES;
            } else if (0x2B05 <= hs && hs <= 0x2b07) {
                returnValue = YES;
            } else if (0x2934 <= hs && hs <= 0x2935) {
                returnValue = YES;
            } else if (0x3297 <= hs && hs <= 0x3299) {
                returnValue = YES;
            } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                returnValue = YES;
            }
        }
    }];
    
    return returnValue;
}

+ (BOOL)isBankCard:(NSString *)cardNumber {
    
    if (cardNumber.length == 16 || cardNumber.length == 19) {
        return YES;
    }
    return NO;
}

@end

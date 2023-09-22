//
//  BWAudioSubTitleModel.m
//  diary-mobile
//
//  Created by lidongri on 2023/9/11.
//

#import "BWAudioSubTitleModel.h"

@implementation BWAudioSubTitleModel

-(NSString *)startTime
{
    if (!_startTime) {
        _startTime = @"";
    }
    return _startTime;
}

-(NSString *)endTime
{
    if (!_endTime) {
        _endTime = @"";
    }
    return _endTime;
}

-(NSString *)keyWords
{
    if (!_keyWords) {
        _keyWords = @"";
    }
    return _keyWords;
}

-(NSTimeInterval)startTimeMillSecond
{
//    00:00:03.480
    if (!_startTimeMillSecond) {
        if (self.startTime.length > 0) {
            NSString *hour;
            NSString *minute;
            NSString *second;
            NSString *milliSecond;
            NSArray *array = [self.startTime componentsSeparatedByString:@":"];
            if ([self.startTime containsString:@":"]) {
                hour = array[0];
                minute = array[1];
                NSString *lastStr = array.lastObject;
                if ([lastStr containsString:@"."]) {
                    //说明有毫秒
                    NSArray *array2 = [lastStr componentsSeparatedByString:@"."];
                    if (array2.count > 0) {
                        second = array2[0];
                        milliSecond = array2[1];
                    }
                } else {
                    //说明没有毫秒
                    second = array[2];
                }
                _startTimeMillSecond = [hour integerValue]*60*60*1000+[minute integerValue]*60*1000+[second integerValue]*1000+[milliSecond integerValue];
            } else {
                //说明时间格式不对
                _startTimeMillSecond = 0;
            }
        } else {
            _startTimeMillSecond = 0;
        }
    }
    return _startTimeMillSecond;
}

-(NSTimeInterval)endTimeMillSecond
{
//    00:00:03.480
    if (!_endTimeMillSecond) {
        if (self.endTime.length > 0) {
            NSString *hour;
            NSString *minute;
            NSString *second;
            NSString *milliSecond;
            NSArray *array = [self.endTime componentsSeparatedByString:@":"];
            if ([self.endTime containsString:@":"]) {
                hour = array[0];
                minute = array[1];
                NSString *lastStr = array.lastObject;
                if ([lastStr containsString:@"."]) {
                    //说明有毫秒
                    NSArray *array2 = [lastStr componentsSeparatedByString:@"."];
                    if (array2.count > 0) {
                        second = array2[0];
                        milliSecond = array2[1];
                    }
                } else {
                    //说明没有毫秒
                    second = array[2];
                }
                _endTimeMillSecond = [hour integerValue]*60*60*1000+[minute integerValue]*60*1000+[second integerValue]*1000+[milliSecond integerValue];
            } else {
                //说明时间格式不对
                _endTimeMillSecond = 0;
            }
        } else {
            _endTimeMillSecond = 0;
        }
    }
    return _endTimeMillSecond;
}

@end

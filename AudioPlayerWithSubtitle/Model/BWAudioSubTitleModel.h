//
//  BWAudioSubTitleModel.h
//  diary-mobile
//
//  Created by lidongri on 2023/9/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWAudioSubTitleModel : NSObject

@property (nonatomic,copy) NSString *startTime;//开始时间
@property (nonatomic,copy) NSString *endTime;//结束时间
@property (nonatomic,copy) NSString *keyWords;//当前内容
@property (nonatomic, assign) NSTimeInterval startTimeMillSecond;
@property (nonatomic, assign) NSTimeInterval endTimeMillSecond;

@end

NS_ASSUME_NONNULL_END

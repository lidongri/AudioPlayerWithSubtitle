//
//  BWAudioSubTitleView.h
//  diary-mobile
//
//  Created by lidongri on 2023/9/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//音频字幕view
@interface BWAudioSubTitleView : UIView
/**
 *  音频字幕的文件名
 */
@property (nonatomic, copy) NSString *lrcname;
@property (nonatomic,assign) BOOL networkPath;
@property (nonatomic, assign) NSTimeInterval currentTime;

@end

NS_ASSUME_NONNULL_END

//
//  BWAudioSubTitleViewCell.h
//  diary-mobile
//
//  Created by lidongri on 2023/9/11.
//

#import <UIKit/UIKit.h>
@class BWAudioSubTitleModel;

NS_ASSUME_NONNULL_BEGIN
//显示字幕的cell
@interface BWAudioSubTitleViewCell : UITableViewCell

@property (nonatomic,strong) BWAudioSubTitleModel *model;
@property (nonatomic,assign) BOOL showCurrent;//yes为当前显示行

@end

NS_ASSUME_NONNULL_END

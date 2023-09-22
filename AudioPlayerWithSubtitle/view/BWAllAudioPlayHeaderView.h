//
//  BWAllAudioPlayHeaderView.h
//  diary-mobile
//
//  Created by lidongri on 2023/9/6.
//

#import <UIKit/UIKit.h>
#import "BWAudioSubTitleView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BWAllAudioPlayHeaderView : UIView

@property (nonatomic,strong) UIButton *tuiButton;
@property (nonatomic,strong) UIButton *jinButton;
@property (nonatomic,strong) UIButton *textButton;
@property (nonatomic,strong) UIButton *lastButton;
@property (nonatomic,strong) UIButton *playButton;
@property (nonatomic,strong) UIButton *nextButton;
@property (nonatomic,strong) UIButton *listButton;
@property (nonatomic,strong) UIButton *backButton;
@property (nonatomic,strong) MGSlider *slider;
@property (nonatomic,strong) UILabel *playTimesLabel;
@property (nonatomic,strong) UILabel *residueTimesLabel;
@property (nonatomic,strong) UIImageView *backImageView;
@property (nonatomic,strong) BWAudioSubTitleView *subTitleView;
@property (nonatomic,strong) UILabel *titleLabel;

@end

NS_ASSUME_NONNULL_END

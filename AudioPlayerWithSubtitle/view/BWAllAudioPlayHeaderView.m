//
//  BWAllAudioPlayHeaderView.m
//  diary-mobile
//
//  Created by lidongri on 2023/9/6.
//

#import "BWAllAudioPlayHeaderView.h"

@interface BWAllAudioPlayHeaderView()

@end

@implementation BWAllAudioPlayHeaderView

-(MGSlider*)slider{
    if(!_slider){
        _slider = [[MGSlider alloc] init];
        _slider.minimumTrackTintColor = [UIColor colorWithHexString:@"#31C5CA"];
        _slider.maximumTrackTintColor = [UIColor colorWithHexString:@"#D9D9D9"];
        _slider.value = 0;
        _slider.minimumValue = 0;
        _slider.maximumValue = 1;
        UIImage *imagea = [UIImage imageNamed:@"BWAllAudioPlayThumbImage"];
        [_slider setThumbImage:imagea forState:UIControlStateNormal];
    }
    return _slider;
}

-(BWAudioSubTitleView *)subTitleView
{
    if (!_subTitleView) {
        _subTitleView = [[BWAudioSubTitleView alloc] init];
    }
    return _subTitleView;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViewClick];
    }
    return self;
}

-(void)setupViewClick
{
    UIImageView *backImageView = [UIImageView ys_imageView]
    .ys_show(self);
    backImageView.userInteractionEnabled = YES;
    self.backImageView = backImageView;
    
    self.backButton = [UIButton ys_button]
    .ys_normal_image(@"BWAllPlayAudioBackImage")
    .ys_show(backImageView);
    
    //标题
    UILabel *titleLabel = [UILabel ys_label]
    .ys_text(@"好分身乏术了快放假了旅客发送量开发家里看电视剧弗兰克的时间管理大家")
    .ys_textHexColor(@"#ffffff")
    .ys_mediumFont(15)
    .ys_textAlignment(NSTextAlignmentLeft)
    .ys_show(backImageView);
    self.titleLabel = titleLabel;
    
    //快退15s按钮
    self.tuiButton = [UIButton ys_button]
    .ys_show(backImageView);
    [self.tuiButton setBackgroundImage:[UIImage imageNamed:@"BWAudioPlayTuiImage"] forState:UIControlStateNormal];
    //进度条
    [self addSubview:self.slider];
    //快进15s按钮
    self.jinButton = [UIButton ys_button]
    .ys_show(backImageView);
    [self.jinButton setBackgroundImage:[UIImage imageNamed:@"BWAudioPlayJinImage"] forState:UIControlStateNormal];
    
    //播放时间label
    UILabel *playTimesLabel = [UILabel ys_label]
    .ys_text(@"00:00")
    .ys_textHexColor(@"#31C5CA")
    .ys_mediumFont(12)
    .ys_textAlignment(NSTextAlignmentLeft)
    .ys_show(backImageView);
    self.playTimesLabel = playTimesLabel;
    
    //剩余时间label
    UILabel *residueTimesLabel = [UILabel ys_label]
    .ys_text(@"00:00")
    .ys_textHexColor(@"#ffffff")
    .ys_mediumFont(12)
    .ys_textAlignment(NSTextAlignmentRight)
    .ys_show(backImageView);
    self.residueTimesLabel = residueTimesLabel;
    
    //添加歌词view
    [self addSubview:self.subTitleView];
    
    //文稿按钮
    UIButton *textButton = [UIButton ys_button]
    .ys_normal_image(@"BWAudioPlayTextImage")
    .ys_normal_title(@"文稿")
    .ys_titleColor([UIColor colorWithHexCode:@"#EDEDED" alpha:0.65],normal)
    .ys_mediumFont(12)
    .ys_position(eDRImagePositionTop, [YSFrameAdapter kFitWidth_x:4])
    .ys_show(backImageView);
    self.textButton = textButton;
    
    //上一首音频按钮
    UIButton *lastButton = [UIButton ys_button]
    .ys_normal_image(@"BWAudioPlayLastImage")
    .ys_show(backImageView);
    self.lastButton = lastButton;
    
    //播放暂停按钮
    UIButton *playButton = [UIButton ys_button]
    .ys_show(backImageView);
    [playButton setBackgroundImage:[UIImage imageNamed:@"BWAudioPlayImage"] forState:UIControlStateNormal];
    self.playButton = playButton;
    
    //下一首按钮
    UIButton *nextButton = [UIButton ys_button]
    .ys_normal_image(@"BWAudioPlayNextImage")
    .ys_show(backImageView);
    self.nextButton = nextButton;
    
    //列表按钮
    UIButton *listButton = [UIButton ys_button]
    .ys_normal_image(@"BWAudioPlayListImage")
    .ys_normal_title(@"列表")
    .ys_titleColor([UIColor colorWithHexCode:@"#EDEDED" alpha:0.65],normal)
    .ys_mediumFont(12)
    .ys_position(eDRImagePositionTop, [YSFrameAdapter kFitWidth_x:4])
    .ys_show(backImageView);
    self.listButton = listButton;
    
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo([YSFrameAdapter kFitWidth_x:283]);
    }];
    
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo([YSFrameAdapter kFitWidth_x:56]);
        make.width.mas_equalTo([YSFrameAdapter kFitWidth_x:38]);
        make.height.mas_equalTo([YSFrameAdapter kFitWidth_x:38]);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backButton.mas_right).offset([YSFrameAdapter kFitWidth_x:0]);
        make.top.mas_equalTo([YSFrameAdapter kFitWidth_x:56]);
        make.width.mas_equalTo([YSFrameAdapter kFitWidth_x:240]);
        make.height.mas_equalTo([YSFrameAdapter kFitWidth_x:38]);
    }];
    
    [self.tuiButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo([YSFrameAdapter kFitWidth_x:20]);
        make.top.mas_equalTo([YSFrameAdapter kFitWidth_x:97]);
        make.width.mas_equalTo([YSFrameAdapter kFitWidth_x:24]);
        make.height.mas_equalTo([YSFrameAdapter kFitWidth_x:24]);
    }];
    
    [self.jinButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-[YSFrameAdapter kFitWidth_x:20]);
        make.top.mas_equalTo([YSFrameAdapter kFitWidth_x:97]);
        make.width.mas_equalTo([YSFrameAdapter kFitWidth_x:24]);
        make.height.mas_equalTo([YSFrameAdapter kFitWidth_x:24]);
    }];
    
    [self.slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo([YSFrameAdapter kFitWidth_x:53]);
        make.right.mas_equalTo(-[YSFrameAdapter kFitWidth_x:53]);
        make.top.mas_equalTo([YSFrameAdapter kFitWidth_x:108]);
        make.height.mas_equalTo([YSFrameAdapter kFitWidth_x:3]);
    }];
    
    [playTimesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.slider.mas_left);
        make.top.equalTo(self.slider.mas_bottom).offset([YSFrameAdapter kFitWidth_x:12]);
        make.width.mas_equalTo(self.slider.bounds.size.width/2.0);
        make.height.mas_equalTo([YSFrameAdapter kFitWidth_x:17]);
    }];
    
    [residueTimesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.slider.mas_right);
        make.top.equalTo(self.slider.mas_bottom).offset([YSFrameAdapter kFitWidth_x:12]);
        make.width.mas_equalTo(self.slider.bounds.size.width/2.0);
        make.height.mas_equalTo([YSFrameAdapter kFitWidth_x:17]);
    }];
    
    [self.subTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo([YSFrameAdapter kFitWidth_x:20]);
        make.right.mas_equalTo(-[YSFrameAdapter kFitWidth_x:20]);
        make.top.mas_equalTo([YSFrameAdapter kFitWidth_x:151]);
        make.height.mas_equalTo([YSFrameAdapter kFitWidth_x:55]);
    }];
    
    [textButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo([YSFrameAdapter kFitWidth_x:28]);
        make.bottom.mas_equalTo(-[YSFrameAdapter kFitWidth_x:17]);
        make.width.mas_equalTo([YSFrameAdapter kFitWidth_x:45]);
        make.height.mas_equalTo([YSFrameAdapter kFitWidth_x:45]);
    }];
    
    [lastButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(textButton.mas_right).offset([YSFrameAdapter kFitWidth_x:30]);
        make.bottom.mas_equalTo(-[YSFrameAdapter kFitWidth_x:24]);
        make.width.mas_equalTo([YSFrameAdapter kFitWidth_x:30]);
        make.height.mas_equalTo([YSFrameAdapter kFitWidth_x:30]);
    }];
    
    [playButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lastButton.mas_right).offset([YSFrameAdapter kFitWidth_x:30]);
        make.bottom.mas_equalTo(-[YSFrameAdapter kFitWidth_x:14]);
        make.width.mas_equalTo([YSFrameAdapter kFitWidth_x:50]);
        make.height.mas_equalTo([YSFrameAdapter kFitWidth_x:50]);
    }];
    
    [nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(playButton.mas_right).offset([YSFrameAdapter kFitWidth_x:30]);
        make.bottom.mas_equalTo(-[YSFrameAdapter kFitWidth_x:24]);
        make.width.mas_equalTo([YSFrameAdapter kFitWidth_x:30]);
        make.height.mas_equalTo([YSFrameAdapter kFitWidth_x:30]);
    }];
    
    [listButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-[YSFrameAdapter kFitWidth_x:28]);
        make.bottom.mas_equalTo(-[YSFrameAdapter kFitWidth_x:17]);
        make.width.mas_equalTo([YSFrameAdapter kFitWidth_x:45]);
        make.height.mas_equalTo([YSFrameAdapter kFitWidth_x:45]);
    }];
}

-(UIImage *)OriginImage:(UIImage *)image scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0, size.width, size.height)];
    UIImage *scaleImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaleImage;
}

@end

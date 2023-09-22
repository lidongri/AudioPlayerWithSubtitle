//
//  ViewController.m
//  AudioPlayerWithSubtitle
//
//  Created by lidongri on 2023/9/22.
//

#import "ViewController.h"
#import "XBAudioPlayer.h"
#import "BWAllAudioPlayHeaderView.h"

@interface ViewController ()
{
    NSInteger  waitCountDown3;//剩余时间
    NSInteger  allWaitCountDown;
    NSInteger  musicTime;
}

@property (nonatomic,strong) BWAllAudioPlayHeaderView *headerView;
@property (nonatomic,strong) XBAudioPlayer *audioPlayer;

@end

@implementation ViewController

-(BWAllAudioPlayHeaderView *)headerView
{
    if (!_headerView) {
        _headerView = [[BWAllAudioPlayHeaderView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [YSFrameAdapter kFitWidth_x:283])];
        _headerView.backgroundColor = [UIColor colorWithHexCode:@"#2B300C" alpha:0.61];
        [_headerView.tuiButton addTarget:self action:@selector(tuiButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_headerView.jinButton addTarget:self action:@selector(jinButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_headerView.textButton addTarget:self action:@selector(textButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_headerView.lastButton addTarget:self action:@selector(lastButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_headerView.playButton addTarget:self action:@selector(playButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_headerView.nextButton addTarget:self action:@selector(nextButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_headerView.listButton addTarget:self action:@selector(listButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_headerView.slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
        _headerView.backButton.hidden = YES;
    }
    return _headerView;
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.audioPlayer freePlayer];
    self.audioPlayer = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.headerView];
    [self playInitDataClick];
}

//初始化播放参数
-(void)playInitDataClick
{
    musicTime = [@"1421" integerValue];
    allWaitCountDown = musicTime;
    waitCountDown3 = musicTime;
    __weak typeof(self) weakself = self;
    self.audioPlayer = [XBAudioPlayer new];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"被讨厌的勇气" ofType:@"MP3"];
    self.audioPlayer.arr_urlStrs = @[filePath];
    self.audioPlayer.b_autoPlayNext = NO;
    self.audioPlayer.bl_playProgress = ^(XBAVPlayer *player, CGFloat progress, CGFloat current, CGFloat total) {
        __strong typeof(weakself) strongSelf = weakself;
//        NSLog(@"当前进度：%f, 播放了：%f, 总共：%f",progress,current,total);
        [strongSelf showTimeAndProgressWith:progress currentTime:current totalTime:total];
    };

    self.audioPlayer.bl_bufferBlock = ^(XBAVPlayer *player, CGFloat totalBuffer) {
        NSLog(@"已经缓冲了：%f",totalBuffer);
    };

    [self.audioPlayer playWithErrorBlock:nil];
    //监听播放完成，恢复暂停状态
    self.audioPlayer.bl_playbackFinish = ^(XBAVPlayer *player) {
        __strong typeof(weakself) strongSelf = weakself;
        [strongSelf.headerView.playButton setBackgroundImage:[UIImage imageNamed:@"BWAudioPlayStopImage"] forState:UIControlStateNormal];
        [strongSelf.audioPlayer pause];
    };

    //设置倒计时显示的时间
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(waitCountDown3)/60];//分
    NSString *str_second = [NSString stringWithFormat:@"%02ld",waitCountDown3%60];//秒
    NSString *format_time =
    [NSString stringWithFormat:@"%@:%@",str_minute,str_second];
    self.headerView.residueTimesLabel.text = [NSString stringWithFormat:@"%@",format_time];
    self.headerView.titleLabel.text = @"被讨厌的勇气";
    [self setupSubTitleClickWithDic:nil];
}

//根据播放的状态改变按钮的状态
-(void)changeAudioStateClick
{
    if (self.audioPlayer.b_isPlaying) {
        [self.headerView.playButton setBackgroundImage:[UIImage imageNamed:@"BWAudioPlayStopImage"] forState:UIControlStateNormal];
        [self.audioPlayer pause];
    } else {
        [self.headerView.playButton setBackgroundImage:[UIImage imageNamed:@"BWAudioPlayImage"] forState:UIControlStateNormal];
        [self.audioPlayer continuePlay];
    }
}

//配置字幕信息方法
-(void)setupSubTitleClickWithDic:(NSDictionary *)dic
{
    //初始化字幕
    self.headerView.subTitleView.networkPath = NO;
    self.headerView.subTitleView.lrcname = [[NSBundle mainBundle] pathForResource:@"被讨厌的勇气" ofType:@"srt"];
}

//显示时间和进度的方法
-(void)showTimeAndProgressWith:(CGFloat)progress currentTime:(CGFloat)currentTime totalTime:(CGFloat)totalTime
{
    NSInteger newTime = currentTime;
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",newTime/60];//分
    NSString *str_second = [NSString stringWithFormat:@"%02ld",newTime%60];//秒
    NSString *format_time =
    [NSString stringWithFormat:@"%@:%@",str_minute,str_second];
    self.headerView.playTimesLabel.text = [NSString stringWithFormat:@"%@",format_time];
    waitCountDown3 = totalTime - currentTime;
    NSString *str_minute1 = [NSString stringWithFormat:@"%02ld",(waitCountDown3%3600)/60];//分
    NSString *str_second1 = [NSString stringWithFormat:@"%02ld",waitCountDown3%60];//秒
    NSString *format_time1 =
    [NSString stringWithFormat:@"%@:%@",str_minute1,str_second1];
    self.headerView.residueTimesLabel.text = [NSString stringWithFormat:@"%@",format_time1];
    self.headerView.slider.value = progress;
    //更新字幕
    self.headerView.subTitleView.currentTime = currentTime;
}

#pragma mark - 播放音频方法
//快退15s方法
-(void)tuiButtonClick
{
    if (self.audioPlayer.b_isPlaying) {
        [self changeAudioStateClick];
    }
    NSInteger now = allWaitCountDown - waitCountDown3 - 15;
    [self.audioPlayer seekToTime:now];
    [self changeAudioStateClick];
}

//快进15s方法
-(void)jinButtonClick
{
    if (self.audioPlayer.b_isPlaying) {
        [self changeAudioStateClick];
    }
    NSInteger now = allWaitCountDown - waitCountDown3 + 15;
    [self.audioPlayer seekToTime:now];
    [self changeAudioStateClick];
}

//文稿方法
-(void)textButtonClick
{
    
}

//上一首方法
-(void)lastButtonClick
{
    
}

//播放暂停方法
-(void)playButtonClick:(UIButton *)btn
{
    if (self.audioPlayer.b_isPlaying) {
        [self.headerView.playButton setBackgroundImage:[UIImage imageNamed:@"BWAudioPlayStopImage"] forState:UIControlStateNormal];
        [self.audioPlayer pause];
    }else {
        [self.headerView.playButton setBackgroundImage:[UIImage imageNamed:@"BWAudioPlayImage"] forState:UIControlStateNormal];
        [self.audioPlayer continuePlay];
    }
}

//下一首方法
-(void)nextButtonClick
{
    
}

//列表方法
-(void)listButtonClick
{
    
}

#pragma mark Actions-拖动进度条的方法
-(void)sliderValueChanged:(UISlider *)slider{
    if (self.audioPlayer.b_isPlaying) {
        [self changeAudioStateClick];
    }
    [self.audioPlayer seekToTime:self.audioPlayer.f_playingItemDuration * slider.value];
    [self changeAudioStateClick];
}


@end

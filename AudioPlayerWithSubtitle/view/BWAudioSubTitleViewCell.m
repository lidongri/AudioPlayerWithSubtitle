//
//  BWAudioSubTitleViewCell.m
//  diary-mobile
//
//  Created by lidongri on 2023/9/11.
//

#import "BWAudioSubTitleViewCell.h"
#import "BWAudioSubTitleModel.h"

@interface BWAudioSubTitleViewCell()

@property (nonatomic,strong) NSString *keyWords;
@property (nonatomic,strong) dispatch_source_t timer;

@end

@implementation BWAudioSubTitleViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.textLabel.textColor = [UIColor whiteColor];
        self.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.textLabel.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-[YSFrameAdapter kFitWidth_x:40], [YSFrameAdapter kFitWidth_x:21]);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(BWAudioSubTitleModel *)model
{
    _model = model;
    self.textLabel.text = model.keyWords;
//    //暂时不用按字读取
//    NSMutableAttributedString *muStr = [[NSMutableAttributedString alloc] initWithString:model.keyWords];
//    [muStr addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0,model.keyWords.length)];
//    self.textLabel.attributedText = muStr;
//    if (self.showCurrent) {
//        [self showTextClick];
//    }
}

//按读取的字显示字的颜色方法
-(void)showTextClick
{
    if ([self.model.keyWords isEqualToString:self.keyWords]) {
        return;
    } else {
        self.keyWords = self.model.keyWords;
    }
    NSTimeInterval startTimeMillSecond = self.model.startTimeMillSecond;
    NSTimeInterval endTimeMillSecond = self.model.endTimeMillSecond;
    NSTimeInterval time = endTimeMillSecond-startTimeMillSecond;
    NSString *keyWords = self.model.keyWords;
    NSInteger interval = time / keyWords.length;
    __block int length = 0;
    // 获得队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    //如果有定时器，先取消旧的
    if (self.timer) {
        dispatch_source_cancel(self.timer);
    }
    // 创建一个定时器(dispatch_source_t本质还是个OC对象)
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);

    // 设置定时器的各种属性（几时开始任务，每隔多长时间执行一次）
    // GCD的时间参数，一般是纳秒（1秒 == 10的9次方纳秒）
    // 何时开始执行第一个任务
    // dispatch_time(DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC) 
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC));
    uint64_t intervals = (uint64_t)(interval * NSEC_PER_MSEC);
    dispatch_source_set_timer(self.timer, start, intervals, 0);

    // 设置回调
    __weak typeof(self) weakSelf;
    dispatch_source_set_event_handler(self.timer, ^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        length ++;
        if(length <= keyWords.length)
        {
            NSMutableAttributedString *muStr = [[NSMutableAttributedString alloc] initWithString:keyWords];
            [muStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#31C5CA"] range:NSMakeRange(0,length)];
            [muStr addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(length,keyWords.length-length)];
            strongSelf.textLabel.attributedText = muStr;
            NSLog(@"ceshi:%@",keyWords);
        }
        if (length > keyWords.length) {
            dispatch_source_cancel(strongSelf.timer);//销毁定时器
        }
    });

    // 启动定时器
    dispatch_resume(self.timer);
}

@end

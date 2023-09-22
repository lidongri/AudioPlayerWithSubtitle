//
//  BWAudioSubTitleView.m
//  diary-mobile
//
//  Created by lidongri on 2023/9/11.
//

#import "BWAudioSubTitleView.h"
#import "BWAudioSubTitleViewCell.h"
#import "BWAudioSubTitleModel.h"


@interface BWAudioSubTitleView() <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *lrcLines;
@property (nonatomic, assign) NSInteger currentIndex;
@end

@implementation BWAudioSubTitleView

static NSString *const identiferCell = @"BWAudioSubTitleViewCell";

- (NSMutableArray *)lrcLines
{
    if (_lrcLines == nil) {
        self.lrcLines = [NSMutableArray array];
    }
    return _lrcLines;
}

#pragma mark - 初始化
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super initWithCoder:decoder]) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    // 1.添加表格控件
    UITableView *tableView = [[UITableView alloc] init];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[BWAudioSubTitleViewCell class] forCellReuseIdentifier:identiferCell];
    tableView.scrollEnabled = NO;
    [self addSubview:tableView];
    self.tableView = tableView;
    self.currentIndex = -1;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.tableView.frame = self.bounds;
//    // 增加上下的内边距，让歌词一开始就居中显示
//    self.tableView.contentInset = UIEdgeInsetsMake(self.tableView.height * 0.5, 0, self.tableView.height * 0.5, 0);
    //去除整个分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;//add
}

#pragma mark -字幕
- (void)setLrcname:(NSString *)lrcname
{
    _lrcname = [lrcname copy];
    if (lrcname.length <= 0) {
        return;
    }
    [self.lrcLines removeAllObjects];
    [self.tableView reloadData];
    self.currentIndex = -1;
    //加载音频文件
    if (self.networkPath) {
        __weak typeof(self) weakSelf = self;
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:lrcname]];
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            __strong typeof(weakSelf) strongSelf = weakSelf;
            if (!error) {
                [strongSelf dealData:data];
            }else{
                NSLog(@"error  is  %@",error.localizedDescription);
            }
        }];
        [dataTask resume];
    } else {
        NSData *data = [NSData dataWithContentsOfFile:lrcname];
        [self dealData:data];
    }
}

-(void)dealData:(NSData *)data
{
    NSString *string=[[NSMutableString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //按行分割存放到数组中
    NSArray *singlearray = [string componentsSeparatedByString:@"\n"];
    NSMutableArray *begintimearray1 = [NSMutableArray array];
    NSMutableArray *endtimearray1 = [NSMutableArray array];
    NSMutableArray * subtitlesarray1 = [NSMutableArray array];
    for (int i = 0; i < singlearray.count; i++) {
        if ((i % 4) == 0) {
            //不处理，索引值
        }else if ((i % 4) == 1) {
            //得到时间
            NSString *timeStr = [singlearray objectAtIndex:i];
            NSRange range2 = [timeStr rangeOfString:@" --> "];
            if (range2.location != NSNotFound) {
                NSString *beginstr = [timeStr substringToIndex:range2.location];
                NSString *endstr = [timeStr substringFromIndex:range2.location+range2.length];
                beginstr = [beginstr stringByReplacingOccurrencesOfString:@"," withString:@"."];
                endstr = [endstr stringByReplacingOccurrencesOfString:@"," withString:@"."];
                [begintimearray1 addObject:beginstr];
                [endtimearray1 addObject:endstr];
            }
        }else if ((i % 4) == 2)
        {
            //得到字幕
            [subtitlesarray1 addObject:[singlearray objectAtIndex:i]];
        }else
        {
            //空行，不处理
        }
    }
    //转模型
    for (int i = 0; i < begintimearray1.count; i ++ ) {
        BWAudioSubTitleModel *subTitleModel = [[BWAudioSubTitleModel alloc] init];
        [self.lrcLines addObject:subTitleModel];
        if (i < begintimearray1.count) {
            subTitleModel.startTime = [begintimearray1 objectAtIndex:i];
        }
        if (i < endtimearray1.count) {
            subTitleModel.endTime = [endtimearray1 objectAtIndex:i];
        }
        if (i < subtitlesarray1.count) {
            subTitleModel.keyWords = [subtitlesarray1 objectAtIndex:i];
        }
    }
    //添加一个空的模型，为了最后一条数据能滚上去
    BWAudioSubTitleModel *subTitleModel = [[BWAudioSubTitleModel alloc] init];
    BWAudioSubTitleModel *lastModel = [self.lrcLines lastObject];
    subTitleModel.keyWords = @"";
    subTitleModel.startTime = lastModel.endTime;
    subTitleModel.endTime = lastModel.endTime;
    [self.lrcLines addObject:subTitleModel];
    dispatch_async(dispatch_get_main_queue(), ^{
        //刷新数据
        [self.tableView reloadData];
    });
}

- (void)setCurrentTime:(NSTimeInterval)currentTime
{
    // 当往前拖动，从头开始比较字幕时间
    if ((currentTime < _currentTime)) {
        self.currentIndex = -1;
    }
    
    _currentTime = currentTime;
    
    // 播放器播放的时间
    int hour = currentTime / 3600;
    int minute = currentTime / 60;
    int second = (int)currentTime % 60;
    int msecond = (currentTime - (int)currentTime) * 1000;
    NSString *currentTimeStr = [NSString stringWithFormat:@"%02d:%02d:%02d.%3d",hour, minute, second, msecond];
    
    NSUInteger count = self.lrcLines.count;
    // 每次取出当前字幕时间之后的字幕时间比较，不用每次都从头比较
    for (int idx = self.currentIndex + 1; idx<count; idx++) {
        
        // 获取模型中的字幕时间
        BWAudioSubTitleModel *currentLine = self.lrcLines[idx];
        // 当前模型的时间
        NSString *currentLineTime = currentLine.startTime;
        // 下一个模型的时间
        NSString *nextLineTime = nil;
        NSUInteger nextIdx = idx + 1;
        if (nextIdx < self.lrcLines.count) {
            BWAudioSubTitleModel *nextLine = self.lrcLines[nextIdx];
            nextLineTime = nextLine.startTime;
        }
        
        // 判断是否为正在播放的字幕，并且不是当前行才刷新
        if (
            ([currentTimeStr compare:currentLineTime] != NSOrderedAscending)
            && ([currentTimeStr compare:nextLineTime] == NSOrderedAscending)
            && self.currentIndex != idx) {
            // 刷新tableView
            self.currentIndex = idx;
            //[self.tableView reloadRowsAtIndexPaths:reloadRows withRowAnimation:UITableViewRowAnimationNone];
            [self.tableView reloadData];
            // 滚动到对应的行
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:idx inSection:0];
            [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
//                NSLog(@"==========>currentTimeStr:%@--currentLineTime:%@--nextLineTime:%@",currentTimeStr,currentLineTime,nextLineTime);
        }
    }
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.lrcLines.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BWAudioSubTitleViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identiferCell forIndexPath:indexPath];
    if (self.currentIndex == indexPath.row) {
        cell.textLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:16];
        cell.textLabel.textColor = [UIColor colorWithHexString:@"#31C5CA"];
        cell.showCurrent = YES;
    } else {
        cell.textLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:14];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.showCurrent = NO;
    }
    cell.model = self.lrcLines[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [YSFrameAdapter kFitWidth_x:26];
}

@end

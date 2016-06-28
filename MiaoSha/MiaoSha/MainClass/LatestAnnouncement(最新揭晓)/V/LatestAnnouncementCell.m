//
//  LatestAnnouncementCell.m
//  MiaoSha
//
//  Created by liqiang on 16/6/14.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "LatestAnnouncementCell.h"
#import "TTCounterLabel.h"

@interface LatestAnnouncementCell ()

@property (strong, nonatomic) TTCounterLabel *timeLabel;
@property (nonatomic, weak) UIView *timeView;
@property (nonatomic, weak) UIView *jieXiaoView;

@end

@implementation LatestAnnouncementCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (LatestAnnouncementCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"LatestAnnouncementCell";
    LatestAnnouncementCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[LatestAnnouncementCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    [self addUnderlineWithLeftMargin:0];
    
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.image = [UIImage imageNamed:@"zxjx_img001"];
    [self.contentView addSubview:iconImageView];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.font = [UIFont systemFontOfSize:12];
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.text = @"啊实打实大的撒大实大的撒实大的撒实大实大的撒实大的撒的撒实大的撒大大";
    [self.contentView addSubview:nameLabel];
    
    UILabel *priceLabel = [[UILabel alloc] init];
    priceLabel.font = [UIFont systemFontOfSize:10];
    priceLabel.textColor = [UIColor lightGrayColor];
    priceLabel.text = @"￥999999.9";
    [self.contentView addSubview:priceLabel];
    
    UIView *timeView = [[UIView alloc] init];
    timeView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:timeView];
    self.timeView = timeView;
    
    UIView *jieXiaoView = [[UIView alloc] init];
    jieXiaoView.hidden = YES;
    jieXiaoView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:jieXiaoView];
    self.jieXiaoView = jieXiaoView;
    
    UIImageView *timeImageView = [[UIImageView alloc] init];
    timeImageView.image = [UIImage imageNamed:@"ic_time"];
    [timeView addSubview:timeImageView];
    
    self.timeLabel = [[TTCounterLabel alloc] init];
    self.timeLabel.textColor = [UIColor colorWithRed:1.000 green:0.451 blue:0.655 alpha:1.00];
    self.timeLabel.countDirection = kCountDirectionDown;
    [self.timeLabel setBoldFont:[UIFont systemFontOfSize:18]];
    [self.timeLabel setRegularFont:[UIFont systemFontOfSize:18]];
    [self.timeLabel setFont:[UIFont systemFontOfSize:18]];
    [timeView addSubview:self.timeLabel];
    
    UILabel *zhongJiangNameLabel = [[UILabel alloc] init];
    zhongJiangNameLabel.font = [UIFont systemFontOfSize:10];
    zhongJiangNameLabel.textColor = [UIColor blackColor];
    zhongJiangNameLabel.text = @"中奖者：王先生";
    [jieXiaoView addSubview:zhongJiangNameLabel];
    
    UILabel *renCiLabel = [[UILabel alloc] init];
    renCiLabel.font = [UIFont systemFontOfSize:10];
    renCiLabel.textColor = [UIColor blackColor];
    renCiLabel.text = @"本期夺宝：20人次";
    [jieXiaoView addSubview:renCiLabel];
    
    UILabel *dateLabel = [[UILabel alloc] init];
    dateLabel.font = [UIFont systemFontOfSize:10];
    dateLabel.textColor = [UIColor blackColor];
    dateLabel.text = @"揭晓时间：1分钟前";
    [jieXiaoView addSubview:dateLabel];
    
    iconImageView.sd_layout
    .leftSpaceToView(self.contentView,10)
    .centerYEqualToView(self.contentView)
    .widthIs(75)
    .heightIs(75);
    
    nameLabel.sd_layout
    .topSpaceToView(self.contentView,10)
    .leftSpaceToView(iconImageView,10)
    .rightSpaceToView(self.contentView,15)
    .autoHeightRatio(0);
    [nameLabel setMaxNumberOfLinesToShow:2];
    
    priceLabel.sd_layout
    .leftEqualToView(nameLabel)
    .topSpaceToView(nameLabel,5)
    .rightEqualToView(nameLabel)
    .autoHeightRatio(0);
    
    timeView.sd_layout
    .leftEqualToView(nameLabel)
    .bottomSpaceToView(self.contentView,10)
    .rightEqualToView(nameLabel)
    .topSpaceToView(priceLabel,10);
    
    jieXiaoView.sd_layout
    .leftEqualToView(nameLabel)
    .bottomSpaceToView(self.contentView,10)
    .rightEqualToView(nameLabel)
    .topSpaceToView(priceLabel,10);
    
    timeImageView.sd_layout
    .leftSpaceToView(timeView,0)
    .bottomSpaceToView(timeView,0)
    .heightIs(30)
    .widthIs(30);
    
    self.timeLabel.sd_layout
    .leftSpaceToView(timeImageView,10)
    .topEqualToView(timeImageView)
    .bottomEqualToView(timeImageView)
    .rightSpaceToView(timeView,0);
    
    dateLabel.sd_layout
    .leftSpaceToView(jieXiaoView,0)
    .bottomSpaceToView(jieXiaoView,0)
    .rightSpaceToView(jieXiaoView,0)
    .autoHeightRatio(0);
    
    renCiLabel.sd_layout
    .leftEqualToView(dateLabel)
    .rightEqualToView(dateLabel)
    .bottomSpaceToView(dateLabel,0)
    .autoHeightRatio(0);
    
    zhongJiangNameLabel.sd_layout
    .leftEqualToView(dateLabel)
    .rightEqualToView(dateLabel)
    .bottomSpaceToView(renCiLabel,0)
    .autoHeightRatio(0);
    
}

- (void)setModel:(ModelLatestAnnouncement *)model
{
    _model = model;
    
    [self.timeLabel reset];
    
    if (model .state)
    {
        self.timeView.hidden = NO;
        self.jieXiaoView.hidden = YES;
        
        NSDate *nowDate = [NSDate date];
        long nowTimeInterval = [NSDate timeIntervalWithDate:nowDate];
        
        long time = (model.time - nowTimeInterval)*1000;
        
        if (time < 0 ) {
            
        }else{
            self.timeLabel.startValue = time;
            [self.timeLabel updateApperance];
            [self.timeLabel start];
        }
        
    }else{
        self.timeView.hidden = YES;
        self.jieXiaoView.hidden = NO;
        [self.timeLabel stop];
    }
}

@end

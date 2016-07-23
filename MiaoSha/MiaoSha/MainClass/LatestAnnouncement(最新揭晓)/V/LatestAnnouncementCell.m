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
@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *priceLabel;
@property (nonatomic, weak) UILabel *zhongJiangNameLabel;
@property (nonatomic, weak) UILabel *renCiLabel;
@property (nonatomic, weak) UILabel *dateLabel;
@property (nonatomic, weak) UIImageView *personIconImageView;

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
    self.iconImageView = iconImageView;
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.font = [UIFont systemFontOfSize:12];
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.text = @"啊实打实大的撒大实大的撒实大的撒实大实大的撒实大的撒的撒实大的撒大大";
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UILabel *priceLabel = [[UILabel alloc] init];
    priceLabel.font = [UIFont systemFontOfSize:10];
    priceLabel.textColor = [UIColor lightGrayColor];
    priceLabel.hidden = YES;
    priceLabel.text = @"123";
    [self.contentView addSubview:priceLabel];
    self.priceLabel = priceLabel;
    
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
    self.zhongJiangNameLabel = zhongJiangNameLabel;
    
    UILabel *renCiLabel = [[UILabel alloc] init];
    renCiLabel.font = [UIFont systemFontOfSize:10];
    renCiLabel.textColor = [UIColor blackColor];
    renCiLabel.text = @"本期夺宝：20人次";
    [jieXiaoView addSubview:renCiLabel];
    self.renCiLabel = renCiLabel;
    
    UILabel *dateLabel = [[UILabel alloc] init];
    dateLabel.font = [UIFont systemFontOfSize:10];
    dateLabel.textColor = [UIColor blackColor];
    dateLabel.text = @"揭晓时间：";
    [jieXiaoView addSubview:dateLabel];
    self.dateLabel = dateLabel;
    
    UIImageView *personIconImageView = [[UIImageView alloc] init];
    personIconImageView.image = [UIImage imageNamed:@"awards_useImg_001"];
    personIconImageView.hidden = YES;
    [jieXiaoView addSubview:personIconImageView];
    self.personIconImageView = personIconImageView;
    
    iconImageView.sd_layout
    .leftSpaceToView(self.contentView,10)
    .centerYEqualToView(self.contentView)
    .widthIs(60)
    .heightIs(60);
    
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
    
    personIconImageView.sd_layout
    .rightSpaceToView(jieXiaoView,0)
    .bottomSpaceToView(jieXiaoView,0)
    .widthIs(30)
    .heightIs(30);
    
    dateLabel.sd_layout
    .leftSpaceToView(jieXiaoView,0)
    .bottomSpaceToView(jieXiaoView,0)
    .rightSpaceToView(personIconImageView,10)
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

- (void)setModel:(LQModelProductDetail *)model
{
    _model = model;
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:URLSTR([model.product.imageList firstObject])] placeholderImage:[UIImage imageNamed:@"default"]];
    self.nameLabel.text = model.product.name;
    
    [self.timeLabel reset];
    
    if ([model.status isEqualToString:@"2"])
    {
        self.timeView.hidden = NO;
        self.jieXiaoView.hidden = YES;
        
        NSDate *nowDate = [NSDate date];
        long nowTimeInterval = [NSDate timeIntervalWithDate:nowDate]*1000;
        
        long time = model.lotteryTimeLong - nowTimeInterval;
        
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
        
        self.zhongJiangNameLabel.text = model.user.name;
        self.renCiLabel.text = [NSString stringWithFormat:@"本期夺宝：%d人次",model.userCount];
        self.dateLabel.text = [NSString stringWithFormat:@"揭晓时间：%@",model.lotteryTime];
    }
}

@end

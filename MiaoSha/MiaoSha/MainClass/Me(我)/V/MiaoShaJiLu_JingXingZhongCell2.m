//
//  MiaoShaJiLu_JingXingZhongCell2.m
//  MiaoSha
//
//  Created by liqiang on 16/7/6.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "MiaoShaJiLu_JingXingZhongCell2.h"
#import "TTCounterLabel.h"

@interface MiaoShaJiLu_JingXingZhongCell2 ()

@property (nonatomic, weak) UIImageView *iconImage;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *priceLabel;
@property (strong, nonatomic) TTCounterLabel *timeLabel;
@property (nonatomic, weak) UIView *timeView;
@property (nonatomic, weak) UILabel *renCiLabel;

@end

@implementation MiaoShaJiLu_JingXingZhongCell2


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (MiaoShaJiLu_JingXingZhongCell2 *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"MiaoShaJiLu_JingXingZhongCell2";
    MiaoShaJiLu_JingXingZhongCell2 *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[MiaoShaJiLu_JingXingZhongCell2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    UIImageView *iconImage = [[UIImageView alloc] init];
    iconImage.image = [UIImage imageNamed:@"zxjx_img001"];
    [self.contentView addSubview:iconImage];
    self.iconImage = iconImage;
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.font = [UIFont systemFontOfSize:14];
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.text = @"按时大大撒实打实大";
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UILabel *priceLabel = [[UILabel alloc] init];
    priceLabel.font = [UIFont systemFontOfSize:10];
    priceLabel.textColor = [UIColor lightGrayColor];
    priceLabel.text = @"￥999999.9";
    [self.contentView addSubview:priceLabel];
    self.priceLabel = priceLabel;
    
    UILabel *renCiLabel = [[UILabel alloc] init];
    renCiLabel.font = [UIFont systemFontOfSize:10];
    renCiLabel.textColor = [UIColor lightGrayColor];
    renCiLabel.text = @"本期参与：200人次";
    [self.contentView addSubview:renCiLabel];
    self.renCiLabel = renCiLabel;
    
    UIView *timeView = [[UIView alloc] init];
    timeView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:timeView];
    self.timeView = timeView;
    
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
    
    
    iconImage.sd_layout
    .leftSpaceToView(self.contentView,10)
    .centerYEqualToView(self.contentView)
    .widthIs(75)
    .heightIs(75);
    
    nameLabel.sd_layout
    .topSpaceToView(self.contentView,10)
    .leftSpaceToView(iconImage,10)
    .rightSpaceToView(self.contentView,15)
    .autoHeightRatio(0);
    [nameLabel setMaxNumberOfLinesToShow:2];
    
    priceLabel.sd_layout
    .leftEqualToView(nameLabel)
    .topSpaceToView(nameLabel,5)
    .rightEqualToView(nameLabel)
    .autoHeightRatio(0);
    
    renCiLabel.sd_layout
    .leftEqualToView(nameLabel)
    .topSpaceToView(priceLabel,5)
    .rightEqualToView(nameLabel)
    .autoHeightRatio(0);
    
    timeView.sd_layout
    .leftEqualToView(nameLabel)
    .bottomSpaceToView(self.contentView,10)
    .rightEqualToView(nameLabel)
    .topSpaceToView(renCiLabel,10);
    
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
    
    self.timeLabel.startValue = 1468149999;
    [self.timeLabel updateApperance];
    [self.timeLabel start];
}

@end

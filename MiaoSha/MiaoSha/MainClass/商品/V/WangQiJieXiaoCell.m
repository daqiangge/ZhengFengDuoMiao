//
//  WangQiJieXiaoCell.m
//  MiaoSha
//
//  Created by liqiang on 16/7/22.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "WangQiJieXiaoCell.h"

@interface WangQiJieXiaoCell ()

@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) UILabel *zhongJiangNameLabel;
@property (nonatomic, weak) UILabel *ipLabel;
@property (nonatomic, weak) UILabel *luckNumLabel;
@property (nonatomic, weak) UILabel *renCiLabel;

@end

@implementation WangQiJieXiaoCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (WangQiJieXiaoCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"WangQiJieXiaoCell";
    WangQiJieXiaoCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[WangQiJieXiaoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.image = [UIImage imageNamed:@"default"];
    [self.contentView addSubview:iconImageView];
    
    
    UILabel *zhongJiangNameLabel = [[UILabel alloc] init];
    zhongJiangNameLabel.font = [UIFont systemFontOfSize:10];
    zhongJiangNameLabel.textColor = [UIColor blackColor];
    zhongJiangNameLabel.text = @"中奖者：王先生";
    [self.contentView addSubview:zhongJiangNameLabel];
    self.zhongJiangNameLabel = zhongJiangNameLabel;
    
    UILabel *ipLabel = [[UILabel alloc] init];
    ipLabel.font = [UIFont systemFontOfSize:10];
    ipLabel.textColor = [UIColor blackColor];
    ipLabel.text = @"用户IP：00.00.00.00";
    [self.contentView addSubview:ipLabel];
    self.ipLabel = ipLabel;
    
    UILabel *luckNumLabel = [[UILabel alloc] init];
    luckNumLabel.font = [UIFont systemFontOfSize:10];
    luckNumLabel.textColor = [UIColor blackColor];
    luckNumLabel.text = @"幸运号码：0000000";
    [self.contentView addSubview:luckNumLabel];
    self.luckNumLabel = luckNumLabel;
    
    UILabel *renCiLabel = [[UILabel alloc] init];
    renCiLabel.font = [UIFont systemFontOfSize:10];
    renCiLabel.textColor = [UIColor blackColor];
    renCiLabel.text = @"本期参与：20人次";
    [self.contentView addSubview:renCiLabel];
    self.renCiLabel = renCiLabel;
    
    iconImageView.sd_layout
    .leftSpaceToView(self.contentView,15)
    .centerYEqualToView(self.contentView)
    .heightIs(40)
    .widthIs(40);
    
    zhongJiangNameLabel.sd_layout
    .leftSpaceToView(iconImageView,10)
    .rightSpaceToView(self.contentView,10)
    .topSpaceToView(self.contentView,7)
    .heightIs(15);
    
    ipLabel.sd_layout
    .leftSpaceToView(iconImageView,10)
    .rightSpaceToView(self.contentView,10)
    .topSpaceToView(zhongJiangNameLabel,5)
    .heightIs(15);
    
    luckNumLabel.sd_layout
    .leftSpaceToView(iconImageView,10)
    .rightSpaceToView(self.contentView,5)
    .topSpaceToView(ipLabel,10)
    .heightIs(15);
    
    renCiLabel.sd_layout
    .leftSpaceToView(iconImageView,10)
    .rightSpaceToView(self.contentView,5)
    .topSpaceToView(luckNumLabel,10)
    .heightIs(15);
}


@end

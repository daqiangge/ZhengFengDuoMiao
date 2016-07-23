//
//  ZhongJiangJiLuCell.m
//  MiaoSha
//
//  Created by liqiang on 16/7/3.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ZhongJiangJiLuCell.h"

@interface ZhongJiangJiLuCell ()

@property (nonatomic, weak) UIView *jieXiaoView;

@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *priceLabel;
@property (nonatomic, weak) UILabel *zhongJiangNameLabel;
@property (nonatomic, weak) UILabel *renCiLabel;
@property (nonatomic, weak) UILabel *dateLabel;
@property (nonatomic, weak) UIImageView *personIconImageView;

@end

@implementation ZhongJiangJiLuCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (ZhongJiangJiLuCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"ZhongJiangJiLuCell";
    ZhongJiangJiLuCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[ZhongJiangJiLuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    
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
    priceLabel.text = @"￥999999.9";
    priceLabel.hidden = YES;
    [self.contentView addSubview:priceLabel];
    self.priceLabel = priceLabel;
    
    UIView *jieXiaoView = [[UIView alloc] init];
    jieXiaoView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:jieXiaoView];
    self.jieXiaoView = jieXiaoView;
    
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
    dateLabel.text = @"揭晓时间：1分钟前";
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
    
    jieXiaoView.sd_layout
    .leftEqualToView(nameLabel)
    .bottomSpaceToView(self.contentView,10)
    .rightEqualToView(nameLabel)
    .topSpaceToView(priceLabel,10);
    
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
    
    [self addUnderlineWithLeftMargin:0];
    
}

- (void)setModel:(LQModelProductDetail *)model
{
    _model = model;
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:URLSTR([model.product.imageList firstObject])] placeholderImage:[UIImage imageNamed:@"default"]];
    self.nameLabel.text = model.product.name;
    self.zhongJiangNameLabel.text = [NSString stringWithFormat:@"中奖者：%@",[LQModelMember sharedMemberMySelf].name.length?[LQModelMember sharedMemberMySelf].name:[LQModelMember sharedMemberMySelf].loginName];
    self.renCiLabel.text = [NSString stringWithFormat:@"本期夺宝：%d人次",model.userCount];
    self.dateLabel.text = [NSString stringWithFormat:@"揭晓时间：%@",model.lotteryTime];
}

@end

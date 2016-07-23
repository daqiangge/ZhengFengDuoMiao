//
//  ProductDetailsCell4.m
//  MiaoSha
//
//  Created by liqiang on 16/7/3.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ProductDetailsCell4.h"

@interface ProductDetailsCell4 ()

@property (nonatomic, weak) UIImageView *personIconImageView;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *IdLabel;
@property (nonatomic, weak) UILabel *qiShuLabel;
@property (nonatomic, weak) UILabel *canYuRenCiLabel;
@property (nonatomic, weak) UILabel *dateLabel;
@property (nonatomic, weak) UILabel *xinYunHaoLabel;

@end

@implementation ProductDetailsCell4


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (ProductDetailsCell4 *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"ProductDetailsCell4";
    ProductDetailsCell4 *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[ProductDetailsCell4 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    UIImageView *bgImageView = [[UIImageView alloc] init];
    bgImageView.image = [UIImage imageNamed:@"XQ_sxjxBg"];
    [self.contentView addSubview:bgImageView];
    
    UIImageView *imageView1 = [[UIImageView alloc] init];
    imageView1.image = [UIImage imageNamed:@"XQ_ic_sqjx"];
    [self.contentView addSubview:imageView1];
    
    UIImageView *personIconImageView = [[UIImageView alloc] init];
    personIconImageView.image = [UIImage imageNamed:@"awards_useImg_001"];
    [self.contentView addSubview:personIconImageView];
    self.personIconImageView = personIconImageView;
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.font = [UIFont systemFontOfSize:11];
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.text = @"获奖者：张三";
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UILabel *IdLabel = [[UILabel alloc] init];
    IdLabel.font = [UIFont systemFontOfSize:11];
    IdLabel.textColor = [UIColor blackColor];
    IdLabel.text = @"用户ID：211.11.11.111（河北衡水）";
    [self.contentView addSubview:IdLabel];
    self.IdLabel = IdLabel;
    
    UILabel *qiShuLabel = [[UILabel alloc] init];
    qiShuLabel.font = [UIFont systemFontOfSize:11];
    qiShuLabel.textColor = [UIColor blackColor];
    qiShuLabel.text = @"商品期数：20102020";
    [self.contentView addSubview:qiShuLabel];
    self.qiShuLabel = qiShuLabel;
    
    UILabel *canYuRenCiLabel = [[UILabel alloc] init];
    canYuRenCiLabel.font = [UIFont systemFontOfSize:11];
    canYuRenCiLabel.textColor = [UIColor blackColor];
    canYuRenCiLabel.text = @"本期参与：200人次";
    [self.contentView addSubview:canYuRenCiLabel];
    self.canYuRenCiLabel = canYuRenCiLabel;
    
    UILabel *dateLabel = [[UILabel alloc] init];
    dateLabel.font = [UIFont systemFontOfSize:11];
    dateLabel.textColor = [UIColor blackColor];
    dateLabel.text = @"揭晓时间：2014-22-22 10:11:11";
    [self.contentView addSubview:dateLabel];
    self.dateLabel = dateLabel;
    
    UILabel *xinYunHaoLabel = [[UILabel alloc] init];
    xinYunHaoLabel.font = [UIFont systemFontOfSize:11];
    xinYunHaoLabel.textColor = [UIColor blackColor];
    xinYunHaoLabel.text = @"幸运号：2323141451515";
    [self.contentView addSubview:xinYunHaoLabel];
    self.xinYunHaoLabel = xinYunHaoLabel;
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:@"计算详情" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    btn.backgroundColor = [UIColor colorWithRed:0.992 green:0.953 blue:0.765 alpha:1.00];
    btn.layer.cornerRadius = 3;
    [self.contentView addSubview:btn];
    
    bgImageView.sd_layout
    .leftSpaceToView(self.contentView,0)
    .rightSpaceToView(self.contentView,0)
    .topSpaceToView(self.contentView,0)
    .bottomSpaceToView(self.contentView,0);
    
    imageView1.sd_layout
    .leftSpaceToView(self.contentView,10)
    .topSpaceToView(self.contentView,10)
    .heightIs(78)
    .widthIs(32);
    
    personIconImageView.sd_layout
    .leftSpaceToView(imageView1,10)
    .topEqualToView(imageView1)
    .heightIs(35)
    .widthIs(35);
    
    nameLabel.sd_layout
    .leftSpaceToView(personIconImageView,10)
    .rightSpaceToView(self.contentView,10)
    .topEqualToView(personIconImageView)
    .heightIs(13);
    
    IdLabel.sd_layout
    .leftEqualToView(nameLabel)
    .rightEqualToView(nameLabel)
    .topSpaceToView(nameLabel,5)
    .heightIs(13);
    
    qiShuLabel.sd_layout
    .leftEqualToView(nameLabel)
    .rightEqualToView(nameLabel)
    .topSpaceToView(IdLabel,5)
    .heightIs(13);
    
    canYuRenCiLabel.sd_layout
    .leftEqualToView(nameLabel)
    .rightEqualToView(nameLabel)
    .topSpaceToView(qiShuLabel,5)
    .heightIs(13);
    
    dateLabel.sd_layout
    .leftEqualToView(nameLabel)
    .rightEqualToView(nameLabel)
    .topSpaceToView(canYuRenCiLabel,5)
    .heightIs(13);
    
    xinYunHaoLabel.sd_layout
    .leftEqualToView(imageView1)
    .bottomSpaceToView(self.contentView,0)
    .heightIs(29)
    .widthIs(200);
    
    btn.sd_layout
    .rightSpaceToView(self.contentView,10)
    .centerYEqualToView(xinYunHaoLabel)
    .heightIs(20)
    .widthIs(80);
}

- (void)setModel:(LQModelProductDetail *)model
{
    _model = model;
    
    if ([self.model.status isEqualToString:@"0"])
    {
        [self.personIconImageView sd_setImageWithURL:[NSURL URLWithString:URLSTR(model.lastUser.appPhoto)] placeholderImage:[UIImage imageNamed:@"awards_useImg_001"]];
        self.nameLabel.text = model.lastUser.name;
        self.IdLabel.text = [NSString stringWithFormat:@"用户ID：%@",model.lastIp];
        self.qiShuLabel.text = [NSString stringWithFormat:@"商品期数：%@",model.lastNumber];
        self.canYuRenCiLabel.text = [NSString stringWithFormat:@"本期参与：%d人次",model.lastUserCount];
        self.xinYunHaoLabel.text = [NSString stringWithFormat:@"幸运号：%@",model.lastOrderDetail.number];
    }
    
    if ([self.model.status isEqualToString:@"1"])
    {
        [self.personIconImageView sd_setImageWithURL:[NSURL URLWithString:URLSTR(model.user.appPhoto)] placeholderImage:[UIImage imageNamed:@"awards_useImg_001"]];
        self.nameLabel.text = model.user.name;
        self.IdLabel.text = [NSString stringWithFormat:@"用户ID：%@",model.ip];
        self.qiShuLabel.text = [NSString stringWithFormat:@"商品期数：%@",model.number];
        self.canYuRenCiLabel.text = [NSString stringWithFormat:@"本期参与：%d人次",model.userCount];
        self.xinYunHaoLabel.text = [NSString stringWithFormat:@"幸运号：%@",model.orderDetail.number];
        
    }
    
    if ([self.model.status isEqualToString:@"2"])
    {
        [self.personIconImageView sd_setImageWithURL:[NSURL URLWithString:URLSTR(model.lastUser.appPhoto)] placeholderImage:[UIImage imageNamed:@"awards_useImg_001"]];
        self.nameLabel.text = model.lastUser.name;
        self.IdLabel.text = [NSString stringWithFormat:@"用户ID：%@",model.lastIp];
        self.qiShuLabel.text = [NSString stringWithFormat:@"商品期数：%@",model.lastNumber];
        self.canYuRenCiLabel.text = [NSString stringWithFormat:@"本期参与：%d人次",model.lastUserCount];
        self.xinYunHaoLabel.text = [NSString stringWithFormat:@"幸运号：%@",model.lastOrderDetail.number];
    }
    
}

@end

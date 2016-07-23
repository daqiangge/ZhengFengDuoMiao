//
//  MiaoShaJiLu_JingXingZhongCell.m
//  MiaoSha
//
//  Created by liqiang on 16/7/3.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "MiaoShaJiLu_JingXingZhongCell.h"

@interface MiaoShaJiLu_JingXingZhongCell ()

@property (nonatomic, weak) UIImageView *iconImage;
@property (nonatomic, weak) UIProgressView *processView;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *qiShuLabel;
@property (nonatomic, weak) UILabel *zongRenCiLabel;
@property (nonatomic, weak) UILabel *shengYuRenCiLabel;
@property (nonatomic, weak) UILabel *canYuRenCiLabel;

@end

@implementation MiaoShaJiLu_JingXingZhongCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (MiaoShaJiLu_JingXingZhongCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"MiaoShaJiLu_JingXingZhongCell";
    MiaoShaJiLu_JingXingZhongCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[MiaoShaJiLu_JingXingZhongCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    
    UILabel *qiShuLabel = [[UILabel alloc] init];
    qiShuLabel.font = [UIFont systemFontOfSize:10];
    qiShuLabel.textColor = [UIColor grayColor];
    qiShuLabel.text = @"商品期数：20121212";
    [self.contentView addSubview:qiShuLabel];
    self.qiShuLabel = qiShuLabel;
    
    UIProgressView *processView = [[UIProgressView alloc] init];
    processView.trackTintColor = [UIColor lightGrayColor];
    processView.progressTintColor = [UIColor colorWithRed:0.980 green:0.043 blue:0.482 alpha:1.00];
    processView.progress = 0.8;
    [self.contentView addSubview:processView];
    self.processView = processView;
    
    UILabel *zongRenCiLabel = [[UILabel alloc] init];
    zongRenCiLabel.font = [UIFont systemFontOfSize:10];
    zongRenCiLabel.textColor = [UIColor grayColor];
    zongRenCiLabel.text = @"总需88888人次";
    [self.contentView addSubview:zongRenCiLabel];
    self.zongRenCiLabel = zongRenCiLabel;
    
    UILabel *shengYuRenCiLabel = [[UILabel alloc] init];
    shengYuRenCiLabel.font = [UIFont systemFontOfSize:10];
    shengYuRenCiLabel.textColor = [UIColor grayColor];
    shengYuRenCiLabel.text = @"剩余88888人次";
    shengYuRenCiLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:shengYuRenCiLabel];
    self.shengYuRenCiLabel = shengYuRenCiLabel;
    
    UILabel *canYuRenCiLabel = [[UILabel alloc] init];
    canYuRenCiLabel.font = [UIFont systemFontOfSize:10];;
    canYuRenCiLabel.textColor =  [UIColor grayColor];;
    canYuRenCiLabel.text = @"本次参与：20人次";
    [self.contentView addSubview:canYuRenCiLabel];
    self.canYuRenCiLabel = canYuRenCiLabel;
    
    iconImage.sd_layout
    .leftSpaceToView(self.contentView,10)
    .centerYEqualToView(self.contentView)
    .widthIs(60)
    .heightIs(60);
    
    nameLabel.sd_layout
    .topSpaceToView(self.contentView,10)
    .leftSpaceToView(iconImage,10)
    .rightSpaceToView(self.contentView,15)
    .autoHeightRatio(0);
    [nameLabel setMaxNumberOfLinesToShow:2];
    
    qiShuLabel.sd_layout
    .leftEqualToView(nameLabel)
    .topSpaceToView(nameLabel,10)
    .widthIs(200)
    .autoHeightRatio(0);
    
    processView.sd_layout
    .leftEqualToView(qiShuLabel)
    .topSpaceToView(qiShuLabel,5)
    .rightSpaceToView(self.contentView,10)
    .heightIs(15);
    
    zongRenCiLabel.sd_layout
    .leftEqualToView(qiShuLabel)
    .topSpaceToView(processView,5)
    .widthIs(150)
    .heightIs(15);
    
    shengYuRenCiLabel.sd_layout
    .rightEqualToView(processView)
    .topSpaceToView(processView,5)
    .widthIs(150)
    .heightIs(15);
    
    canYuRenCiLabel.sd_layout
    .leftEqualToView(zongRenCiLabel)
    .topSpaceToView(zongRenCiLabel,5)
    .widthIs(150)
    .heightIs(15);
    
    [self setupAutoHeightWithBottomView:self.canYuRenCiLabel bottomMargin:20];
}

- (void)setModel:(LQModelProductDetail *)model
{
    _model = model;
    
    self.nameLabel.text = model.period.product.name;
    self.qiShuLabel.text = [NSString stringWithFormat:@"期数：%@",model.period.number];
    self.zongRenCiLabel.text = [NSString stringWithFormat:@"总需%d人次",model.period.allCount];
    self.shengYuRenCiLabel.text = [NSString stringWithFormat:@"剩余%d人次",model.period.allCount - model.period.currentCount];
    self.processView.progress = model.period.currentCount*1.00/model.period.allCount;
    self.canYuRenCiLabel.text = [NSString stringWithFormat:@"本次参与：%d人次",model.count];
    
    [self setupAutoHeightWithBottomView:self.canYuRenCiLabel bottomMargin:20];
}

@end

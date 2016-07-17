//
//  ShopCarListCell.m
//  MiaoSha
//
//  Created by liqiang on 16/7/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ShopCarListCell.h"
#import "AddNumView.h"

@interface ShopCarListCell ()

@property (nonatomic, weak) UIImageView *iconImageView;

@end

@implementation ShopCarListCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (ShopCarListCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"ShopCarListCell";
    ShopCarListCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[ShopCarListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.image = [UIImage imageNamed:@"home_zxjx-img001"];
    [self.contentView addSubview:iconImageView];
    self.iconImageView = iconImageView;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.text = @"按时打算打算打打大道上大大说";
    [self.contentView addSubview:titleLabel];
    
    UILabel *zongXuRenCiLabel = [[UILabel alloc] init];
    zongXuRenCiLabel.font = [UIFont systemFontOfSize:12];
    zongXuRenCiLabel.textColor = [UIColor grayColor];
    zongXuRenCiLabel.text = @"总需5000人次，剩余1000人次";
    [self.contentView addSubview:zongXuRenCiLabel];
    
    AddNumView *addNumView = [[AddNumView alloc] init];
    addNumView.numInteger = 1;
    [self.contentView addSubview:addNumView];
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [UIColor grayColor];
    label.text = @"奖品最新一期火速进行中";
    [self.contentView addSubview:label];
    
    iconImageView.sd_layout
    .leftSpaceToView(self.contentView,10)
    .centerYEqualToView(self.contentView)
    .widthIs(70)
    .heightIs(70);
    
    titleLabel.sd_layout
    .leftSpaceToView(iconImageView,10)
    .rightSpaceToView(self.contentView,10)
    .topSpaceToView(self.contentView,10)
    .autoHeightRatio(0);
    
    zongXuRenCiLabel.sd_layout
    .leftSpaceToView(iconImageView,10)
    .rightSpaceToView(self.contentView,10)
    .topSpaceToView(titleLabel,10)
    .autoHeightRatio(0);
    
    addNumView.sd_layout
    .leftSpaceToView(iconImageView,10)
    .topSpaceToView(zongXuRenCiLabel,10)
    .widthIs(120)
    .heightIs(35);
    
    label.sd_layout
    .leftSpaceToView(iconImageView,10)
    .rightSpaceToView(self.contentView,10)
    .topSpaceToView(addNumView,10)
    .autoHeightRatio(0);

    [self addUnderlineWithLeftMargin:0];
}

@end

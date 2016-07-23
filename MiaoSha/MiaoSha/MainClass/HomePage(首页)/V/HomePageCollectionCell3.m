//
//  HomePageCollectionCell3.m
//  MiaoSha
//
//  Created by liqiang on 16/6/20.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "HomePageCollectionCell3.h"

@interface HomePageCollectionCell3 ()

@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) UILabel *goodsName;
@property (nonatomic, weak) UILabel *zhongJiangNameLabel;

@end

@implementation HomePageCollectionCell3

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        [self drawView];
    }
    
    return self;
}

- (void)drawView
{
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.image = [UIImage imageNamed:@"home_zxjx-img001"];
    [self.contentView addSubview:iconImageView];
    self.iconImageView = iconImageView;
    
    UILabel *goodsName = [[UILabel alloc] init];
    goodsName.font = [UIFont systemFontOfSize:12];
    goodsName.textColor = [UIColor blackColor];
    goodsName.text = @"计凯斯是多大阿萨德擦擦擦";
    [self.contentView addSubview:goodsName];
    self.goodsName = goodsName;
    
    UILabel *zhongJiangLabel = [[UILabel alloc] init];
    zhongJiangLabel.font = [UIFont systemFontOfSize:12];
    zhongJiangLabel.textColor = [UIColor whiteColor];
    zhongJiangLabel.text = @"中奖";
    zhongJiangLabel.textAlignment = NSTextAlignmentCenter;
    zhongJiangLabel.backgroundColor = [UIColor colorWithRed:0.988 green:0.820 blue:0.188 alpha:1.00];
    [self.contentView addSubview:zhongJiangLabel];
    
    UILabel *zhongJiangNameLabel = [[UILabel alloc] init];
    zhongJiangNameLabel.font = [UIFont systemFontOfSize:12];
    zhongJiangNameLabel.textColor = [UIColor grayColor];
    zhongJiangNameLabel.text = @"中奖者名称";
    [self.contentView addSubview:zhongJiangNameLabel];
    self.zhongJiangNameLabel = zhongJiangNameLabel;
    
    UIView *leftLineView = [[UIView alloc] init];
    leftLineView.backgroundColor = [UIColor colorWithRed:0.906 green:0.910 blue:0.914 alpha:1.00];
    [self.contentView addSubview:leftLineView];
    
    iconImageView.sd_layout
    .centerXEqualToView(self.contentView)
    .topSpaceToView(self.contentView,10)
    .widthIs(80)
    .heightIs(62.5);
    
    goodsName.sd_layout
    .topSpaceToView(iconImageView,3)
    .leftSpaceToView(self.contentView,5)
    .heightIs(15)
    .rightSpaceToView(self.contentView,5);
    
    zhongJiangLabel.sd_layout
    .topSpaceToView(goodsName,3)
    .leftSpaceToView(self.contentView,5)
    .heightIs(15)
    .widthIs(30);
    
    zhongJiangNameLabel.sd_layout
    .topEqualToView(zhongJiangLabel)
    .leftSpaceToView(zhongJiangLabel,3)
    .rightEqualToView(goodsName)
    .heightIs(15);
    
    leftLineView.sd_layout
    .leftSpaceToView(self.contentView,0)
    .centerYEqualToView(self.contentView)
    .widthIs(1)
    .heightIs(100);
    
}

- (void)setModel:(LQModelProductDetail *)model
{
    _model = model;
    NSLog(@"--->%@",URLSTR(model.product.image));
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:URLSTR([model.product.imageList firstObject])] placeholderImage:[UIImage imageNamed:@"default"]];
    self.goodsName.text = model.product.name;
    self.zhongJiangNameLabel.text = model.user.name;
}

@end

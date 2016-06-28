//
//  HomePageCollectionCell5.m
//  MiaoSha
//
//  Created by liqiang on 16/6/20.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "HomePageCollectionCell5.h"

@interface HomePageCollectionCell5 ()

@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) UILabel *goodsName;

@end

@implementation HomePageCollectionCell5

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
    
    iconImageView.sd_layout
    .centerXEqualToView(self.contentView)
    .topSpaceToView(self.contentView,10)
    .leftSpaceToView(self.contentView,10)
    .heightEqualToWidth(3/4);
    
    goodsName.sd_layout
    .topSpaceToView(iconImageView,3)
    .leftEqualToView(iconImageView)
    .rightEqualToView(iconImageView)
    .heightIs(15);
    
    [self setupAutoHeightWithBottomView:goodsName bottomMargin:10];
}

- (void)setModel:(LQModel *)model
{
    _model = model;
    
    [self setupAutoHeightWithBottomView:self.goodsName bottomMargin:10];
}

@end

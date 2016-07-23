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
@property (nonatomic, weak) UILabel *jinDuLabel;
@property (nonatomic, weak) UIProgressView *processView;

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
    
    UILabel *jinDuLabel = [[UILabel alloc] init];
    jinDuLabel.font = [UIFont systemFontOfSize:12];
    jinDuLabel.textColor = [UIColor blackColor];
    jinDuLabel.text = @"开奖进度:98%";
    [self.contentView addSubview:jinDuLabel];
    self.jinDuLabel = jinDuLabel;
    
    UIProgressView *processView = [[UIProgressView alloc] init];
    processView.trackTintColor = [UIColor lightGrayColor];
    processView.progressTintColor = [UIColor colorWithRed:0.980 green:0.043 blue:0.482 alpha:1.00];
    processView.progress = 0.8;
    [self.contentView addSubview:processView];
    self.processView = processView;
    
    UIButton *addShoppingCartBtn = [[UIButton alloc] init];
    [addShoppingCartBtn setTitle:@"加入清单" forState:UIControlStateNormal];
    [addShoppingCartBtn setTitleColor:[UIColor colorWithRed:0.980 green:0.043 blue:0.482 alpha:1.00] forState:UIControlStateNormal];
    addShoppingCartBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    addShoppingCartBtn.backgroundColor = [UIColor whiteColor];
    addShoppingCartBtn.layer.borderColor = [UIColor colorWithRed:0.980 green:0.043 blue:0.482 alpha:1.00].CGColor;
    addShoppingCartBtn.layer.borderWidth = 0.5;
    addShoppingCartBtn.layer.cornerRadius = 4;
    [self.contentView addSubview:addShoppingCartBtn];
    
    iconImageView.sd_layout
    .centerXEqualToView(self.contentView)
    .topSpaceToView(self.contentView,10)
    .widthIs(80)
    .heightIs(80);
    
    goodsName.sd_layout
    .topSpaceToView(iconImageView,5)
    .leftSpaceToView(self.contentView,5)
    .heightIs(15)
    .rightSpaceToView(self.contentView,5);
    
    addShoppingCartBtn.sd_layout
    .topSpaceToView(goodsName,8)
    .rightEqualToView(goodsName)
    .heightIs(20)
    .widthIs(60);
    
    jinDuLabel.sd_layout
    .topSpaceToView(goodsName,5)
    .leftSpaceToView(self.contentView,5)
    .heightIs(15)
    .rightSpaceToView(addShoppingCartBtn,5);
    
    processView.sd_layout
    .topSpaceToView(jinDuLabel,5)
    .leftSpaceToView(self.contentView,5)
    .heightIs(15)
    .rightSpaceToView(addShoppingCartBtn,5);
    
}

- (void)setModel:(LQModelProductDetail *)model
{
    _model = model;
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:URLSTR([model.product.imageList firstObject])] placeholderImage:[UIImage imageNamed:@"default"]];
    self.goodsName.text = model.product.name;
    
    float jingdu = model.currentCount*1.00/model.allCount;
    
    NSLog(@"---->%d",model.currentCount);
    
    self.jinDuLabel.text = [NSString stringWithFormat:@"开奖进度:%.0f%%",jingdu*100];
    self.processView.progress = jingdu;
}


@end

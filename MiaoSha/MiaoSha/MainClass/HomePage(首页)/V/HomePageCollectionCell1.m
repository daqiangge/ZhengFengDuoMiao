//
//  HomePageCollectionCell1.m
//  MiaoSha
//
//  Created by liqiang on 16/6/20.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "HomePageCollectionCell1.h"
#import "LQTouTiaoView.h"

@interface HomePageCollectionCell1 ()

@property (nonatomic, weak) LQTouTiaoView *totiaoView;

@end

@implementation HomePageCollectionCell1

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
    iconImageView.image = [UIImage imageNamed:@"ic_speaker"];
    [self.contentView addSubview:iconImageView];
    
    LQTouTiaoView *totiaoView = [[LQTouTiaoView alloc] initWithFrame:CGRectMake(20, 0, ScreenWidth - 100, 30)];
    [self.contentView addSubview:totiaoView];
    self.totiaoView = totiaoView;
    
//    UILabel *label = [[UILabel alloc] init];
//    label.font = [UIFont systemFontOfSize:12];
//    label.textColor = [UIColor grayColor];
//    label.text = @"恭喜王先生获得了秒杀王的称号";
//    [self.contentView addSubview:label];
    
    UILabel *moreLabel = [[UILabel alloc] init];
    moreLabel.font = [UIFont systemFontOfSize:12];
    moreLabel.textColor = [UIColor grayColor];
    moreLabel.text = @"更多";
    moreLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:moreLabel];
    
    UIImageView *arrowImageView = [[UIImageView alloc] init];
    arrowImageView.image = [UIImage imageNamed:@"arrow_right_grey"];
    [self.contentView addSubview:arrowImageView];
    
    iconImageView.sd_layout
    .leftSpaceToView(self.contentView,10)
    .centerYEqualToView(self.contentView)
    .heightIs(12.5)
    .widthIs(12.5);
    
    arrowImageView.sd_layout
    .rightSpaceToView(self.contentView,10)
    .centerYEqualToView(self.contentView)
    .heightIs(12)
    .widthIs(12);
    
    moreLabel.sd_layout
    .rightSpaceToView(arrowImageView,5)
    .topEqualToView(self.contentView)
    .bottomEqualToView(self.contentView)
    .widthIs(50);
    
//    label.sd_layout
//    .leftSpaceToView(iconImageView,10)
//    .topEqualToView(self.contentView)
//    .bottomEqualToView(self.contentView)
//    .rightSpaceToView(moreLabel,5);
}

- (void)setTitleArray:(NSMutableArray *)titleArray
{
    _titleArray = titleArray;
    
    self.totiaoView.titleArray = titleArray;
}

@end

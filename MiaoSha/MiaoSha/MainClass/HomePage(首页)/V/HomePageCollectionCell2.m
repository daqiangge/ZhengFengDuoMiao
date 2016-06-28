//
//  HomePageCollectionCell2.m
//  MiaoSha
//
//  Created by liqiang on 16/6/20.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "HomePageCollectionCell2.h"

@implementation HomePageCollectionCell2

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
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor blackColor];
    label.text = @"最新揭晓";
    [self.contentView addSubview:label];
    
    UILabel *moreLabel = [[UILabel alloc] init];
    moreLabel.font = [UIFont systemFontOfSize:12];
    moreLabel.textColor = [UIColor grayColor];
    moreLabel.text = @"更多";
    moreLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:moreLabel];
    
    UIImageView *arrowImageView = [[UIImageView alloc] init];
    arrowImageView.image = [UIImage imageNamed:@"arrow_right_grey"];
    [self.contentView addSubview:arrowImageView];
    
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
    
    label.sd_layout
    .leftSpaceToView(self.contentView,10)
    .topEqualToView(self.contentView)
    .bottomEqualToView(self.contentView)
    .rightSpaceToView(moreLabel,5);
}

@end

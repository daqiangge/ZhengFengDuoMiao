//
//  RankingListCell.m
//  MiaoSha
//
//  Created by liqiang on 16/6/2.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "RankingListCell.h"

@interface RankingListCell ()

@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) UILabel *nameLabel;

@end

@implementation RankingListCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (RankingListCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"RankingListCell";
    RankingListCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[RankingListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    UIImageView *rankingNumImageView = [[UIImageView alloc] init];
    rankingNumImageView.image = [UIImage imageNamed:@"PHB_ic_one"];
    rankingNumImageView.clipsToBounds = NO;
    [rankingNumImageView setContentScaleFactor:[[UIScreen mainScreen] scale]];
    rankingNumImageView.contentMode =  UIViewContentModeScaleAspectFit;
    rankingNumImageView.autoresizingMask = UIViewAutoresizingNone;
    [self.contentView addSubview:rankingNumImageView];
    self.rankingNumImageView = rankingNumImageView;
    
    UILabel *numlabel = [[UILabel alloc] init];
    numlabel.font = [UIFont systemFontOfSize:10];
    numlabel.textColor = [UIColor colorWithRed:0.263 green:0.549 blue:0.604 alpha:1.00];
    numlabel.text = @"53";
    numlabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:numlabel];
    self.numlabel = numlabel;
    
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.image = [UIImage imageNamed:@"PHB_userImg001"];
    iconImageView.clipsToBounds = NO;
    [iconImageView setContentScaleFactor:[[UIScreen mainScreen] scale]];
    iconImageView.contentMode =  UIViewContentModeScaleAspectFit;
    iconImageView.autoresizingMask = UIViewAutoresizingNone;
    [self.contentView addSubview:iconImageView];
    self.iconImageView = iconImageView;
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.font = [UIFont systemFontOfSize:14];
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.text = @"张先生充值9999999999元";
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    rankingNumImageView.sd_layout
    .leftSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,5)
    .bottomSpaceToView(self.contentView,5)
    .widthEqualToHeight();
    
    iconImageView.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView,55)
    .widthIs(25)
    .heightIs(25);
    
    nameLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(iconImageView,5)
    .rightSpaceToView(self.contentView,15)
    .heightIs(25);
}

- (void)setImageViewName:(NSString *)imageViewName
{
    _imageViewName = imageViewName;
    
    self.rankingNumImageView.image = [UIImage imageNamed:imageViewName];
    if ([imageViewName isEqualToString:@"PHB_ic_numberBg"])
    {
        self.numlabel.hidden = NO;
        
        self.rankingNumImageView.sd_layout
        .leftSpaceToView(self.contentView,18)
        .topSpaceToView(self.contentView,8)
        .bottomSpaceToView(self.contentView,8)
        .widthEqualToHeight();
        
        self.numlabel.sd_layout
        .leftSpaceToView(self.contentView,18)
        .topSpaceToView(self.contentView,8)
        .bottomSpaceToView(self.contentView,8)
        .widthEqualToHeight();
    }
    else
    {
        self.numlabel.hidden = YES;
        
        self.rankingNumImageView.sd_layout
        .leftSpaceToView(self.contentView,15)
        .topSpaceToView(self.contentView,5)
        .bottomSpaceToView(self.contentView,5)
        .widthEqualToHeight();
    }
}

@end

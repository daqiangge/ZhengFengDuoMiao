//
//  RankingListCell.m
//  MiaoSha
//
//  Created by liqiang on 16/6/2.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "RankingListCell.h"

@interface RankingListCell ()

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
    
    rankingNumImageView.sd_layout
    .leftSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,5)
    .bottomSpaceToView(self.contentView,5)
    .widthEqualToHeight();
}

@end

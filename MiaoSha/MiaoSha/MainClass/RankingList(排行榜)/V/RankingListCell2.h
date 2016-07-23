//
//  RankingListCell2.h
//  MiaoSha
//
//  Created by liqiang on 16/6/13.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RankingListCell2 : UITableViewCell

@property (nonatomic, weak) UIImageView *rankingNumImageView;

@property (nonatomic, copy) NSString *imageViewName;
@property (nonatomic, weak) UILabel *numlabel;
@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) UILabel *nameLabel;

+ (RankingListCell2 *)cellWithTableView:(UITableView *)tableView;

@end

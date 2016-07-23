//
//  RankingListCell.h
//  MiaoSha
//
//  Created by liqiang on 16/6/2.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RankingListCell : UITableViewCell

@property (nonatomic, weak) UIImageView *rankingNumImageView;
@property (nonatomic, weak) UILabel *numlabel ;

@property (nonatomic, copy) NSString *imageViewName;
@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) UILabel *nameLabel;

+ (RankingListCell *)cellWithTableView:(UITableView *)tableView;

@end

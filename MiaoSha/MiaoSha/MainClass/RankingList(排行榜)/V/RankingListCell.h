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

+ (RankingListCell *)cellWithTableView:(UITableView *)tableView;

@end

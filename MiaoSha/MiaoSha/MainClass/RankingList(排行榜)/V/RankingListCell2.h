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
@property (nonatomic, weak) UILabel *numlabel ;

@property (nonatomic, copy) NSString *imageViewName;

+ (RankingListCell2 *)cellWithTableView:(UITableView *)tableView;

@end

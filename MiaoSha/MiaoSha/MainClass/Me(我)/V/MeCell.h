//
//  MeCell.h
//  MiaoSha
//
//  Created by liqiang on 16/5/24.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeCell : UITableViewCell

@property (nonatomic, weak) UIImageView *iconImageView ;
@property (nonatomic, weak) UILabel *label;
@property (nonatomic, weak) UILabel *detailLabel;

+ (MeCell *)cellWithTableView:(UITableView *)tableView;

@end

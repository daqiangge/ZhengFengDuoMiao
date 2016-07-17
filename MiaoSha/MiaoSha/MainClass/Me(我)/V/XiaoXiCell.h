//
//  XiaoXiCell.h
//  MiaoSha
//
//  Created by liqiang on 16/7/6.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XiaoXiCell : UITableViewCell

@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) UILabel *label1;
@property (nonatomic, weak) UILabel *label2;
@property (nonatomic, weak) UILabel *dateLabel;

+ (XiaoXiCell *)cellWithTableView:(UITableView *)tableView;

@end

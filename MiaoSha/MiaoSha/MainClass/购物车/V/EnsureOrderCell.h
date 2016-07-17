//
//  EnsureOrderCell.h
//  MiaoSha
//
//  Created by liqiang on 16/7/16.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EnsureOrderCell : UITableViewCell

@property (nonatomic, weak) UILabel *label1;
@property (nonatomic, weak) UILabel *label2;

+ (EnsureOrderCell *)cellWithTableView:(UITableView *)tableView;

@end

//
//  ShowOrderCell.h
//  MiaoSha
//
//  Created by liqiang on 16/6/13.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowOrderCell : UITableViewCell

@property (nonatomic, strong) LQModelShare *model;

+ (ShowOrderCell *)cellWithTableView:(UITableView *)tableView;

@end

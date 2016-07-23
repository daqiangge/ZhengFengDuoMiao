//
//  ZhongJiangJiLuCell.h
//  MiaoSha
//
//  Created by liqiang on 16/7/3.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZhongJiangJiLuCell : UITableViewCell

@property (nonatomic, strong) LQModelProductDetail *model;

+ (ZhongJiangJiLuCell *)cellWithTableView:(UITableView *)tableView;

@end

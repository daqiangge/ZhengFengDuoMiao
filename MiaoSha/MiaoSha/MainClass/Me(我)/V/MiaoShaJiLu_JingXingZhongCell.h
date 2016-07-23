//
//  MiaoShaJiLu_JingXingZhongCell.h
//  MiaoSha
//
//  Created by liqiang on 16/7/3.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MiaoShaJiLu_JingXingZhongCell : UITableViewCell

@property (nonatomic, strong) LQModelProductDetail *model;

+ (MiaoShaJiLu_JingXingZhongCell *)cellWithTableView:(UITableView *)tableView;

@end

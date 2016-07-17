//
//  BianJiDiZhiCell.h
//  MiaoSha
//
//  Created by liqiang on 16/7/6.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelAddress.h"

@interface BianJiDiZhiCell : UITableViewCell

@property (nonatomic, weak) UILabel *label;
@property (nonatomic, weak) UILabel *label2;
@property (nonatomic, weak) UIImageView *arrowImageView;

@property (nonatomic, strong) ModelAddress *model;

+ (BianJiDiZhiCell *)cellWithTableView:(UITableView *)tableView;

@end

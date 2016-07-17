//
//  GuanLiShouHuoDiZhiListCell.h
//  MiaoSha
//
//  Created by liqiang on 16/7/10.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelAddress.h"

@interface GuanLiShouHuoDiZhiListCell : UITableViewCell

@property (nonatomic, strong) ModelAddress *model;

+ (GuanLiShouHuoDiZhiListCell *)cellWithTableView:(UITableView *)tableView;

@end

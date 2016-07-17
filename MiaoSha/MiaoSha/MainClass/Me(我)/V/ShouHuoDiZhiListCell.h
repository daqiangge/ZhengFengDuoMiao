//
//  ShouHuoDiZhiListCell.h
//  MiaoSha
//
//  Created by liqiang on 16/7/6.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelAddress.h"

@interface ShouHuoDiZhiListCell : UITableViewCell

@property (nonatomic, strong) ModelAddress *model;

+ (ShouHuoDiZhiListCell *)cellWithTableView:(UITableView *)tableView;

@end

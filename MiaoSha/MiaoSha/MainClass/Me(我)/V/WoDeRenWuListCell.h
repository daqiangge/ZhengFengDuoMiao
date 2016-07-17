//
//  WoDeRenWuListCell.h
//  MiaoSha
//
//  Created by liqiang on 16/7/6.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelWoDeRenWu.h"

@interface WoDeRenWuListCell : UITableViewCell

@property (nonatomic, weak) ModelWoDeRenWu *model;

+ (WoDeRenWuListCell *)cellWithTableView:(UITableView *)tableView;

@end

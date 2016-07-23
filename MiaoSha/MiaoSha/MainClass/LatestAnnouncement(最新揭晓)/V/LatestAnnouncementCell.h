//
//  LatestAnnouncementCell.h
//  MiaoSha
//
//  Created by liqiang on 16/6/14.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LatestAnnouncementCell : UITableViewCell

@property (nonatomic, strong) LQModelProductDetail *model;

+ (LatestAnnouncementCell *)cellWithTableView:(UITableView *)tableView;

@end

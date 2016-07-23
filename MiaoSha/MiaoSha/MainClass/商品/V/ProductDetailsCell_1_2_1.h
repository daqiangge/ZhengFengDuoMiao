//
//  ProductDetailsCell_1_2_1.h
//  MiaoSha
//
//  Created by liqiang on 16/7/22.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

/**
 *  倒计时
 */

#import <UIKit/UIKit.h>

@interface ProductDetailsCell_1_2_1 : UITableViewCell

@property (nonatomic, strong) LQModelProductDetail *model;

+ (ProductDetailsCell_1_2_1 *)cellWithTableView:(UITableView *)tableView;

@end

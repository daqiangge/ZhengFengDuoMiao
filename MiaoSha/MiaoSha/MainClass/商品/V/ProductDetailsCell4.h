//
//  ProductDetailsCell4.h
//  MiaoSha
//
//  Created by liqiang on 16/7/3.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductDetailsCell4 : UITableViewCell

@property (nonatomic, strong) LQModelProductDetail *model;

+ (ProductDetailsCell4 *)cellWithTableView:(UITableView *)tableView;

@end

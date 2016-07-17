//
//  ProductDetailsCell8.h
//  MiaoSha
//
//  Created by liqiang on 16/7/3.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductDetailsCell8 : UITableViewCell
@property (nonatomic, strong) LQModelProductDetail *model;
+ (ProductDetailsCell8 *)cellWithTableView:(UITableView *)tableView;

@end

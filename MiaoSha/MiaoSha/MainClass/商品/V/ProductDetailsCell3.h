//
//  ProductDetailsCell3.h
//  MiaoSha
//
//  Created by liqiang on 16/7/3.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductDetailsCell3 : UITableViewCell

@property (nonatomic, strong) LQModelProductDetail *model;

+ (ProductDetailsCell3 *)cellWithTableView:(UITableView *)tableView;

@end

//
//  OrderPayCell.m
//  MiaoSha
//
//  Created by liqiang on 16/7/16.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "OrderPayCell.h"

@implementation OrderPayCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (OrderPayCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"OrderPayCell";
    OrderPayCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[OrderPayCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    UIImageView *iconImageView = [[UIImageView alloc] init];
    
}
@end

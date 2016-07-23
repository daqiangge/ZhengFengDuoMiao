//
//  TuiChuDengLuCell.m
//  MiaoSha
//
//  Created by liqiang on 16/7/11.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "TuiChuDengLuCell.h"

@implementation TuiChuDengLuCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.contentView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
        
        [self drawView];
    }
    
    return self;
}

+ (TuiChuDengLuCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"TuiChuDengLuCell";
    TuiChuDengLuCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[TuiChuDengLuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:@"退出登录" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor colorWithRed:0.992 green:0.824 blue:0.188 alpha:1.00];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    btn.layer.cornerRadius = 3;
    btn.userInteractionEnabled = NO;
    [self.contentView addSubview:btn];
    
    btn.sd_layout
    .leftSpaceToView(self.contentView,20)
    .topSpaceToView(self.contentView,10)
    .bottomSpaceToView(self.contentView,10)
    .rightSpaceToView(self.contentView,20);
}

@end

//
//  SheZhiMoRenDiZhiBtnCell.m
//  MiaoSha
//
//  Created by liqiang on 16/7/6.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "SheZhiMoRenDiZhiBtnCell.h"

@implementation SheZhiMoRenDiZhiBtnCell


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

+ (SheZhiMoRenDiZhiBtnCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"SheZhiMoRenDiZhiBtnCell";
    SheZhiMoRenDiZhiBtnCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[SheZhiMoRenDiZhiBtnCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:@"设为默认地址" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor colorWithRed:0.980 green:0.373 blue:0.600 alpha:1.00];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    btn.layer.cornerRadius = 3;
    [self.contentView addSubview:btn];
    
    btn.sd_layout
    .leftSpaceToView(self.contentView,20)
    .topSpaceToView(self.contentView,10)
    .bottomSpaceToView(self.contentView,10)
    .rightSpaceToView(self.contentView,20);
}

@end

//
//  AddShouHuoDiZhiCell.m
//  MiaoSha
//
//  Created by liqiang on 16/7/6.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "AddShouHuoDiZhiCell.h"

@implementation AddShouHuoDiZhiCell


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

+ (AddShouHuoDiZhiCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"AddShouHuoDiZhiCell";
    AddShouHuoDiZhiCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[AddShouHuoDiZhiCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:@"新增收货地址" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor clearColor];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    btn.layer.borderColor = [UIColor grayColor].CGColor;
    btn.layer.borderWidth = 1;
    btn.layer.cornerRadius = 3;
    [self.contentView addSubview:btn];
    
    btn.sd_layout
    .leftSpaceToView(self.contentView,20)
    .topSpaceToView(self.contentView,10)
    .bottomSpaceToView(self.contentView,10)
    .rightSpaceToView(self.contentView,20);
}

@end

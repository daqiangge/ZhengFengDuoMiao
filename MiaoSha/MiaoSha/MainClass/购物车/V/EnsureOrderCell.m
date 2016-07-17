//
//  EnsureOrderCell.m
//  MiaoSha
//
//  Created by liqiang on 16/7/16.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "EnsureOrderCell.h"

@implementation EnsureOrderCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (EnsureOrderCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"EnsureOrderCell";
    EnsureOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[EnsureOrderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    UILabel *label1 = [[UILabel alloc] init];
    label1.font = [UIFont systemFontOfSize:14];
    label1.textColor = [UIColor grayColor];
    label1.text = @"阿大的撒是大大是大大大三大大声点";
    [self.contentView addSubview:label1];
    self.label1 = label1;
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.font = [UIFont systemFontOfSize:14];
    label2.textColor = [UIColor grayColor];
    label2.text = @"阿大的撒是大大是大大大三大大声点";
    label2.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:label2];
    self.label2 = label2;
    
    label2.sd_layout
    .rightSpaceToView(self.contentView,10)
    .topSpaceToView(self.contentView,0)
    .bottomSpaceToView(self.contentView,0)
    .widthIs(100);
    
    label1.sd_layout
    .leftSpaceToView(self.contentView,10)
    .topSpaceToView(self.contentView,0)
    .bottomSpaceToView(self.contentView,0)
    .rightSpaceToView(label2,5);
    
    [self addUnderlineWithLeftMargin:0];
    
}

@end

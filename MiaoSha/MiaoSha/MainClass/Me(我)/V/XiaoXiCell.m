//
//  XiaoXiCell.m
//  MiaoSha
//
//  Created by liqiang on 16/7/6.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "XiaoXiCell.h"

@implementation XiaoXiCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (XiaoXiCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"XiaoXiCell";
    XiaoXiCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[XiaoXiCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:iconImageView];
    self.iconImageView = iconImageView;
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.font = [UIFont systemFontOfSize:14];
    label1.textColor = [UIColor blackColor];
    label1.text = @"中奖消息";
    [self.contentView addSubview:label1];
    self.label1 = label1;
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.font = [UIFont systemFontOfSize:12];
    label2.textColor = [UIColor grayColor];
    label2.text = @"按时大大说大大大大大大大是大大大叔大叔的";
    [self.contentView addSubview:label2];
    self.label2 = label2;
    
    UILabel *dateLabel = [[UILabel alloc] init];
    dateLabel.font = [UIFont systemFontOfSize:12];
    dateLabel.textColor = [UIColor grayColor];
    dateLabel.textAlignment = NSTextAlignmentRight;
    dateLabel.text = @"21:12";
    [self.contentView addSubview:dateLabel];
    self.dateLabel = dateLabel;
    
    iconImageView.sd_layout
    .leftSpaceToView(self.contentView,10)
    .topSpaceToView(self.contentView,10)
    .bottomSpaceToView(self.contentView,10)
    .widthEqualToHeight();
    
    dateLabel.sd_layout
    .rightSpaceToView(self.contentView,10)
    .topEqualToView(iconImageView)
    .heightIs(15)
    .widthIs(80);
    
    label1.sd_layout
    .leftSpaceToView(iconImageView,10)
    .topEqualToView(iconImageView)
    .rightSpaceToView(dateLabel,10)
    .heightIs(18);
    
    label2.sd_layout
    .leftEqualToView(label1)
    .bottomEqualToView(iconImageView)
    .rightEqualToView(label1)
    .heightIs(18);
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = COLOR_LineViewColor;
    [self addSubview:lineView];
    
    lineView.sd_layout
    .leftEqualToView(label1)
    .bottomSpaceToView(self,0)
    .rightSpaceToView(self,0)
    .heightIs(0.5);
}

@end

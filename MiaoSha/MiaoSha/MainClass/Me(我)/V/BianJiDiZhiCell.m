//
//  BianJiDiZhiCell.m
//  MiaoSha
//
//  Created by liqiang on 16/7/6.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "BianJiDiZhiCell.h"

@implementation BianJiDiZhiCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (BianJiDiZhiCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"BianJiDiZhiCell";
    BianJiDiZhiCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[BianJiDiZhiCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor blackColor];
    label.text = @"省、市、区";
    [self.contentView addSubview:label];
    self.label = label;
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.font = [UIFont systemFontOfSize:14];
    label2.textColor = [UIColor grayColor];
//    label2.text = @"wwrewrwerwerrwwwe ";
    [self.contentView addSubview:label2];
    self.label2 = label2;
    
    UIImageView *arrowImageView = [[UIImageView alloc] init];
    arrowImageView.image = [UIImage imageNamed:@"arrow_right_grey"];
    [self.contentView addSubview:arrowImageView];
    self.arrowImageView = arrowImageView;
    
    label.sd_layout
    .leftSpaceToView(self.contentView,10)
    .topSpaceToView(self.contentView,0)
    .bottomSpaceToView(self.contentView,0)
    .widthIs(80);
    
    arrowImageView.sd_layout
    .rightSpaceToView(self.contentView,10)
    .centerYEqualToView(self.contentView)
    .heightIs(20)
    .widthIs(20);
    
    label2.sd_layout
    .leftSpaceToView(label,10)
    .rightSpaceToView(arrowImageView,10)
    .topSpaceToView(self.contentView,20)
    .autoHeightRatio(0);
    
    [self addUnderlineWithLeftMargin:0];
}

- (void)setModel:(ModelAddress *)model
{
    _model = model;
    [self setupAutoHeightWithBottomView:self.label2 bottomMargin:20];
}

@end

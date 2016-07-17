//
//  WoDeRenWuListCell.m
//  MiaoSha
//
//  Created by liqiang on 16/7/6.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "WoDeRenWuListCell.h"

@interface WoDeRenWuListCell ()

@property (nonatomic, weak) UILabel *label1;
@property (nonatomic, weak) UILabel *label2;
@property (nonatomic, weak) UIImageView *arrowImageView;
@property (nonatomic, weak) UIImageView *wanChengImageView;

@end

@implementation WoDeRenWuListCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (WoDeRenWuListCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"WoDeRenWuListCell";
    WoDeRenWuListCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[WoDeRenWuListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    UILabel *label1 = [[UILabel alloc] init];
    label1.font = [UIFont systemFontOfSize:14];
    label1.textColor = [UIColor blackColor];
    label1.text = @"任务一";
    [self.contentView addSubview:label1];
    self.label1 = label1;
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.font = [UIFont systemFontOfSize:14];
    label2.textColor = [UIColor grayColor];
    label2.text = @"斯蒂芬是否是发生的方式发生的方法是否是对方是否";
    [self.contentView addSubview:label2];
    self.label2 = label2;
    
    UIImageView *arrowImageView = [[UIImageView alloc] init];
    arrowImageView.image = [UIImage imageNamed:@"arrow_right_grey"];
    [self.contentView addSubview:arrowImageView];
    self.arrowImageView = arrowImageView;
    
    UIImageView *wanChengImageView = [[UIImageView alloc] init];
    wanChengImageView.image = [UIImage imageNamed:@"ic_time"];
    [self.contentView addSubview:wanChengImageView];
    self.wanChengImageView = wanChengImageView;
    
    
    arrowImageView.sd_layout
    .rightSpaceToView(self.contentView,10)
    .centerYEqualToView(self.contentView)
    .heightIs(20)
    .widthIs(20);
    
    wanChengImageView.sd_layout
    .rightSpaceToView(self.contentView,10)
    .centerYEqualToView(self.contentView)
    .heightIs(40)
    .widthIs(40);
    
    label1.sd_layout
    .leftSpaceToView(self.contentView,10)
    .topSpaceToView(self.contentView,10)
    .rightSpaceToView(wanChengImageView,10)
    .heightIs(18);
    
    label2.sd_layout
    .leftSpaceToView(self.contentView,10)
    .bottomSpaceToView(self.contentView,10)
    .rightSpaceToView(wanChengImageView,10)
    .heightIs(18);
    
    [self addUnderlineWithLeftMargin:0];
}

- (void)setModel:(ModelWoDeRenWu *)model
{
    _model = model;
    
    if (model.wanCheng) {
        self.wanChengImageView.hidden = NO;
        self.arrowImageView.hidden = YES;
    }else{
        self.wanChengImageView.hidden = YES;
        self.arrowImageView.hidden = NO;
    }
}

@end

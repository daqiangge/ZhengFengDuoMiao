//
//  MeCell.m
//  MiaoSha
//
//  Created by liqiang on 16/5/24.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "MeCell.h"

@interface MeCell ()

@end

@implementation MeCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (MeCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"MeCell";
    MeCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[MeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    UIImageView *iconImageView = [[UIImageView alloc] init];
//    iconImageView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:iconImageView];
    self.iconImageView = iconImageView;
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor blackColor];
    label.text = @"啊实打实的";
    [self.contentView addSubview:label];
    self.label = label;
    
    UILabel *detailLabel = [[UILabel alloc] init];
    detailLabel.font = [UIFont systemFontOfSize:13];
    detailLabel.textColor = [UIColor grayColor];
    detailLabel.text = @"啊实打实的";
    detailLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:detailLabel];
    self.detailLabel = detailLabel;
    
    UIImageView *arrowImageView = [[UIImageView alloc] init];
    arrowImageView.image = [UIImage imageNamed:@"arrow_right_grey"];
    [self.contentView addSubview:arrowImageView];
    
    iconImageView.sd_layout
    .leftSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,5)
    .bottomSpaceToView(self.contentView,5)
    .widthEqualToHeight();
    
    label.sd_layout
    .leftSpaceToView(iconImageView,15)
    .topSpaceToView(self.contentView,10)
    .bottomSpaceToView(self.contentView,10)
    .widthIs(100);
    
    arrowImageView.sd_layout
    .rightSpaceToView(self.contentView,10)
    .centerYEqualToView(label)
    .widthIs(20)
    .heightIs(20);
    
    detailLabel.sd_layout
    .rightSpaceToView(arrowImageView,5)
    .topSpaceToView(self.contentView,0)
    .bottomSpaceToView(self.contentView,0)
    .leftSpaceToView(label,10);
    
    [self addUnderlineWithLeftMargin:0];
}
@end

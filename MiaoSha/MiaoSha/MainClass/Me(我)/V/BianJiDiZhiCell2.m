//
//  BianJiDiZhiCell2.m
//  MiaoSha
//
//  Created by liqiang on 16/7/10.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "BianJiDiZhiCell2.h"

@implementation BianJiDiZhiCell2


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (BianJiDiZhiCell2 *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"BianJiDiZhiCell2";
    BianJiDiZhiCell2 *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[BianJiDiZhiCell2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    
    UITextField *textField = [[UITextField alloc] init];
    textField.font = [UIFont systemFontOfSize:14];
    textField.textColor = [UIColor grayColor];
//    textField.text = @"wwrewrwerwerrwwwe ";
    [self.contentView addSubview:textField];
    self.textField = textField;
    
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
    
    textField.sd_layout
    .leftSpaceToView(label,10)
    .rightSpaceToView(arrowImageView,10)
    .topSpaceToView(self.contentView,0)
    .bottomSpaceToView(self.contentView,0);
    
    [self addUnderlineWithLeftMargin:0];
}

- (void)setModel:(ModelAddress *)model
{
    _model = model;
    [self setupAutoHeightWithBottomView:self.textField bottomMargin:20];
}

@end

//
//  ProductDetailsCell8.m
//  MiaoSha
//
//  Created by liqiang on 16/7/3.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ProductDetailsCell8.h"

@interface ProductDetailsCell8 ()

@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) UILabel *label1;
@property (nonatomic, weak) UILabel *label2;

@end

@implementation ProductDetailsCell8


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (ProductDetailsCell8 *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"ProductDetailsCell8";
    ProductDetailsCell8 *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[ProductDetailsCell8 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.image = [UIImage imageNamed:@"awards_useImg_001"];
    [self.contentView addSubview:iconImageView];
    self.iconImageView = iconImageView;
    
    UILabel *label1 = [[UILabel alloc] init];
    [self.contentView addSubview:label1];
    self.label1 = label1;
    
    UILabel *label2 = [[UILabel alloc] init];
    [self.contentView addSubview:label2];
    self.label2 = label2;
    
    iconImageView.sd_layout
    .leftSpaceToView(self.contentView,10)
    .centerYEqualToView(self.contentView)
    .widthIs(30)
    .heightIs(30);
    
    label1.sd_layout
    .leftSpaceToView(iconImageView,10)
    .topEqualToView(iconImageView)
    .rightSpaceToView(self.contentView,10)
    .heightIs(15);
    
    label2.sd_layout
    .leftSpaceToView(iconImageView,10)
    .bottomEqualToView(iconImageView)
    .rightSpaceToView(self.contentView,10)
    .heightIs(15);
    
    [self addUnderlineWithLeftMargin:0];
}

- (void)setModel:(LQModelBuyUser *)model
{
    _model = model;
    
    NSMutableAttributedString *att1 = [[NSMutableAttributedString alloc] initWithString:model.user.name attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor colorWithRed:0.318 green:0.867 blue:0.878 alpha:1.00]}];
    [att1 appendAttributedString:[[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"（IP:%@）",model.ip] attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor blackColor]}]];
    self.label1.attributedText = att1;
    
    NSMutableAttributedString *att2 = [[NSMutableAttributedString alloc] initWithString:@"参与了" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor blackColor]}];
    [att2 appendAttributedString:[[NSMutableAttributedString alloc] initWithString:model.count attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor redColor]}]];
    [att2 appendAttributedString:[[NSMutableAttributedString alloc] initWithString:@"人次" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor blackColor]}]];
    [att2 appendAttributedString:[[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"  %@",model.updateDate] attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor lightGrayColor]}]];
    self.label2.attributedText = att2;
}

@end

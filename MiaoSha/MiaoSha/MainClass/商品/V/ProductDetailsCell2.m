//
//  ProductDetailsCell2.m
//  MiaoSha
//
//  Created by liqiang on 16/7/3.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ProductDetailsCell2.h"

@interface ProductDetailsCell2 ()

@property (nonatomic, weak) UILabel *label;

@end

@implementation ProductDetailsCell2


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (ProductDetailsCell2 *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"ProductDetailsCell2";
    ProductDetailsCell2 *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[ProductDetailsCell2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:16];
    label.textColor = [UIColor blackColor];
    [self.contentView addSubview:label];
    self.label = label;
    
    label.sd_layout
    .leftSpaceToView(self.contentView,10)
    .rightSpaceToView(self.contentView,10)
    .topSpaceToView(self.contentView,5)
    .autoHeightRatio(0);
    
    [self addUnderlineWithLeftMargin:10];
    
}

- (void)setModel:(LQModelProductDetail *)model
{
    _model = model;
    
    self.label.text = model.product.name;
    [self setupAutoHeightWithBottomView:self.label bottomMargin:5];
}

@end

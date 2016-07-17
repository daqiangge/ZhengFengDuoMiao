//
//  ProductDetailsCell7.m
//  MiaoSha
//
//  Created by liqiang on 16/7/3.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ProductDetailsCell7.h"

@interface ProductDetailsCell7 ()

@property (nonatomic, weak) UILabel *label2;

@end

@implementation ProductDetailsCell7


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (ProductDetailsCell7 *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"ProductDetailsCell7";
    ProductDetailsCell7 *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[ProductDetailsCell7 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor blackColor];
    label.text = @"本期参与";
    [self.contentView addSubview:label];
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.font = [UIFont systemFontOfSize:14];
    label2.textColor = [UIColor lightGrayColor];
    label2.text = @"（2015-15-15 15:14:14 开始）";
    [self.contentView addSubview:label2];
    self.label2 = label2;
    
    label.sd_layout
    .leftSpaceToView(self.contentView,10)
    .topSpaceToView(self.contentView,0)
    .bottomSpaceToView(self.contentView,0);
    [label setSingleLineAutoResizeWithMaxWidth:100];
    
    label2.sd_layout
    .leftSpaceToView(label,0)
    .topSpaceToView(self.contentView,0)
    .bottomSpaceToView(self.contentView,0)
    .rightSpaceToView(self.contentView,10);
    
    [self addUnderlineWithLeftMargin:0];
}


- (void)setModel:(LQModelProductDetail *)model
{
    _model = model;
}

@end

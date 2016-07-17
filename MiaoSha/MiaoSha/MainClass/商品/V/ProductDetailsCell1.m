//
//  ProductDetailsCell1.m
//  MiaoSha
//
//  Created by liqiang on 16/7/3.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ProductDetailsCell1.h"

@interface ProductDetailsCell1 ()

@property (nonatomic, weak) UIImageView *goodsImageView;

@end

@implementation ProductDetailsCell1


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (ProductDetailsCell1 *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"ProductDetailsCell1";
    ProductDetailsCell1 *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[ProductDetailsCell1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    UIImageView *goodsImageView = [[UIImageView alloc] init];
    [goodsImageView setContentScaleFactor:[[UIScreen mainScreen] scale]];
    goodsImageView.contentMode =  UIViewContentModeScaleAspectFill;
    goodsImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    goodsImageView.clipsToBounds  = YES;
    [self.contentView addSubview:goodsImageView];
    self.goodsImageView = goodsImageView;
    
    goodsImageView.sd_layout
    .leftSpaceToView(self.contentView,0)
    .topSpaceToView(self.contentView,0)
    .bottomSpaceToView(self.contentView,0)
    .rightSpaceToView(self.contentView,0);
}

- (void)setModel:(LQModelProductDetail *)model
{
    _model = model;
    
    [self.goodsImageView sd_setImageWithURL:[NSURL URLWithString:URLSTR(model.added.product.appPath)] placeholderImage:[UIImage imageNamed:@"default"]];
    
}

@end

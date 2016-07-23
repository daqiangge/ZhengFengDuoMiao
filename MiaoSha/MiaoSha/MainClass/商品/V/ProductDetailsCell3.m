//
//  ProductDetailsCell3.m
//  MiaoSha
//
//  Created by liqiang on 16/7/3.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ProductDetailsCell3.h"

@interface ProductDetailsCell3 ()

@property (nonatomic, weak) UILabel *shangPingQiShuLabel;
@property (nonatomic, weak) UILabel *zongRenCiLabel;
@property (nonatomic, weak) UILabel *shengYuRenCiLabel;
@property (nonatomic, weak) UIProgressView *processView;

@end

@implementation ProductDetailsCell3


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (ProductDetailsCell3 *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"ProductDetailsCell3";
    ProductDetailsCell3 *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[ProductDetailsCell3 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)drawView
{
    UILabel *shangPingQiShuLabel = [[UILabel alloc] init];
    shangPingQiShuLabel.font = [UIFont systemFontOfSize:12];
    shangPingQiShuLabel.textColor = [UIColor grayColor];
    shangPingQiShuLabel.text = @"商品期数：20160606";
    [self.contentView addSubview:shangPingQiShuLabel];
    self.shangPingQiShuLabel = shangPingQiShuLabel;
    
    UIProgressView *processView = [[UIProgressView alloc] init];
    processView.trackTintColor = [UIColor lightGrayColor];
    processView.progressTintColor = [UIColor colorWithRed:0.980 green:0.043 blue:0.482 alpha:1.00];
    processView.progress = 0.8;
    [self.contentView addSubview:processView];
    self.processView = processView;
    
    UILabel *zongRenCiLabel = [[UILabel alloc] init];
    zongRenCiLabel.font = [UIFont systemFontOfSize:12];
    zongRenCiLabel.textColor = [UIColor grayColor];
    zongRenCiLabel.text = @"总需88888人次";
    [self.contentView addSubview:zongRenCiLabel];
    self.zongRenCiLabel = zongRenCiLabel;
    
    UILabel *shengYuRenCiLabel = [[UILabel alloc] init];
    shengYuRenCiLabel.font = [UIFont systemFontOfSize:12];
    shengYuRenCiLabel.textColor = [UIColor grayColor];
    shengYuRenCiLabel.text = @"剩余88888人次";
    shengYuRenCiLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:shengYuRenCiLabel];
    self.shengYuRenCiLabel = shengYuRenCiLabel;
    
    shangPingQiShuLabel.sd_layout
    .leftSpaceToView(self.contentView,10)
    .topSpaceToView(self.contentView,10)
    .widthIs(200)
    .autoHeightRatio(0);
    
    processView.sd_layout
    .leftEqualToView(shangPingQiShuLabel)
    .topSpaceToView(shangPingQiShuLabel,5)
    .rightSpaceToView(self.contentView,10)
    .heightIs(15);
    
    zongRenCiLabel.sd_layout
    .leftEqualToView(shangPingQiShuLabel)
    .topSpaceToView(processView,5)
    .widthIs(150)
    .autoHeightRatio(0);
    
    shengYuRenCiLabel.sd_layout
    .rightEqualToView(processView)
    .topSpaceToView(processView,5)
    .widthIs(150)
    .autoHeightRatio(0);
}

- (void)setModel:(LQModelProductDetail *)model
{
    _model = model;
    
    self.shangPingQiShuLabel.text = [NSString stringWithFormat:@"商品期数：%@",model.number];
    self.zongRenCiLabel.text = [NSString stringWithFormat:@"总需%d人次",model.allCount];
    self.shengYuRenCiLabel.text = [NSString stringWithFormat:@"剩余%d人次",model.allCount - model.currentCount];
    self.processView.progress = model.currentCount*1.00/model.allCount;
    
    [self setupAutoHeightWithBottomView:self.zongRenCiLabel bottomMargin:10];
}

@end

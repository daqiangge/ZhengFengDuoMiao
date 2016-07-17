//
//  ShouHuoDiZhiListCell.m
//  MiaoSha
//
//  Created by liqiang on 16/7/6.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ShouHuoDiZhiListCell.h"

@interface ShouHuoDiZhiListCell ()

@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *mobileLabel;
@property (nonatomic, weak) UILabel *moRenLabel;
@property (nonatomic, weak) UILabel *addressLabel;

@end

@implementation ShouHuoDiZhiListCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (ShouHuoDiZhiListCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"ShouHuoDiZhiListCell";
    ShouHuoDiZhiListCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[ShouHuoDiZhiListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.font = [UIFont systemFontOfSize:14];
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.text = @"张三";
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UILabel *mobileLabel = [[UILabel alloc] init];
    mobileLabel.font = [UIFont systemFontOfSize:14];
    mobileLabel.textColor = [UIColor blackColor];
    mobileLabel.text = @"12312312312";
    [self.contentView addSubview:mobileLabel];
    self.mobileLabel = mobileLabel;
    
    UILabel *moRenLabel = [[UILabel alloc] init];
    moRenLabel.font = [UIFont systemFontOfSize:12];
    moRenLabel.textColor = [UIColor redColor];
    moRenLabel.text = @"默认";
    moRenLabel.textAlignment = NSTextAlignmentCenter;
    moRenLabel.layer.borderColor = [UIColor redColor].CGColor;
    moRenLabel.layer.borderWidth = 1;
    moRenLabel.layer.cornerRadius = 2;
    [self.contentView addSubview:moRenLabel];
    self.moRenLabel = moRenLabel;
    
    UILabel *addressLabel = [[UILabel alloc] init];
    addressLabel.font = [UIFont systemFontOfSize:14];
    addressLabel.textColor = [UIColor grayColor];
    addressLabel.text = @"阿打算打打实打实大师的飒飒飒飒的三大大大声大声道";
    [self.contentView addSubview:addressLabel];
    self.addressLabel = addressLabel;
    
    UIImageView *arrowImageView = [[UIImageView alloc] init];
    arrowImageView.image = [UIImage imageNamed:@"arrow_right_grey"];
    [self.contentView addSubview:arrowImageView];
    
    nameLabel.sd_layout
    .leftSpaceToView(self.contentView,10)
    .topSpaceToView(self.contentView,10)
    .heightIs(18);
    [nameLabel setSingleLineAutoResizeWithMaxWidth:150];
    
    mobileLabel.sd_layout
    .leftSpaceToView(nameLabel,10)
    .topEqualToView(nameLabel)
    .heightRatioToView(nameLabel,1)
    .widthIs(100);
    
    moRenLabel.sd_layout
    .leftSpaceToView(mobileLabel,20)
    .centerYEqualToView(nameLabel)
    .heightIs(15)
    .widthIs(40);
    
    arrowImageView.sd_layout
    .rightSpaceToView(self.contentView,10)
    .centerYEqualToView(self.contentView)
    .heightIs(20)
    .widthIs(20);
    
    addressLabel.sd_layout
    .topSpaceToView(nameLabel,10)
    .leftEqualToView(nameLabel)
    .rightSpaceToView(arrowImageView,10)
    .autoHeightRatio(0);
    [addressLabel setMaxNumberOfLinesToShow:2];
}

- (void)setModel:(ModelAddress *)model
{
    _model = model;
    
    [self setupAutoHeightWithBottomView:self.addressLabel bottomMargin:10];
}

@end

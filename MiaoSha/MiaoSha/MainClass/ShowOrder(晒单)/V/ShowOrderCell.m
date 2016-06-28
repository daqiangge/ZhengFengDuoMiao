//
//  ShowOrderCell.m
//  MiaoSha
//
//  Created by liqiang on 16/6/13.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ShowOrderCell.h"

#import "SDWeiXinPhotoContainerView.h"

@interface ShowOrderCell ()

@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *dateLabel;
@property (nonatomic, weak) UILabel *joinNumLabel;
@property (nonatomic, weak) UILabel *contentLabel;
@property (nonatomic, weak) UILabel *qiShuLabel;
@property (nonatomic, weak) UILabel *shangPingNameLabel;
@property (nonatomic, strong) SDWeiXinPhotoContainerView *picContainerView;

@end

@implementation ShowOrderCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (ShowOrderCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"ShowOrderCell";
    ShowOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[ShowOrderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    [self addUnderlineWithLeftMargin:0];
    
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.image = [UIImage imageNamed:@"PHB_userImg001"];
    [self.contentView addSubview:iconImageView];
    self.iconImageView = iconImageView;
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.font = [UIFont systemFontOfSize:12];
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.text = @"张先生";
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UILabel *dateLabel = [[UILabel alloc] init];
    dateLabel.font = nameLabel.font;
    dateLabel.textColor = [UIColor lightGrayColor];
    dateLabel.text = @"2016-06-06";
    [self.contentView addSubview:dateLabel];
    self.dateLabel = dateLabel;
    
    UILabel *joinNumLabel = [[UILabel alloc] init];
    joinNumLabel.font = nameLabel.font;
    joinNumLabel.textColor = [UIColor blackColor];
    joinNumLabel.text = @"参与330人次";
    joinNumLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:joinNumLabel];
    self.joinNumLabel = joinNumLabel;
    
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.font = nameLabel.font;
    contentLabel.textColor = [UIColor blackColor];
    contentLabel.numberOfLines = 0;
    contentLabel.text = @"爱上大萨达四大大飒飒的宣传V型从V型从vv搜索发送对方阿萨大单位";
    [self.contentView addSubview:contentLabel];
    self.contentLabel = contentLabel;
    
    self.picContainerView = [SDWeiXinPhotoContainerView new];
    [self.contentView addSubview:self.picContainerView];
//    self.picContainerView = picContainerView;
    
    UILabel *qiShuLabel = [[UILabel alloc] init];
    qiShuLabel.font = nameLabel.font;
    qiShuLabel.textColor = [UIColor lightGrayColor];
    qiShuLabel.text = @"[商品期数]：20160113";
    [self.contentView addSubview:qiShuLabel];
    self.qiShuLabel = qiShuLabel;
    
    UILabel *shangPingNameLabel = [[UILabel alloc] init];
    shangPingNameLabel.font = nameLabel.font;
    shangPingNameLabel.textColor = [UIColor lightGrayColor];
    shangPingNameLabel.text = @"[商品名称]：啊实打实大的宣传V型从vvasd";
    [self.contentView addSubview:shangPingNameLabel];
    self.shangPingNameLabel = shangPingNameLabel;
    
    iconImageView.sd_layout
    .leftSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,10)
    .widthIs(30)
    .heightIs(30);
    
    nameLabel.sd_layout
    .leftSpaceToView(iconImageView,10)
    .topEqualToView(iconImageView)
    .heightRatioToView(iconImageView,1);
    [nameLabel setSingleLineAutoResizeWithMaxWidth:150];
    
    dateLabel.sd_layout
    .leftSpaceToView(nameLabel,10)
    .topEqualToView(iconImageView)
    .heightRatioToView(iconImageView,1);
    [dateLabel setSingleLineAutoResizeWithMaxWidth:80];
    
    joinNumLabel.sd_layout
    .rightSpaceToView(self.contentView,10)
    .topEqualToView(iconImageView)
    .heightRatioToView(iconImageView,1)
    .leftSpaceToView(dateLabel,10);
    
    contentLabel.sd_layout
    .leftEqualToView(iconImageView)
    .topSpaceToView(iconImageView,10)
    .rightEqualToView(joinNumLabel)
    .autoHeightRatio(0);
    [contentLabel setMaxNumberOfLinesToShow:0];
    
    self.picContainerView.sd_layout
    .leftSpaceToView(self.contentView,15); // 已经在内部实现宽度和高度自适应所以不需要再设置宽度高度，top值是具体有无图片在setModel方法中设置
    
    qiShuLabel.sd_layout
    .leftEqualToView(iconImageView)
    .topSpaceToView(self.picContainerView,10)
    .rightEqualToView(joinNumLabel)
    .heightIs(12);
    
    shangPingNameLabel.sd_layout
    .leftEqualToView(iconImageView)
    .topSpaceToView(qiShuLabel,3)
    .rightEqualToView(joinNumLabel)
    .heightIs(12);
    
    
}

- (void)setModel:(ModelOrder *)model
{
    _model = model;
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.icon] placeholderImage:[UIImage imageNamed:@"PHB_userImg001"]];
    self.nameLabel.text = model.name;
    self.dateLabel.text = model.date;
    
    NSMutableAttributedString *joinNumAtt = [[NSMutableAttributedString alloc] initWithString:@"参与" attributes:@{NSFontAttributeName:self.dateLabel.font,NSForegroundColorAttributeName:self.dateLabel.textColor}];
    [joinNumAtt appendAttributedString:[[NSMutableAttributedString alloc] initWithString:model.joinNum attributes:@{NSFontAttributeName:self.dateLabel.font,NSForegroundColorAttributeName:[UIColor redColor]}]];
    [joinNumAtt appendAttributedString:[[NSMutableAttributedString alloc] initWithString:@"人次" attributes:@{NSFontAttributeName:self.dateLabel.font,NSForegroundColorAttributeName:self.dateLabel.textColor}]];
    self.joinNumLabel.attributedText = joinNumAtt;
    
    [self.contentLabel sizeToFit];
    self.contentLabel.text = model.content;
    self.picContainerView.picPathStringsArray = model.picArray;
    
    CGFloat picContainerTopMargin = 0;
    if (model.picArray.count)
    {
        picContainerTopMargin = 10;
    }
    self.picContainerView.sd_layout
    .topSpaceToView(self.contentLabel, picContainerTopMargin);
    
    self.qiShuLabel.text = [NSString stringWithFormat:@"[商品期数]：%@",model.qishu];
    
    NSMutableAttributedString *shangPingNameAtt = [[NSMutableAttributedString alloc] initWithString:@"[商品名称]：" attributes:@{NSFontAttributeName:self.dateLabel.font,NSForegroundColorAttributeName:self.dateLabel.textColor}];
    [shangPingNameAtt appendAttributedString:[[NSMutableAttributedString alloc] initWithString:model.shangpingName attributes:@{NSFontAttributeName:self.dateLabel.font,NSForegroundColorAttributeName:[UIColor blackColor]}]];
    self.shangPingNameLabel.attributedText = shangPingNameAtt;
    
    [self setupAutoHeightWithBottomView:self.shangPingNameLabel bottomMargin:10];
}

@end

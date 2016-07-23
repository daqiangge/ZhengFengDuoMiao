//
//  ProductDetailsCell_1_2_1.m
//  MiaoSha
//
//  Created by liqiang on 16/7/22.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ProductDetailsCell_1_2_1.h"
#import "TTCounterLabel.h"

@interface ProductDetailsCell_1_2_1 ()

@property (nonatomic, weak) UILabel *shangPingQiShuLabel;
@property (strong, nonatomic) TTCounterLabel *timeLabel;

@end

@implementation ProductDetailsCell_1_2_1


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (ProductDetailsCell_1_2_1 *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"ProductDetailsCell_1_2_1";
    ProductDetailsCell_1_2_1 *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[ProductDetailsCell_1_2_1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
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
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:18];
    label.textColor =  [UIColor colorWithRed:1.000 green:0.451 blue:0.655 alpha:1.00];
    label.text = @"揭晓倒计时:";
    [self.contentView addSubview:label];
    
    self.timeLabel = [[TTCounterLabel alloc] init];
    self.timeLabel.textColor = [UIColor colorWithRed:1.000 green:0.451 blue:0.655 alpha:1.00];
    self.timeLabel.countDirection = kCountDirectionDown;
    [self.timeLabel setBoldFont:[UIFont systemFontOfSize:18]];
    [self.timeLabel setRegularFont:[UIFont systemFontOfSize:18]];
    [self.timeLabel setFont:[UIFont systemFontOfSize:18]];
    [self.contentView addSubview:self.timeLabel];
    
    
    shangPingQiShuLabel.sd_layout
    .leftSpaceToView(self.contentView,10)
    .topSpaceToView(self.contentView,10)
    .widthIs(200)
    .heightIs(20);
    
    label.sd_layout
    .leftSpaceToView(self.contentView,10)
    .topSpaceToView(shangPingQiShuLabel,0)
    .bottomEqualToView(self.contentView)
    .widthIs(100);
    
    self.timeLabel.sd_layout
    .leftSpaceToView(label,10)
    .topSpaceToView(shangPingQiShuLabel,0)
    .bottomEqualToView(self.contentView)
    .rightSpaceToView(self.contentView,0);
}

- (void)setModel:(LQModelProductDetail *)model
{
    _model = model;
    
    self.shangPingQiShuLabel.text = [NSString stringWithFormat:@"商品期数：%@",model.number];
    
    [self.timeLabel reset];
    
    NSDate *nowDate = [NSDate date];
    long nowTimeInterval = [NSDate timeIntervalWithDate:nowDate]*1000;
    
    long time = model.lotteryTimeLong - nowTimeInterval;
    
    if (time < 0 ) {
        
    }else{
        self.timeLabel.startValue = time;
        [self.timeLabel updateApperance];
        [self.timeLabel start];
    }
}

@end

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
    iconImageView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:iconImageView];
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor blackColor];
    label.text = @"啊实打实的";
    [self.contentView addSubview:label];
}
@end

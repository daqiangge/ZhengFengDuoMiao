//
//  MeVC.m
//  lingdaozhe
//
//  Created by liqiang on 16/4/20.
//  Copyright © 2016年 bckj. All rights reserved.
//

#import "MeVC.h"
#import "MeCell.h"

@interface MeVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *telNumLabel;

@end

@implementation MeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self drawView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}

- (void)drawView
{
    UIView *starBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 20)];
    starBarView.backgroundColor = [UIColor colorWithRed:0.992 green:0.820 blue:0.188 alpha:1.00];
    [self.view addSubview:starBarView];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableHeaderView = [self drawHeaderView];
    [self.view addSubview:tableView];
    
    tableView.sd_layout
    .topSpaceToView(starBarView,0)
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0);
}

- (UIView *)drawHeaderView
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 123)];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Bg-userImg"]];
    [headerView addSubview:imageView];
    
    UIView *personInfoBgv = [[UIView alloc] init];
    personInfoBgv.backgroundColor = [UIColor clearColor];
    [headerView addSubview:personInfoBgv];
    
    UIButton *leftBtn = [[UIButton alloc] init];
    [leftBtn setImage:[UIImage imageNamed:@"ic_setting"] forState:UIControlStateNormal];
    [headerView addSubview:leftBtn];
    
    UIButton *rightBtn = [[UIButton alloc] init];
    [rightBtn setImage:[UIImage imageNamed:@"ic_cart"] forState:UIControlStateNormal];
    [headerView addSubview:rightBtn];
    
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.image = [UIImage imageNamed:@"awards_useImg_001"];
    [personInfoBgv addSubview:iconImageView];
    
    UIView *personCenterYView = [[UIView alloc] init];
    personCenterYView.backgroundColor = [UIColor clearColor];
    [personInfoBgv addSubview:personCenterYView];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.font = [UIFont systemFontOfSize:15];
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.text = @"用户：XXXXXX";
    [personInfoBgv addSubview:nameLabel];
    
    UILabel *telNumLabel = [[UILabel alloc] init];
    telNumLabel.font = [UIFont systemFontOfSize:15];
    telNumLabel.textColor = [UIColor whiteColor];
    telNumLabel.text = @"手机：XXXXXXXXXXXXX";
    [personInfoBgv addSubview:telNumLabel];
    
    imageView.sd_layout
    .leftSpaceToView(headerView,0)
    .rightSpaceToView(headerView,0)
    .topSpaceToView(headerView,0)
    .bottomSpaceToView(headerView,0);
    
    leftBtn.sd_layout
    .topSpaceToView(headerView,15)
    .leftSpaceToView(headerView,15)
    .heightIs(20)
    .widthIs(20);
    
    rightBtn.sd_layout
    .topSpaceToView(headerView,15)
    .rightSpaceToView(headerView,15)
    .heightIs(20)
    .widthIs(20);
    
    personInfoBgv.sd_layout
    .leftSpaceToView(headerView,0)
    .rightSpaceToView(headerView,0)
    .topSpaceToView(leftBtn,0)
    .bottomSpaceToView(headerView,0);
    
    personCenterYView.sd_layout
    .leftSpaceToView(personInfoBgv,15)
    .rightSpaceToView(personInfoBgv,15)
    .centerYEqualToView(personInfoBgv)
    .heightIs(0.01);
    
    iconImageView.sd_layout
    .leftSpaceToView(personInfoBgv,15)
    .centerYEqualToView(personInfoBgv)
    .heightIs(55)
    .widthIs(55);
    iconImageView.sd_cornerRadiusFromHeightRatio = @(0.5);
    
    nameLabel.sd_layout
    .bottomSpaceToView(personCenterYView,5)
    .leftSpaceToView(iconImageView,10)
    .autoHeightRatio(0)
    .rightSpaceToView(personInfoBgv,15);
    
    telNumLabel.sd_layout
    .topSpaceToView(personCenterYView,5)
    .leftSpaceToView(iconImageView,10)
    .autoHeightRatio(0)
    .rightSpaceToView(personInfoBgv,15);
    
    return headerView;
}

#pragma mark -
#pragma mark ================= <UITableViewDelegate,UITableViewDataSource> =================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 6;
    }
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MeCell *cell = [MeCell cellWithTableView:tableView];
    
    switch (indexPath.section)
    {
        case 0:
        {
            NSArray *array = @[@"中奖纪录",@"秒杀纪录",@"我的晒单",@"收货地址",@"我的任务",@"消息"];
            cell.iconImageView.image = [UIImage imageNamed:array[indexPath.row]];
            cell.label.text = array[indexPath.row];
            cell.detailLabel.text = @"";
        }
            break;
        case 1:
        {
            NSArray *array = @[@"客服中心",@"意见反馈"];
            cell.iconImageView.image = [UIImage imageNamed:array[indexPath.row]];
            cell.label.text = array[indexPath.row];
            cell.detailLabel.text = @"";
            
            if (indexPath.row == 0)
            {
                cell.detailLabel.text = @"400-400-8888";
            }
        }
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 39;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

@end

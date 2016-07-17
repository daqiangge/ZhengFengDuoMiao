//
//  MeVC.m
//  lingdaozhe
//
//  Created by liqiang on 16/4/20.
//  Copyright © 2016年 bckj. All rights reserved.
//

#import "MeVC.h"
#import "MeCell.h"
#import "ZhongJiangJiLuVC.h"
#import "MiaoShaJiLuVC.h"
#import "WoDeShaiDanVC.h"
#import "ShouHuoDiZhiVC.h"
#import "WoDeRenWuVC.h"
#import "XiaoXiVC.h"
#import "YiJianFanKuiVC.h"
#import "LoginVC.h"
#import "SheZhiVC.h"
#import "ShopCarVC.h"

@interface MeVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *telNumLabel;
@property (nonatomic, weak) UIButton *loginBtn;
@property (nonatomic, weak) UIImageView *iconImageView;
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
    
    [self initData];
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

- (void)initData
{
    BOOL isLogin = [[UserDefaults valueForKey:@"isLogin"] boolValue];
    
    if (isLogin)
    {
        self.nameLabel.hidden = NO;
        self.telNumLabel.hidden = NO;
        self.loginBtn.hidden = YES;
        self.nameLabel.text = [NSString stringWithFormat:@"用户：%@",[LQModelMember sharedMemberMySelf].loginName];
        self.telNumLabel.text = [NSString stringWithFormat:@"手机：%@",[LQModelMember sharedMemberMySelf].mobile];
    }
    else
    {
        self.nameLabel.hidden = YES;
        self.telNumLabel.hidden = YES;
        self.loginBtn.hidden = NO;
    }
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
    [leftBtn addTarget:self action:@selector(gotoSheZhiVC) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:leftBtn];
    
    UIButton *rightBtn = [[UIButton alloc] init];
    [rightBtn setImage:[UIImage imageNamed:@"ic_cart"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(gotoShopCar) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:rightBtn];
    
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.image = [UIImage imageNamed:@"awards_useImg_001"];
    [personInfoBgv addSubview:iconImageView];
    self.iconImageView = iconImageView;
    
    UIView *personCenterYView = [[UIView alloc] init];
    personCenterYView.backgroundColor = [UIColor clearColor];
    [personInfoBgv addSubview:personCenterYView];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.font = [UIFont systemFontOfSize:15];
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.text = @"用户：XXXXXX";
    [personInfoBgv addSubview:nameLabel];
    nameLabel.hidden = YES;
    self.nameLabel = nameLabel;
    
    UILabel *telNumLabel = [[UILabel alloc] init];
    telNumLabel.font = [UIFont systemFontOfSize:15];
    telNumLabel.textColor = [UIColor whiteColor];
    telNumLabel.text = @"手机：XXXXXXXXXXXXX";
    [personInfoBgv addSubview:telNumLabel];
    telNumLabel.hidden = YES;
    self.telNumLabel = telNumLabel;
    
    UIButton *loginBtn = [[UIButton alloc] init];
    [loginBtn setTitle:@"立即登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    loginBtn.backgroundColor = [UIColor clearColor];
    loginBtn.layer.cornerRadius = 4;
    loginBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    loginBtn.layer.borderWidth = 1;
    loginBtn.hidden = YES;
    [loginBtn addTarget:self action:@selector(gotoLoginVC) forControlEvents:UIControlEventTouchUpInside];
    [personInfoBgv addSubview:loginBtn];
    self.loginBtn = loginBtn;
    
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
    
    loginBtn.sd_layout
    .leftEqualToView(nameLabel)
    .centerYEqualToView(iconImageView)
    .widthIs(80)
    .heightIs(30);
    
    return headerView;
}

- (void)gotoLoginVC
{
    LoginVC *vc = [[LoginVC alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)gotoSheZhiVC
{
    SheZhiVC *vc = [[SheZhiVC alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)gotoShopCar
{
    ShopCarVC *vc = [[ShopCarVC alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0)
    {
        switch (indexPath.row)
        {
            case 0:
            {
                ZhongJiangJiLuVC *vc = [[ZhongJiangJiLuVC alloc] init];
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 1:
            {
                MiaoShaJiLuVC *vc = [[MiaoShaJiLuVC alloc] init];
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 2:
            {
                WoDeShaiDanVC *vc = [[WoDeShaiDanVC alloc] init];
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 3:
            {
                ShouHuoDiZhiVC *vc = [[ShouHuoDiZhiVC alloc] init];
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 4:
            {
                WoDeRenWuVC *vc = [[WoDeRenWuVC alloc] init];
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 5:
            {
                XiaoXiVC *vc = [[XiaoXiVC alloc] init];
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
                
            default:
                break;
        }
    }
    
    if (indexPath.section == 1)
    {
        switch (indexPath.row)
        {
            case 0:
            {
                NSString *num = [[NSString alloc]initWithFormat:@"telprompt://%@",@"4004008888"]; //而这个方法则打电话前先弹框 是否打电话 然后打完电话之后回到程序中 网上说这个方法可能不合法 无法通过审核
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:num]];
            }
                break;
            case 1:
            {
                YiJianFanKuiVC *vc = [[YiJianFanKuiVC alloc] init];
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
                
            default:
                break;
        }
    }
}

@end

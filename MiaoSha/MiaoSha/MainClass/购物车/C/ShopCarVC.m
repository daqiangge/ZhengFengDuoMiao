//
//  ShopCarVC.m
//  MiaoSha
//
//  Created by liqiang on 16/7/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ShopCarVC.h"
#import "ShopCarListCell.h"
#import "Util.h"
#import "EnsureOrderVC.h"

@interface ShopCarVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ShopCarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"购物清单";
    
    [self drawView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)drawView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    //    tableView.tableFooterView = [self drawFooterView];
    [self.view addSubview:tableView];
    
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:footerView];
    [Util setFoursides:footerView Direction:@"top" sizeW:ScreenWidth];
    
    UILabel *zongJiaLabel = [[UILabel alloc] init];
    zongJiaLabel.font = [UIFont systemFontOfSize:12];
    zongJiaLabel.textColor = [UIColor grayColor];
    zongJiaLabel.text = @"共计3件商品，总价：123元";
    [footerView addSubview:zongJiaLabel];
    
    UILabel *tishiLabel = [[UILabel alloc] init];
    tishiLabel.font = [UIFont systemFontOfSize:10];
    tishiLabel.textColor = [UIColor grayColor];
    tishiLabel.text = @"夺宝有风险，参与需谨慎";
    [footerView addSubview:tishiLabel];
    
    UIButton *jieSuanBtn = [[UIButton alloc] init];
    [jieSuanBtn setTitle:@"结算" forState:UIControlStateNormal];
    [jieSuanBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    jieSuanBtn.backgroundColor = [UIColor redColor];
    jieSuanBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [jieSuanBtn addTarget:self action:@selector(jieSuan) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:jieSuanBtn];
    
    footerView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0)
    .heightIs(50);
    
    zongJiaLabel.sd_layout
    .leftSpaceToView(footerView,10)
    .rightSpaceToView(footerView,80)
    .topSpaceToView(footerView,10)
    .autoHeightRatio(0);
    
    tishiLabel.sd_layout
    .leftSpaceToView(footerView,10)
    .rightSpaceToView(footerView,85)
    .bottomSpaceToView(footerView,10)
    .autoHeightRatio(0);
    
    jieSuanBtn.sd_layout
    .rightSpaceToView(footerView,0)
    .topSpaceToView(footerView,0)
    .bottomSpaceToView(footerView,0)
    .widthIs(80);
    
    tableView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .bottomSpaceToView(footerView,0);
    
    tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefersh)];
}

- (void)headerRefersh
{

}

- (void)jieSuan
{
    EnsureOrderVC *vc = [[EnsureOrderVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -
#pragma mark ================= <UITableViewDelegate,UITableViewDataSource> =================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShopCarListCell *cell = [ShopCarListCell cellWithTableView:tableView];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

@end

//
//  EnsureOrderVC.m
//  MiaoSha
//
//  Created by liqiang on 16/7/16.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "EnsureOrderVC.h"
#import "EnsureOrderCell.h"
#import "Util.h"

@interface EnsureOrderVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation EnsureOrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"确认订单";
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
    
    UILabel *shiJIZhiFuLabel = [[UILabel alloc] init];
    shiJIZhiFuLabel.font = [UIFont systemFontOfSize:12];
    shiJIZhiFuLabel.textColor = [UIColor grayColor];
    shiJIZhiFuLabel.text = @"实付款：￥100";
    [footerView addSubview:shiJIZhiFuLabel];
    
    UIButton *ensureBtn = [[UIButton alloc] init];
    [ensureBtn setTitle:@"确认订单" forState:UIControlStateNormal];
    [ensureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    ensureBtn.backgroundColor = [UIColor redColor];
    ensureBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [ensureBtn addTarget:self action:@selector(ensureOrder) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:ensureBtn];
    
    footerView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0)
    .heightIs(50);
    
    shiJIZhiFuLabel.sd_layout
    .leftSpaceToView(footerView,10)
    .rightSpaceToView(footerView,80)
    .topSpaceToView(footerView,10)
    .bottomSpaceToView(footerView,0);
    
    ensureBtn.sd_layout
    .rightSpaceToView(footerView,0)
    .topSpaceToView(footerView,0)
    .bottomSpaceToView(footerView,0)
    .widthIs(80);
    
    tableView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .bottomSpaceToView(footerView,0);
}

- (void)ensureOrder
{
    
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
    EnsureOrderCell *cell = [EnsureOrderCell cellWithTableView:tableView];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

@end

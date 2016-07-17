//
//  ShouHuoDiZhiVC.m
//  MiaoSha
//
//  Created by liqiang on 16/7/4.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ShouHuoDiZhiVC.h"
#import "BianJiDiZhiVC.h"
#import "ShouHuoDiZhiListCell.h"
#import "AddShouHuoDiZhiCell.h"
#import "GuanLiShouHuoDiZhiVC.h"

@interface ShouHuoDiZhiVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ShouHuoDiZhiVC

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"收货地址";
    
    [self.dataArray addObject:[[ModelAddress alloc] init]];
    [self.dataArray addObject:[[ModelAddress alloc] init]];
    [self.dataArray addObject:[[ModelAddress alloc] init]];
    [self.dataArray addObject:[[ModelAddress alloc] init]];
    [self.dataArray addObject:[[ModelAddress alloc] init]];
    [self.dataArray addObject:[[ModelAddress alloc] init]];
    [self.dataArray addObject:[[ModelAddress alloc] init]];
    [self.dataArray addObject:[[ModelAddress alloc] init]];
    
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithTitle:@"管理" style:UIBarButtonItemStylePlain target:self action:@selector(GuanLi)];
    self.navigationItem.rightBarButtonItem = rightBarBtn;
    
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
    
    tableView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0);
}

/**
 *  管理
 */
- (void)GuanLi
{
    GuanLiShouHuoDiZhiVC *vc = [[GuanLiShouHuoDiZhiVC alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
}

#pragma mark -
#pragma mark ================= <UITableViewDelegate,UITableViewDataSource> =================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == self.dataArray.count)
    {
        AddShouHuoDiZhiCell *cell = [AddShouHuoDiZhiCell cellWithTableView:tableView];
        return cell;
    }
    
    ShouHuoDiZhiListCell *cell = [ShouHuoDiZhiListCell cellWithTableView:tableView];
    cell.model = self.dataArray[indexPath.section];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == self.dataArray.count) {
        return 60;
    }
    
    return [tableView cellHeightForIndexPath:indexPath model:self.dataArray[indexPath.section] keyPath:@"model" cellClass:[ShouHuoDiZhiListCell class] contentViewWidth:ScreenWidth];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    BianJiDiZhiVC *vc = [[BianJiDiZhiVC alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end

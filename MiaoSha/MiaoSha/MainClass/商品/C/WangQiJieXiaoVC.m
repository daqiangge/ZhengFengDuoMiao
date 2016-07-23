//
//  WangQiJieXiaoVC.m
//  MiaoSha
//
//  Created by liqiang on 16/7/22.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "WangQiJieXiaoVC.h"
#import "WangQiJieXiaoCell.h"

@interface WangQiJieXiaoVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, weak) UITableView *tableView;

@end

@implementation WangQiJieXiaoVC

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
    
    self.navigationItem.title = @"往期揭晓";
    [self drawView];
    [self requestData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)drawView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
//    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    //    tableView.tableFooterView = [self drawFooterView];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    tableView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0);
    
    tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefersh)];
    tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefersh)];
}

- (void)headerRefersh
{

}

- (void)footerRefersh
{

}

#pragma mark -
#pragma mark ================= 网络 =================
- (void)requestData
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:[BaseModel createAppKey:params] forKey:@"appKey"];
    
    [[LQHTTPSessionManager sharedManager] LQPost:@"/app/prd/period/findWinPrizeList" parameters:params showTips:@"正在加载.." success:^(id responseObject) {
        
        self.dataArray = [NSMutableArray arrayWithArray:[LQModelProductDetail mj_objectArrayWithKeyValuesArray:[responseObject valueForKey:@"periodList"]]];
        [self.tableView reloadData];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}


#pragma mark -
#pragma mark ================= <UITableViewDelegate,UITableViewDataSource> =================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"期数:123123123123213123 揭晓时间:2000-00-00 00:00:00";
        cell.textLabel.font = [UIFont systemFontOfSize:10];
        return cell;
    }
    
    WangQiJieXiaoCell *cell = [WangQiJieXiaoCell cellWithTableView:tableView];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return 30;
    }
    
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

@end

//
//  LatestAnnouncementVC.m
//  MiaoSha
//
//  Created by liqiang on 16/5/6.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "LatestAnnouncementVC.h"
#import "LatestAnnouncementCell.h"
#import "ProductDetailsVC.h"

@interface LatestAnnouncementVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, weak) UITableView *tableView;

@end

@implementation LatestAnnouncementVC

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
    
    [self drawView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self requestZuiXinJieXiao];
}

- (void)drawView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
}

#pragma mark -
#pragma mark ================= 网络 =================
/**
 *  获取最新揭晓
 */
- (void)requestZuiXinJieXiao
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"0" forKey:@"isMain"];
    
    [[LQHTTPSessionManager sharedManager] LQPost:@"/app/prd/period/findPublishPeriod" parameters:params showTips:@"正在加载.." success:^(id responseObject) {
        
        NSArray *array = [LQModelProductDetail mj_objectArrayWithKeyValuesArray:[responseObject valueForKey:@"periodList"]];
        
        [self.dataArray removeAllObjects];
        for (LQModelProductDetail *model in array)
        {
            [self.dataArray addObject:model];
        }
        
        [self.tableView reloadData];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark -
#pragma mark ================= <UITableViewDelegate,UITableViewDataSource> =================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LatestAnnouncementCell *cell = [LatestAnnouncementCell cellWithTableView:tableView];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LQModelProductDetail *model = self.dataArray[indexPath.row];
    
    ProductDetailsVC *vc = [[ProductDetailsVC alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    vc.periodId = model.sid;
    [self.navigationController pushViewController:vc animated:YES];
}

@end

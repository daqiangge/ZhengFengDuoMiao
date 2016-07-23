//
//  MiaoShaJiLuVC.m
//  MiaoSha
//
//  Created by liqiang on 16/7/3.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "MiaoShaJiLuVC.h"
#import "MiaoShaJiLu_JingXingZhongCell.h"
#import "MiaoShaJiLu_JingXingZhongCell2.h"
#import "MiaoShaJiLu_YiJieXiaoCell.h"
#import "ProductDetailsVC.h"

@interface MiaoShaJiLuVC ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, weak) UIButton *quanBuBtn;
@property (nonatomic, weak) UIButton *jingXingZhongBtn;
@property (nonatomic, weak) UIButton *yiJieXiaoBtn;
@property (nonatomic, weak) UIView *lineView;
@property (nonatomic, weak) UITableView *tableView;//全部
@property (nonatomic, weak) UITableView *yiJieXiaoTableView;
@property (nonatomic, weak) UITableView *jinXingZhongTableView;

@property (nonatomic, strong) NSMutableArray *allArray;
@property (nonatomic, strong) NSMutableArray *jinXingZhongArray;
@property (nonatomic, strong) NSMutableArray *yiJieXiaoArray;

@end

@implementation MiaoShaJiLuVC

- (NSMutableArray *)allArray
{
    if (!_allArray) {
        _allArray = [NSMutableArray array];
    }
    
    return _allArray;
}

- (NSMutableArray *)jinXingZhongArray
{
    if (!_jinXingZhongArray) {
        _jinXingZhongArray = [NSMutableArray array];
    }
    
    return _jinXingZhongArray;
}

- (NSMutableArray *)yiJieXiaoArray
{
    if (!_yiJieXiaoArray) {
        _yiJieXiaoArray = [NSMutableArray array];
    }
    
    return _yiJieXiaoArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"秒杀记录";
    
    [self drawView];
    [self requestDataWithType:@"0"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)drawView
{
    UIButton *quanBuBtn = [[UIButton alloc] init];
    [quanBuBtn setTitle:@"全部" forState:UIControlStateNormal];
    [quanBuBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [quanBuBtn setTitleColor:[UIColor colorWithRed:0.992 green:0.824 blue:0.188 alpha:1.00] forState:UIControlStateSelected];
    quanBuBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    quanBuBtn.backgroundColor = [UIColor whiteColor];
    quanBuBtn.selected = YES;
    [quanBuBtn addTarget:self action:@selector(didClickQuanBu:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:quanBuBtn];
    self.quanBuBtn = quanBuBtn;
    
    UIButton *jingXingZhongBtn = [[UIButton alloc] init];
    [jingXingZhongBtn setTitle:@"进行中" forState:UIControlStateNormal];
    [jingXingZhongBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [jingXingZhongBtn setTitleColor:[UIColor colorWithRed:0.992 green:0.824 blue:0.188 alpha:1.00] forState:UIControlStateSelected];
    jingXingZhongBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    jingXingZhongBtn.backgroundColor = [UIColor whiteColor];
    [jingXingZhongBtn addTarget:self action:@selector(didClickJingXingZhong:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:jingXingZhongBtn];
    self.jingXingZhongBtn = jingXingZhongBtn;
    
    UIButton *yiJieXiaoBtn = [[UIButton alloc] init];
    [yiJieXiaoBtn setTitle:@"已揭晓" forState:UIControlStateNormal];
    [yiJieXiaoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [yiJieXiaoBtn setTitleColor:[UIColor colorWithRed:0.992 green:0.824 blue:0.188 alpha:1.00] forState:UIControlStateSelected];
    yiJieXiaoBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    yiJieXiaoBtn.backgroundColor = [UIColor whiteColor];
    [yiJieXiaoBtn addTarget:self action:@selector(didClickYiJieXiao:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:yiJieXiaoBtn];
    self.yiJieXiaoBtn = yiJieXiaoBtn;
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor colorWithRed:0.992 green:0.824 blue:0.188 alpha:1.00];
    [self.view addSubview:lineView];
    self.lineView = lineView;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    UITableView *yiJieXiaoTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    yiJieXiaoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    yiJieXiaoTableView.delegate = self;
    yiJieXiaoTableView.dataSource = self;
    yiJieXiaoTableView.hidden = YES;
    [self.view addSubview:yiJieXiaoTableView];
    self.yiJieXiaoTableView = yiJieXiaoTableView;
    
    UITableView *jinXingZhongTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    jinXingZhongTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    jinXingZhongTableView.delegate = self;
    jinXingZhongTableView.dataSource = self;
    jinXingZhongTableView.hidden = YES;
    [self.view addSubview:jinXingZhongTableView];
    self.jinXingZhongTableView = jinXingZhongTableView;
    
    quanBuBtn.sd_layout
    .leftSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .widthIs(ScreenWidth/3)
    .heightIs(38);
    
    jingXingZhongBtn.sd_layout
    .leftSpaceToView(quanBuBtn,0)
    .topSpaceToView(self.view,0)
    .widthIs(ScreenWidth/3)
    .heightIs(38);
    
    yiJieXiaoBtn.sd_layout
    .rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .widthIs(ScreenWidth/3)
    .heightIs(38);
    
    lineView.sd_layout
    .centerXEqualToView(quanBuBtn)
    .topSpaceToView(quanBuBtn,-2)
    .widthIs(100)
    .heightIs(2);
    
    tableView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(quanBuBtn,0)
    .bottomSpaceToView(self.view,0);
    
    yiJieXiaoTableView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(quanBuBtn,0)
    .bottomSpaceToView(self.view,0);
    
    jinXingZhongTableView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(quanBuBtn,0)
    .bottomSpaceToView(self.view,0);

    
    tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefersh1)];
    jinXingZhongTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefersh2)];
    yiJieXiaoTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefersh3)];
//    tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefersh)];
}

- (void)headerRefersh1
{
    [self requestDataWithType:@"0"];
}

- (void)headerRefersh2
{
    [self requestDataWithType:@"1"];
}

- (void)headerRefersh3
{
    [self requestDataWithType:@"2"];
}

- (void)didClickQuanBu:(UIButton *)btn
{
    self.quanBuBtn.selected = NO;
    self.jingXingZhongBtn.selected = NO;
    self.yiJieXiaoBtn.selected = NO;
    
    btn.selected = YES;
    
    self.tableView.hidden = NO;
    self.yiJieXiaoTableView.hidden = YES;
    self.jinXingZhongTableView.hidden = YES;
    
    self.lineView.sd_resetLayout
    .centerXEqualToView(btn)
    .topSpaceToView(btn,-2)
    .widthIs(100)
    .heightIs(2);
    
    [self requestDataWithType:@"0"];
    
}

- (void)didClickJingXingZhong:(UIButton *)btn
{
    self.quanBuBtn.selected = NO;
    self.jingXingZhongBtn.selected = NO;
    self.yiJieXiaoBtn.selected = NO;
    
    btn.selected = YES;
    
    self.tableView.hidden = YES;
    self.yiJieXiaoTableView.hidden = YES;
    self.jinXingZhongTableView.hidden = NO;
    
    self.lineView.sd_resetLayout
    .centerXEqualToView(btn)
    .topSpaceToView(btn,-2)
    .widthIs(100)
    .heightIs(2);
    
    [self requestDataWithType:@"1"];
}

- (void)didClickYiJieXiao:(UIButton *)btn
{
    self.quanBuBtn.selected = NO;
    self.jingXingZhongBtn.selected = NO;
    self.yiJieXiaoBtn.selected = NO;
    
    btn.selected = YES;
    
    self.tableView.hidden = YES;
    self.yiJieXiaoTableView.hidden = NO;
    self.jinXingZhongTableView.hidden = YES;
    
    self.lineView.sd_resetLayout
    .centerXEqualToView(btn)
    .topSpaceToView(btn,-2)
    .widthIs(100)
    .heightIs(2);
    
    [self requestDataWithType:@"2"];
}


#pragma mark -
#pragma mark ================= 网络 =================
- (void)requestDataWithType:(NSString *)type
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [params setValue:type forKey:@"type"];
    
    [params setValue:[LQModelMember sharedMemberMySelf].sid forKey:@"userId"];
    
    [[LQHTTPSessionManager sharedManager] LQPost:@"/app/prd/order/findOrderList" parameters:params showTips:@"正在加载.." success:^(id responseObject) {
        
        if ([type isEqualToString:@"0"]) {
            self.allArray = [NSMutableArray arrayWithArray:[LQModelProductDetail mj_objectArrayWithKeyValuesArray:[responseObject valueForKey:@"orderList"]]];
            [self.tableView reloadData];
        }else if ([type isEqualToString:@"1"]){
            self.jinXingZhongArray = [NSMutableArray arrayWithArray:[LQModelProductDetail mj_objectArrayWithKeyValuesArray:[responseObject valueForKey:@"orderList"]]];
            [self.jinXingZhongTableView reloadData];
        }else if ([type isEqualToString:@"2"]){
            self.yiJieXiaoArray = [NSMutableArray arrayWithArray:[LQModelProductDetail mj_objectArrayWithKeyValuesArray:[responseObject valueForKey:@"orderList"]]];
            [self.yiJieXiaoTableView reloadData];
        }
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark -
#pragma mark ================= <UITableViewDelegate,UITableViewDataSource> =================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.tableView) {
        return self.allArray.count;
    }
    if (tableView == self.jinXingZhongTableView) {
        return self.jinXingZhongArray.count;
    }
    if (tableView == self.yiJieXiaoTableView) {
        return self.yiJieXiaoArray.count;
    }
    
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.jinXingZhongTableView)
    {
        LQModelProductDetail *model = self.jinXingZhongArray[indexPath.section];
        
        if ([model.period.status isEqualToString:@"0"])
        {
            MiaoShaJiLu_JingXingZhongCell *cell = [MiaoShaJiLu_JingXingZhongCell cellWithTableView:tableView];
            cell.model = model;
            return cell;
        }
        else if ([model.period.status isEqualToString:@"2"])
        {
            MiaoShaJiLu_JingXingZhongCell2 *cell = [MiaoShaJiLu_JingXingZhongCell2 cellWithTableView:tableView];
            cell.model = model;
            return cell;
        }
    }
    
    if (tableView == self.yiJieXiaoTableView)
    {
        MiaoShaJiLu_YiJieXiaoCell *cell = [MiaoShaJiLu_YiJieXiaoCell cellWithTableView:tableView];
        cell.model = self.yiJieXiaoArray[indexPath.section];
        return cell;
    }
    
    
    
    LQModelProductDetail *model = self.allArray[indexPath.section];
    
    if ([model.period.status isEqualToString:@"0"])
    {
        MiaoShaJiLu_JingXingZhongCell *cell = [MiaoShaJiLu_JingXingZhongCell cellWithTableView:tableView];
        cell.model = model;
        return cell;
    }
    else if ([model.period.status isEqualToString:@"1"])
    {
        MiaoShaJiLu_YiJieXiaoCell *cell = [MiaoShaJiLu_YiJieXiaoCell cellWithTableView:tableView];
        cell.model = model;
        return cell;
    }
    else
    {
        MiaoShaJiLu_JingXingZhongCell2 *cell = [MiaoShaJiLu_JingXingZhongCell2 cellWithTableView:tableView];
        cell.model = model;
        return cell;
    }
    
    return [UITableViewCell new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.jinXingZhongTableView)
    {
        LQModelProductDetail *model = self.jinXingZhongArray[indexPath.section];
        if ([model.period.status isEqualToString:@"0"])
        {
            return [tableView cellHeightForIndexPath:indexPath model:[LQModelProductDetail new] keyPath:@"model" cellClass:[MiaoShaJiLu_JingXingZhongCell class] contentViewWidth:ScreenWidth];
        }
        else if ([model.period.status isEqualToString:@"2"])
        {
            return 100;
        }
    }
    
    if (tableView == self.yiJieXiaoTableView)
    {
        return 90;
    }
    
    
    LQModelProductDetail *model = self.allArray[indexPath.section];
    if ([model.period.status isEqualToString:@"0"])
    {
        return [tableView cellHeightForIndexPath:indexPath model:[LQModelProductDetail new] keyPath:@"model" cellClass:[MiaoShaJiLu_JingXingZhongCell class] contentViewWidth:ScreenWidth];
    }
    else if ([model.period.status isEqualToString:@"1"])
    {
        return 90;
    }
    else
    {
        return 100;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.jinXingZhongTableView)
    {
        LQModelProductDetail *model = self.jinXingZhongArray[indexPath.section];
        
        ProductDetailsVC *vc = [[ProductDetailsVC alloc] init];
        vc.periodId = model.period.sid;
        [self.navigationController pushViewController:vc animated:YES];
        
        return;
    }
    
    if (tableView == self.yiJieXiaoTableView)
    {
        LQModelProductDetail *model = self.yiJieXiaoArray[indexPath.section];
        
        ProductDetailsVC *vc = [[ProductDetailsVC alloc] init];
        vc.periodId = model.period.sid;
        [self.navigationController pushViewController:vc animated:YES];
        
        return;
    }
    
    
    LQModelProductDetail *model = self.allArray[indexPath.section];
    
    ProductDetailsVC *vc = [[ProductDetailsVC alloc] init];
    vc.periodId = model.period.sid;
    [self.navigationController pushViewController:vc animated:YES];
}

@end

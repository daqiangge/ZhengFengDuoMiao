//
//  GuanLiShouHuoDiZhiVC.m
//  MiaoSha
//
//  Created by liqiang on 16/7/6.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "GuanLiShouHuoDiZhiVC.h"
#import "GuanLiShouHuoDiZhiListCell.h"

@interface GuanLiShouHuoDiZhiVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, weak) UITableView *tableView;

@end

@implementation GuanLiShouHuoDiZhiVC

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
    
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(WanCheng)];
    self.navigationItem.rightBarButtonItem = rightBarBtn;
    
    [self drawView];
}

- (void)drawView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    //    tableView.tableFooterView = [self drawFooterView];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    UIButton *quanXuanBtn = [[UIButton alloc] init];
    [quanXuanBtn setImage:[UIImage imageNamed:@"chose_big_0"] forState:UIControlStateNormal];
    [quanXuanBtn setImage:[UIImage imageNamed:@"chose_big_1"] forState:UIControlStateSelected];
    [quanXuanBtn setTitle:@"    全选" forState:UIControlStateNormal];
    [quanXuanBtn setTitle:@"    取消" forState:UIControlStateSelected];
    [quanXuanBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [quanXuanBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    quanXuanBtn.backgroundColor = [UIColor whiteColor];
    [quanXuanBtn addTarget:self action:@selector(quanXuan:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:quanXuanBtn];
    
    UIButton *deleteBtn = [[UIButton alloc] init];
    [deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
    deleteBtn.backgroundColor = [UIColor colorWithRed:0.980 green:0.373 blue:0.600 alpha:1.00];
    [deleteBtn addTarget:self action:@selector(delete) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:deleteBtn];
    
    quanXuanBtn.sd_layout
    .leftSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0)
    .heightIs(45)
    .widthRatioToView(self.view,0.5);
    
    deleteBtn.sd_layout
    .rightSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0)
    .heightIs(45)
    .widthRatioToView(self.view,0.5);
    
    tableView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .bottomSpaceToView(quanXuanBtn,0);
}

/**
 *  管理
 */
- (void)WanCheng
{
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)back
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

/**
 *  全选、取消
 */
- (void)quanXuan:(UIButton *)btn
{
    for (ModelAddress *model  in self.dataArray)
    {
        if (btn.selected) {
            model.isSelect = NO;
        }else{
            model.isSelect = YES;
        }
    }
    
    btn.selected = !btn.selected;
    
    [self.tableView reloadData];
}

/**
 *  删除
 */
- (void)delete
{

}

#pragma mark -
#pragma mark ================= <UITableViewDelegate,UITableViewDataSource> =================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GuanLiShouHuoDiZhiListCell *cell = [GuanLiShouHuoDiZhiListCell cellWithTableView:tableView];
    cell.model = self.dataArray[indexPath.section];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == self.dataArray.count) {
        return 60;
    }
    
    return [tableView cellHeightForIndexPath:indexPath model:self.dataArray[indexPath.section] keyPath:@"model" cellClass:[GuanLiShouHuoDiZhiListCell class] contentViewWidth:ScreenWidth];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == self.dataArray.count - 1)
    {
        return 10;
    }
    
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ModelAddress *model = self.dataArray[indexPath.section];
    model.isSelect = !model.isSelect;
    [tableView reloadData];
}

@end

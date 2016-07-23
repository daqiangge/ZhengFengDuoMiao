//
//  ProductDetailsVC.m
//  MiaoSha
//
//  Created by liqiang on 16/7/3.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ProductDetailsVC.h"
#import "ProductDetailsCell1.h"
#import "ProductDetailsCell2.h"
#import "ProductDetailsCell3.h"
#import "ProductDetailsCell4.h"
#import "ProductDetailsCell5.h"
#import "ProductDetailsCell6.h"
#import "ProductDetailsCell7.h"
#import "ProductDetailsCell8.h"
#import "ProductDetailsCell_1_2_1.h"
#import "WangQiJieXiaoVC.h"

@interface ProductDetailsVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) LQModelProductDetail *model;
@property (nonatomic, strong) NSMutableArray *modelBuyUserArray;

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) UIButton *leftBtn;
@property (nonatomic, weak) UIButton *rightBtn;

@end

@implementation ProductDetailsVC

- (NSMutableArray *)modelBuyUserArray
{
    if (!_modelBuyUserArray)
    {
        _modelBuyUserArray = [NSMutableArray array];
    }
    
    return _modelBuyUserArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"奖品详情";
    
    [self drawView];
    [self requestProcuctDetail];
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
    self.tableView = tableView;
    
    tableView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,35);
    
    UIButton *leftBtn = [[UIButton alloc] init];
    [leftBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    leftBtn.backgroundColor = [UIColor colorWithRed:0.992 green:0.820 blue:0.188 alpha:1.00];
    leftBtn.hidden = YES;
    [self.view addSubview:leftBtn];
    self.leftBtn = leftBtn;
    
    UIButton *rightBtn = [[UIButton alloc] init];
    [rightBtn setTitle:@"立即购买" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    rightBtn.backgroundColor = [UIColor colorWithRed:0.980 green:0.243 blue:0.573 alpha:1.00];
    rightBtn.hidden = YES;
    [self.view addSubview:rightBtn];
    self.rightBtn = rightBtn;
    
    leftBtn.sd_layout
    .leftSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0)
    .heightIs(35)
    .widthIs(ScreenWidth/2);
    
    rightBtn.sd_layout
    .leftSpaceToView(leftBtn,0)
    .bottomSpaceToView(self.view,0)
    .heightIs(35)
    .widthIs(ScreenWidth/2);
}

#pragma mark -
#pragma mark ================= 网络 =================
- (void)requestProcuctDetail
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:self.periodId forKey:@"periodId"];
    
    [[LQHTTPSessionManager sharedManager] LQPost:@"/app/prd/period/getPeriodDetail" parameters:params showTips:@"正在加载.." success:^(id responseObject) {
        NSLog(@"-->%@",responseObject);
        self.model = [LQModelProductDetail mj_objectWithKeyValues:[responseObject valueForKey:@"period"]];
        
        self.modelBuyUserArray = [NSMutableArray arrayWithArray:[LQModelBuyUser mj_objectArrayWithKeyValuesArray:[responseObject valueForKey:@"orderList"]]];
        
        [self.tableView reloadData];
        
        if ([self.model.status isEqualToString:@"0"])
        {
            self.leftBtn.hidden = NO;
            self.rightBtn.hidden = NO;
            
            self.tableView.sd_resetLayout
            .leftSpaceToView(self.view,0)
            .rightSpaceToView(self.view,0)
            .topSpaceToView(self.view,0)
            .bottomSpaceToView(self.view,35);
        }
        if ([self.model.status isEqualToString:@"1"])
        {
            self.leftBtn.hidden = YES;
            self.rightBtn.hidden = YES;
            
            self.tableView.sd_resetLayout
            .leftSpaceToView(self.view,0)
            .rightSpaceToView(self.view,0)
            .topSpaceToView(self.view,0)
            .bottomSpaceToView(self.view,0);
        }
        if ([self.model.status isEqualToString:@"2"])
        {
            self.leftBtn.hidden = YES;
            self.rightBtn.hidden = YES;
            
            self.tableView.sd_resetLayout
            .leftSpaceToView(self.view,0)
            .rightSpaceToView(self.view,0)
            .topSpaceToView(self.view,0)
            .bottomSpaceToView(self.view,0);
        }
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark -
#pragma mark ================= <UITableViewDelegate,UITableViewDataSource> =================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.model)
    {
        if (self.model.user.sid || self.model.lastUser.sid)
        {
            return 4;
        }
    }
    
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
        {
            if ([self.model.status isEqualToString:@"0"])
            {
                return 3;
            }
            if ([self.model.status isEqualToString:@"1"])
            {
                return 2;
            }
            if ([self.model.status isEqualToString:@"2"])
            {
                return 3;
            }
        }
            break;
        case 1:
        {
            if (self.model)
            {
                if (self.model.user.sid || self.model.lastUser.sid)
                {
                    return 1;
                }
            }
            
            return 2;
        }
            break;
        case 2:
        {
            if (self.model)
            {
                if (self.model.user.sid || self.model.lastUser.sid)
                {
                    return 2;
                }
            }
            return self.modelBuyUserArray.count + 1;
        }
            break;
        case 3:
        {
            return self.modelBuyUserArray.count + 1;
        }
            break;
            
        default:
            break;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
        {
            switch (indexPath.row)
            {
                case 0:
                {
                    ProductDetailsCell1 *cell = [ProductDetailsCell1 cellWithTableView:tableView];
                    
                    if (self.model)
                    {
                        cell.model = self.model;
                    }
                    
                    return cell;
                }
                    break;
                case 1:
                {
                    ProductDetailsCell2 *cell = [ProductDetailsCell2 cellWithTableView:tableView];
                    
                    if (self.model)
                    {
                        cell.model = self.model;
                    }
                    
                    return cell;
                }
                    break;
                case 2:
                {
                    if (self.model)
                    {
                        if ([self.model.status isEqualToString:@"2"])
                        {
                            ProductDetailsCell_1_2_1 *cell = [ProductDetailsCell_1_2_1 cellWithTableView:tableView];
                            cell.model = self.model;
                            return cell;
                        }
                        else if ([self.model.status isEqualToString:@"0"])
                        {
                            ProductDetailsCell3 *cell = [ProductDetailsCell3 cellWithTableView:tableView];
                            cell.model = self.model;
                            return cell;
                        }
                    }
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case 1:
        {
            if (self.model)
            {
                if (self.model.user.sid || self.model.lastUser.sid)
                {
                    ProductDetailsCell4 *cell = [ProductDetailsCell4 cellWithTableView:tableView];
                    
                    if (self.model)
                    {
                        cell.model = self.model;
                    }
                    
                    return cell;
                }
            }
            switch (indexPath.row)
            {
                case 0:
                {
                    ProductDetailsCell5 *cell = [ProductDetailsCell5 cellWithTableView:tableView];
                    return cell;
                    
                }
                    break;
                case 1:
                {
                    ProductDetailsCell6 *cell = [ProductDetailsCell6 cellWithTableView:tableView];
                    return cell;
                    
                }
                    break;
            }
        }
            break;
        case 2:
        {
            if (self.model)
            {
                if (self.model.user.sid || self.model.lastUser.sid)
                {
                    switch (indexPath.row)
                    {
                        case 0:
                        {
                            ProductDetailsCell5 *cell = [ProductDetailsCell5 cellWithTableView:tableView];
                            return cell;
                            
                        }
                            break;
                        case 1:
                        {
                            ProductDetailsCell6 *cell = [ProductDetailsCell6 cellWithTableView:tableView];
                            return cell;
                            
                        }
                            break;
                    }
                }
            }
            switch (indexPath.row)
            {
                case 0:
                {
                    ProductDetailsCell7 *cell = [ProductDetailsCell7 cellWithTableView:tableView];
                    return cell;
                    
                }
                    break;
                default:
                {
                    ProductDetailsCell8 *cell = [ProductDetailsCell8 cellWithTableView:tableView];
                    
                    if (self.model) {
                        cell.model = self.modelBuyUserArray[indexPath.row - 1];
                    }
                    
                    return cell;
                    
                }
                    break;
            }
        }
            break;
        case 3:
        {
            switch (indexPath.row)
            {
                case 0:
                {
                    ProductDetailsCell7 *cell = [ProductDetailsCell7 cellWithTableView:tableView];
                    return cell;
                    
                }
                    break;
                default:
                {
                    ProductDetailsCell8 *cell = [ProductDetailsCell8 cellWithTableView:tableView];
                    
                    if (self.model) {
                        cell.model = self.modelBuyUserArray[indexPath.row - 1];
                    }
                    
                    return cell;
                    
                }
                    break;
            }
        }
            break;
            
        default:
            break;
    }
    
    return [UITableViewCell new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
        {
            switch (indexPath.row)
            {
                case 0:
                {
                    return 178;
                }
                    break;
                case 1:
                {
                    return [tableView cellHeightForIndexPath:indexPath model:self.model keyPath:@"model" cellClass:[ProductDetailsCell2 class] contentViewWidth:ScreenWidth];
                }
                    break;
                case 2:
                {
                    if (self.model)
                    {
                        if ([self.model.status isEqualToString:@"2"])
                        {
                            return 60;
                        }
                        else if ([self.model.status isEqualToString:@"0"])
                        {
                            return [tableView cellHeightForIndexPath:indexPath model:self.model keyPath:@"model" cellClass:[ProductDetailsCell3 class] contentViewWidth:ScreenWidth];
                        }
                    }
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case 1:
        {
            if (self.model)
            {
                if (self.model.user.sid || self.model.lastUser.sid)
                {
                    return 127.5;
                }
            }
            return 45;
        }
            break;
        case 2:
        {
            if (self.model)
            {
                if (self.model.user.sid || self.model.lastUser.sid)
                {
                    return 45;
                }
            }
            return 45;
        }
            break;
        case 3:
        {
            return 45;
        }
            break;
            
        default:
            break;
    }
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10.;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 1:
        {
            if (self.model)
            {
                if (self.model.user.sid || self.model.lastUser.sid)
                {
                    return;
                }
            }
            
            if (indexPath.row == 0)
            {
                
            }
            else
            {
                WangQiJieXiaoVC *vc = [[WangQiJieXiaoVC alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
        }
            break;
            
        case 2:
        {
            if (self.model)
            {
                if (self.model.user.sid || self.model.lastUser.sid)
                {
                    if (indexPath.row == 0)
                    {
                        
                    }
                    else
                    {
                        WangQiJieXiaoVC *vc = [[WangQiJieXiaoVC alloc] init];
                        [self.navigationController pushViewController:vc animated:YES];
                    }
                }
            }
        }
            break;
            
        default:
            break;
    }
}

@end

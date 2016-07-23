//
//  RankingListVC.m
//  MiaoSha
//
//  Created by liqiang on 16/5/6.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "RankingListVC.h"
#import "RankingListCell.h"
#import "RankingListCell2.h"

@interface RankingListVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) UIButton *chongzhiWangBtn;
@property (nonatomic, weak) UIButton *miaoshaWangBtn;
@property (nonatomic, weak) UIView *lineView;

@property (nonatomic, weak) UITableView *tableView1;//充值
@property (nonatomic, weak) UITableView *tableView2;//秒杀

@property (nonatomic, strong) NSMutableArray *chongzhiWangDataArray;
@property (nonatomic, strong) NSMutableArray *miaoshaWangDataArray;

@end

@implementation RankingListVC

- (NSMutableArray *)chongzhiWangDataArray
{
    if (!_chongzhiWangDataArray) {
        _chongzhiWangDataArray = [NSMutableArray array];
    }
    
    return _chongzhiWangDataArray;
}

- (NSMutableArray *)miaoshaWangDataArray
{
    if (!_miaoshaWangDataArray) {
        _miaoshaWangDataArray = [NSMutableArray array];
    }
    
    return _miaoshaWangDataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self drawView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self requestMiaoShaWangData];
    [self requestChongZhiWangData];
}

- (void)drawView
{
    UIButton *chongzhiWangBtn = [[UIButton alloc] init];
    [chongzhiWangBtn setTitle:@"充值王" forState:UIControlStateNormal];
    [chongzhiWangBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [chongzhiWangBtn setTitleColor:[UIColor colorWithRed:0.992 green:0.824 blue:0.188 alpha:1.00] forState:UIControlStateSelected];
    chongzhiWangBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    chongzhiWangBtn.backgroundColor = [UIColor whiteColor];
    chongzhiWangBtn.selected = YES;
    [chongzhiWangBtn addTarget:self action:@selector(didClickChongzhiWangBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:chongzhiWangBtn];
    self.chongzhiWangBtn = chongzhiWangBtn;
    
    UIButton *miaoshaWangBtn = [[UIButton alloc] init];
    [miaoshaWangBtn setTitle:@"秒杀王" forState:UIControlStateNormal];
    [miaoshaWangBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [miaoshaWangBtn setTitleColor:[UIColor colorWithRed:0.992 green:0.824 blue:0.188 alpha:1.00] forState:UIControlStateSelected];
    miaoshaWangBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    miaoshaWangBtn.backgroundColor = [UIColor whiteColor];
    [miaoshaWangBtn addTarget:self action:@selector(didClickMiaoshaWangBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:miaoshaWangBtn];
    self.miaoshaWangBtn = miaoshaWangBtn;
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor colorWithRed:0.992 green:0.824 blue:0.188 alpha:1.00];
    [self.view addSubview:lineView];
    self.lineView = lineView;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    //    tableView.tableFooterView = [self drawFooterView];
    [self.view addSubview:tableView];
    self.tableView1 = tableView;
    
    UITableView *tableView2 = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView2.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView2.delegate = self;
    tableView2.dataSource = self;
    tableView2.hidden = YES;
    //    tableView.tableFooterView = [self drawFooterView];
    [self.view addSubview:tableView2];
    self.tableView2 = tableView2;
    
    
    chongzhiWangBtn.sd_layout
    .leftSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .widthIs(ScreenWidth/2)
    .heightIs(38);
    
    miaoshaWangBtn.sd_layout
    .rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .widthIs(ScreenWidth/2)
    .heightIs(38);
    
    lineView.sd_layout
    .centerXEqualToView(chongzhiWangBtn)
    .topSpaceToView(miaoshaWangBtn,-2)
    .widthIs(100)
    .heightIs(2);
    
    tableView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(chongzhiWangBtn,0)
    .bottomSpaceToView(self.view,0);
    
    tableView2.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(chongzhiWangBtn,0)
    .bottomSpaceToView(self.view,0);
}

- (void)didClickChongzhiWangBtn
{
    self.chongzhiWangBtn.selected = YES;
    self.miaoshaWangBtn.selected = NO;
    
    self.tableView1.hidden = NO;
    self.tableView2.hidden = YES;
    
    self.lineView.sd_resetLayout
    .centerXEqualToView(self.chongzhiWangBtn)
    .topSpaceToView(self.chongzhiWangBtn,-2)
    .widthIs(100)
    .heightIs(2);
}

- (void)didClickMiaoshaWangBtn
{
    self.chongzhiWangBtn.selected = NO;
    self.miaoshaWangBtn.selected = YES;
    
    self.tableView1.hidden = YES;
    self.tableView2.hidden = NO;
    
    self.lineView.sd_resetLayout
    .centerXEqualToView(self.miaoshaWangBtn)
    .topSpaceToView(self.miaoshaWangBtn,-2)
    .widthIs(100)
    .heightIs(2);
}

#pragma mark -
#pragma mark ================= 网络 =================
- (void)requestChongZhiWangData
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"2" forKey:@"type"];
    
    [[LQHTTPSessionManager sharedManager] LQPost:@"/app/prd/sort/findKing" parameters:params showTips:nil success:^(id responseObject) {
        
        self.chongzhiWangDataArray = [NSMutableArray arrayWithArray:[LQModelSort mj_objectArrayWithKeyValuesArray:[responseObject valueForKey:@"sortList"]]];
        [self.tableView1 reloadData];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

- (void)requestMiaoShaWangData
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"1" forKey:@"type"];
    
    [[LQHTTPSessionManager sharedManager] LQPost:@"/app/prd/sort/findKing" parameters:params showTips:nil success:^(id responseObject) {
        
        self.miaoshaWangDataArray = [NSMutableArray arrayWithArray:[LQModelSort mj_objectArrayWithKeyValuesArray:[responseObject valueForKey:@"sortList"]]];
        [self.tableView2 reloadData];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark -
#pragma mark ================= <UITableViewDelegate,UITableViewDataSource> =================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.tableView1) {
        return self.chongzhiWangDataArray.count;
    }
    if (tableView == self.tableView2) {
        return self.miaoshaWangDataArray.count;
    }
    
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.tableView2)
    {
        LQModelSort *model = self.miaoshaWangDataArray[indexPath.section];
        
        RankingListCell2 *cell = [RankingListCell2 cellWithTableView:tableView];
        
        cell.numlabel.text = [NSString stringWithFormat:@"%ld",indexPath.section +1];
        [cell.iconImageView sd_setImageWithURL:[NSURL URLWithString:URLSTR(model.user.appPhoto)] placeholderImage:[UIImage imageNamed:@"PHB_userImg001"]];
        cell.nameLabel.text = [NSString stringWithFormat:@"%@秒杀了%@次",model.user.name,model.seckillingCount];
        
        switch (indexPath.section)
        {
            case 0:
            {
                cell.imageViewName = @"PHB_ic_one";
            }
                break;
            case 1:
            {
                cell.imageViewName = @"PHB_ic_two";
            }
                break;
            case 2:
            {
                cell.imageViewName = @"PHB_ic_three";
            }
                break;
                
            default:
            {
                cell.imageViewName = @"PHB_ic_numberBg";
            }
                break;
        }
        
        return cell;
    }
    
    LQModelSort *model = self.chongzhiWangDataArray[indexPath.section];
    
    RankingListCell *cell = [RankingListCell cellWithTableView:tableView];
    
    cell.numlabel.text = [NSString stringWithFormat:@"%ld",indexPath.section +1];
    [cell.iconImageView sd_setImageWithURL:[NSURL URLWithString:URLSTR(model.user.appPhoto)] placeholderImage:[UIImage imageNamed:@"PHB_userImg001"]];
    cell.nameLabel.text = [NSString stringWithFormat:@"%@充值了%@元",model.user.name,model.amount];
    
    switch (indexPath.section)
    {
        case 0:
        {
            cell.imageViewName = @"PHB_ic_one";
        }
            break;
        case 1:
        {
            cell.imageViewName = @"PHB_ic_two";
        }
            break;
        case 2:
        {
            cell.imageViewName = @"PHB_ic_three";
        }
            break;
            
        default:
        {
            cell.imageViewName = @"PHB_ic_numberBg";
        }
            break;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 39;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

@end

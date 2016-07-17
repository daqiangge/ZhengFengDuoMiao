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

@interface MiaoShaJiLuVC ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, weak) UIButton *quanBuBtn;
@property (nonatomic, weak) UIButton *jingXingZhongBtn;
@property (nonatomic, weak) UIButton *yiJieXiaoBtn;
@property (nonatomic, weak) UIView *lineView;
@property (nonatomic, weak) UITableView *tableView;//全部
@property (nonatomic, weak) UITableView *yiJieXiaoTableView;
@property (nonatomic, weak) UITableView *jinXingZhongTableView;

@end

@implementation MiaoShaJiLuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"秒杀记录";
    
    [self drawView];
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
}


#pragma mark -
#pragma mark ================= <UITableViewDelegate,UITableViewDataSource> =================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.jinXingZhongTableView)
    {
        
        MiaoShaJiLu_JingXingZhongCell2 *cell = [MiaoShaJiLu_JingXingZhongCell2 cellWithTableView:tableView];
        
        return cell;
    }
    
    if (tableView == self.yiJieXiaoTableView)
    {
        
        MiaoShaJiLu_YiJieXiaoCell *cell = [MiaoShaJiLu_YiJieXiaoCell cellWithTableView:tableView];
        
        return cell;
    }
    
    MiaoShaJiLu_JingXingZhongCell *cell = [MiaoShaJiLu_JingXingZhongCell cellWithTableView:tableView];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.jinXingZhongTableView)
    {
        return 120;
    }
    
    if (tableView == self.yiJieXiaoTableView)
    {
        return 100;
    }
    
    return [tableView cellHeightForIndexPath:indexPath model:[BaseModel new] keyPath:@"model" cellClass:[MiaoShaJiLu_JingXingZhongCell class] contentViewWidth:ScreenWidth];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

@end

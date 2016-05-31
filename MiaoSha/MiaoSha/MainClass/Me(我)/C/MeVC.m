//
//  MeVC.m
//  lingdaozhe
//
//  Created by liqiang on 16/4/20.
//  Copyright © 2016年 bckj. All rights reserved.
//

#import "MeVC.h"

@interface MeVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self drawView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}

- (void)drawView
{
    UIView *starBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 20)];
    starBarView.backgroundColor = [UIColor colorWithRed:0.992 green:0.820 blue:0.188 alpha:1.00];
    [self.view addSubview:starBarView];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableHeaderView = [self drawHeaderView];
    [self.view addSubview:tableView];
    
    tableView.sd_layout
    .topSpaceToView(starBarView,0)
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0);
}

- (UIView *)drawHeaderView
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 123)];
    headerView.backgroundColor = [UIColor redColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    imageView.backgroundColor = [UIColor blueColor];
    [headerView addSubview:imageView];
    
    imageView.sd_layout
    .leftSpaceToView(headerView,0)
    .rightSpaceToView(headerView,0)
    .topSpaceToView(headerView,0)
    .bottomSpaceToView(headerView,0);
    
    return headerView;
}

#pragma mark -
#pragma mark ================= <UITableViewDelegate,UITableViewDataSource> =================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 6;
    }
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UITableViewCell new];
}
@end

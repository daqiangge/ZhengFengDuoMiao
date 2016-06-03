//
//  RankingListVC.m
//  MiaoSha
//
//  Created by liqiang on 16/5/6.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "RankingListVC.h"
#import "RankingListCell.h"

@interface RankingListVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation RankingListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    
    tableView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0);
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
    RankingListCell *cell = [RankingListCell cellWithTableView:tableView];
    
    switch (indexPath.section)
    {
        case 0:
        {
            cell.rankingNumImageView.image = [UIImage imageNamed:@"PHB_ic_one"];
        }
            break;
        case 1:
        {
            cell.rankingNumImageView.image = [UIImage imageNamed:@"PHB_ic_two"];
        }
            break;
        case 2:
        {
            cell.rankingNumImageView.image = [UIImage imageNamed:@"PHB_ic_three"];
        }
            break;
            
        default:
        {
            cell.rankingNumImageView.image = [UIImage imageNamed:@"PHB_ic_numberBg"];
        }
            break;
    }
    
    return cell;
    
    return [UITableViewCell new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 39;
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

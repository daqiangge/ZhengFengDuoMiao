//
//  LatestAnnouncementVC.m
//  MiaoSha
//
//  Created by liqiang on 16/5/6.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "LatestAnnouncementVC.h"
#import "LatestAnnouncementCell.h"

@interface LatestAnnouncementVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArray;

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

- (void)drawView
{
    NSDate *nowDate = [NSDate date];
    long nowTimeInterval = [NSDate timeIntervalWithDate:nowDate];
    ModelLatestAnnouncement *model = [[ModelLatestAnnouncement alloc] init];
    model.state = 1;
    model.time = nowTimeInterval + arc4random()%1000;
    
    [self.dataArray addObject:model];
    ModelLatestAnnouncement *model3 = [[ModelLatestAnnouncement alloc] init];
    model3.state = 1;
    model3.time = nowTimeInterval + arc4random()%1000;
    [self.dataArray addObject:model3];
    ModelLatestAnnouncement *model4 = [[ModelLatestAnnouncement alloc] init];
    model4.state = 1;
    model4.time = nowTimeInterval + arc4random()%1000;
    [self.dataArray addObject:model4];
    
    ModelLatestAnnouncement *model2 = [[ModelLatestAnnouncement alloc] init];
    model2.state = 0;
    model.time = nowTimeInterval + arc4random()%1000;
    [self.dataArray addObject:model2];
    [self.dataArray addObject:model2];
    [self.dataArray addObject:model2];
    [self.dataArray addObject:model2];
    [self.dataArray addObject:model2];
    
    
    
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
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
    return 109;
}

@end

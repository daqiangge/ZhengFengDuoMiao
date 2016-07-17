//
//  WoDeShaiDanVC.m
//  MiaoSha
//
//  Created by liqiang on 16/7/4.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "WoDeShaiDanVC.h"
#import "ShowOrderCell.h"

@interface WoDeShaiDanVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArray;


@end

@implementation WoDeShaiDanVC

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    
    return _dataArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"晒单记录";
    
    [self drawView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)drawView
{
    ModelOrder *model = [[ModelOrder alloc] init];
    model.name = @"王先生";
    model.date = @"2016-09-09";
    model.joinNum = @"333";
    model.content = @"飒飒大师大师的说大声大声大声大声道撒飒大声大声道撒大声大声道撒大声大声道撒大声大声道撒大声大声道撒飒大师的";
    model.picArray = @[@"http://ww2.sinaimg.cn/mw690/006gEoYogw1f4thgwt71jj30qo140wl8.jpg",@"http://ww2.sinaimg.cn/mw690/006gEoYogw1f4thgwt71jj30qo140wl8.jpg",@"http://ww2.sinaimg.cn/mw690/006gEoYogw1f4thgwt71jj30qo140wl8.jpg",@"http://ww2.sinaimg.cn/mw690/006gEoYogw1f4thgwt71jj30qo140wl8.jpg",@"http://ww2.sinaimg.cn/mw690/006gEoYogw1f4thgwt71jj30qo140wl8.jpg"];
    //    model.picArray = @[@"pic0.jpg",@"pic0.jpg",@"pic0.jpg",@"pic0.jpg",@"pic0.jpg",@"pic0.jpg",@"pic0.jpg",@"pic0.jpg",@"pic0.jpg"];
    model.qishu = @"20180909";
    model.shangpingName = @"保时捷保时捷保时捷保时捷保时捷保时捷保时捷保时捷保时捷保时捷保时捷保时捷保时捷保时捷保时捷保时捷保时捷保时捷保时捷保时捷保时捷保时捷保时捷保时捷";
    [self.dataArray addObject:model];
    [self.dataArray addObject:model];
    [self.dataArray addObject:model];
    [self.dataArray addObject:model];
    [self.dataArray addObject:model];
    [self.dataArray addObject:model];
    [self.dataArray addObject:model];
    [self.dataArray addObject:model];
    [self.dataArray addObject:model];
    [self.dataArray addObject:model];
    [self.dataArray addObject:model];
    [self.dataArray addObject:model];
    [self.dataArray addObject:model];
    [self.dataArray addObject:model];
    [self.dataArray addObject:model];
    [self.dataArray addObject:model];
    [self.dataArray addObject:model];
    
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
    ShowOrderCell *cell = [ShowOrderCell cellWithTableView:tableView];
    [cell useCellFrameCacheWithIndexPath:indexPath tableView:tableView];
    cell.model = self.dataArray[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id model = self.dataArray[indexPath.row];
    return [tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[ShowOrderCell class] contentViewWidth:ScreenWidth];
}

@end

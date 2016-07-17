//
//  OrderPayVC.m
//  MiaoSha
//
//  Created by liqiang on 16/7/16.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "OrderPayVC.h"
#import "EnsureOrderCell.h"

@interface OrderPayVC ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation OrderPayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title  = @"支付订单";
    
    [self drawView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)drawView
{
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
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }
    if (section == 1) {
        return 3;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        EnsureOrderCell *cell = [EnsureOrderCell cellWithTableView:tableView];
        
        if (indexPath.row == 0)
        {
            cell.label1.textColor = [UIColor blackColor];
            cell.label1.text = @"订单提交成功，只差最后一步支付就可以啦！";
            cell.label2.text = @"";
        }else{
            cell.label1.textColor = [UIColor grayColor];
            cell.label1.text = @"商品合计";
            cell.label2.text = @"￥100";
            cell.label2.textColor = [UIColor redColor];
        }
        
        return cell;
    }
    
    if (indexPath.section == 1)
    {
        if (indexPath.row == 0)
        {
            EnsureOrderCell *cell = [EnsureOrderCell cellWithTableView:tableView];
            cell.label1.textColor = [UIColor grayColor];
            cell.label1.text = @"其他支付方式";
            cell.label2.text = @"￥100";
            cell.label2.textColor = [UIColor redColor];
            
            return cell;
        }else{
        
        }
    }
    return [UITableViewCell new];
}

@end

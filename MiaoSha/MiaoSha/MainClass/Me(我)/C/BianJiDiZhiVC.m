//
//  BianJiDiZhiVC.m
//  MiaoSha
//
//  Created by liqiang on 16/7/6.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "BianJiDiZhiVC.h"
#import "BianJiDiZhiCell.h"
#import "BianJiDiZhiCell2.h"
#import "SheZhiMoRenDiZhiBtnCell.h"
#import "AddressPickView.h"


@interface BianJiDiZhiVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) ModelAddress *model;

@end

@implementation BianJiDiZhiVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"编辑地址";
    
    [self drawView];
}

- (void)dealloc
{
    NSLog(@"%@释放了",NSStringFromClass(self.class));
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
#pragma mark ================= 网络 =================
- (void)requestAddAddress
{
    
}


#pragma mark -
#pragma mark ================= <UITableViewDelegate,UITableViewDataSource> =================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1) {
        return 1;
    }
    
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        SheZhiMoRenDiZhiBtnCell *cell = [SheZhiMoRenDiZhiBtnCell cellWithTableView:tableView];
        
        return cell;
    }
    
    NSArray *array = @[@"收货人",@"联系电话",@"省、市、区",@"详细地址"];
    BianJiDiZhiCell2 *cell = [BianJiDiZhiCell2 cellWithTableView:tableView];
    cell.label.text = array[indexPath.row];
    
    if (indexPath.row == 2)
    {
        cell.arrowImageView.hidden = NO;
        cell.textField.enabled = NO;
    }
    else
    {
        cell.arrowImageView.hidden = YES;
        cell.textField.enabled = YES;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 2)
    {
        AddressPickView *addressPickView = [AddressPickView shareInstance];
        [self.view addSubview:addressPickView];
        addressPickView.block = ^(NSString *province,NSString *city,NSString *town){
//            _label.text = [NSString stringWithFormat:@"%@ %@ %@",province,city,town] ;
            
        };
    }
}

@end

//
//  SheZhiVC.m
//  MiaoSha
//
//  Created by liqiang on 16/7/11.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "SheZhiVC.h"
#import "MeCell.h"
#import "TuiChuDengLuCell.h"
#import "LoginVC.h"

#define TitleArray @[@[@"个人资料",@"修改密码"],@[@"清除缓存"],@[@"关于我们",@"鼓励一下吧"],@[@""]]

@interface SheZhiVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, copy) NSString *huanCunStr;
@property (nonatomic, weak) UITableView *tableView;
@end

@implementation SheZhiVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"设置";
    
    self.huanCunStr = [NSString stringWithFormat:@"%dM",arc4random()%20];
    
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
    return [TitleArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = TitleArray[section];
    return [array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == [TitleArray count]-1)
    {
        TuiChuDengLuCell *cell = [TuiChuDengLuCell cellWithTableView:tableView];
        
        return cell;
    }
    
    MeCell *cell = [MeCell cellWithTableView:tableView];
    cell.iconImageView.image = [UIImage imageNamed:TitleArray[indexPath.section][indexPath.row]];
    cell.label.text = TitleArray[indexPath.section][indexPath.row];
    
    if (indexPath.section == 1) {
        cell.detailLabel.text = self.huanCunStr;
    }else{
        cell.detailLabel.text = @"";
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == [TitleArray count]-1)
    {
        return 60;
    }
    
    return 39;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == [TitleArray count]-1)
    {
        [[LQModelMember sharedMemberMySelf] logOut];
        [self.navigationController popViewControllerAnimated:YES];
        
        return;
    }
    
    
    if (indexPath.section == 1)
    {
        __weak typeof(self) weakSelf = self;
        [UIAlertView showAlertViewWithTitle:@"是否清楚缓存" message:nil cancelButtonTitle:@"取消" otherButtonTitles:@[@"确定"] onDismiss:^(int buttonIndex) {
            
            [LCProgressHUD showLoading:@"正在清除，请稍等"];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [LCProgressHUD hide];
                weakSelf.huanCunStr = @"0M";
                [weakSelf.tableView reloadData];
            });
            
        } onCancel:^{
            
        }];
    }
    
}

@end

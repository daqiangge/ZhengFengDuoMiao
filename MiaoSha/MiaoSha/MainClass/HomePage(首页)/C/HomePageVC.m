//
//  HomePageVC.m
//  lingdaozhe
//
//  Created by liqiang on 16/4/20.
//  Copyright © 2016年 bckj. All rights reserved.
//

#import "HomePageVC.h"
#import "ScrollImage.h"
#import "LCFInfiniteScrollView.h"
#import "NextViewController.h"
#import "SDWebImageCompat.h"
#import "UIColor+LCFImageAdditions.h"
#import "ProductDetailsVC.h"
#import "HomePageCollectionCell1.h"
#import "HomePageCollectionCell2.h"
#import "HomePageCollectionCell3.h"
#import "HomePageCollectionCell4.h"
#import "HomePageCollectionCell5.h"
#import "LQTouTiaoView.h"

#import "LQModelPicture.h"

#import "LSNetworkingScrollView.h"

@interface HomePageVC ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,ScrollImageDelegate>

@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, strong) LCFInfiniteScrollView *infiniteScrollView;

@property (nonatomic, strong) NSMutableArray *modelPictureArray;
@property (nonatomic, strong) NSMutableArray *modelLunBoZhongJiangArray;
@property (nonatomic, strong) NSMutableArray *modelZuiXingJieXiaoArray;

@property (nonatomic, strong) NSMutableArray *fengMiaoQuArray;
@property (nonatomic, strong) NSMutableArray *kuangZhanQuArray;
@property (nonatomic, strong) NSMutableArray *yuanMengQuArray;
@property (nonatomic, assign) int seleIndex;

@end

@implementation HomePageVC

- (NSMutableArray *)modelZuiXingJieXiaoArray
{
    if (!_modelZuiXingJieXiaoArray)
    {
        _modelZuiXingJieXiaoArray = [NSMutableArray array];
    }
    
    return _modelZuiXingJieXiaoArray;
}

- (NSMutableArray *)modelLunBoZhongJiangArray
{
    if (!_modelLunBoZhongJiangArray)
    {
        _modelLunBoZhongJiangArray = [NSMutableArray array];
    }
    
    return _modelLunBoZhongJiangArray;
}

- (NSMutableArray *)modelPictureArray
{
    if (!_modelPictureArray)
    {
        _modelPictureArray = [NSMutableArray array];
    }
    
    return _modelPictureArray;
}

- (NSMutableArray *)fengMiaoQuArray
{
    if (!_fengMiaoQuArray)
    {
        _fengMiaoQuArray = [NSMutableArray array];
    }
    
    return _fengMiaoQuArray;
}

- (NSMutableArray *)kuangZhanQuArray
{
    if (!_kuangZhanQuArray)
    {
        _kuangZhanQuArray = [NSMutableArray array];
    }
    
    return _kuangZhanQuArray;
}

- (NSMutableArray *)yuanMengQuArray
{
    if (!_yuanMengQuArray)
    {
        _yuanMengQuArray = [NSMutableArray array];
    }
    
    return _yuanMengQuArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *leftBarBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_search"] style:UIBarButtonItemStylePlain target:self action:@selector(didSearch)];
    self.navigationItem.leftBarButtonItem = leftBarBtn;
    
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_msg"] style:UIBarButtonItemStylePlain target:self action:@selector(didSearch)];
    self.navigationItem.rightBarButtonItem = rightBarBtn;
    
    self.seleIndex = 1;
    
    [self drawView];
    [self drawHeaderView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self requestLunBoTu];
    [self requestLunBoZhongJiang];
    [self requestZuiXinJieXiao];
}

- (void)drawView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor colorWithRed:0.906 green:0.910 blue:0.914 alpha:1.00];
    collectionView.contentInset = UIEdgeInsetsMake(150, 0, 0, 0);
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    
    [collectionView registerClass:[HomePageCollectionCell1 class] forCellWithReuseIdentifier:@"HomePageCollectionCell1"];
    [collectionView registerClass:[HomePageCollectionCell2 class] forCellWithReuseIdentifier:@"HomePageCollectionCell2"];
    [collectionView registerClass:[HomePageCollectionCell3 class] forCellWithReuseIdentifier:@"HomePageCollectionCell3"];
    [collectionView registerClass:[HomePageCollectionCell4 class] forCellWithReuseIdentifier:@"HomePageCollectionCell4"];
    [collectionView registerClass:[HomePageCollectionCell5 class] forCellWithReuseIdentifier:@"HomePageCollectionCell5"];
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"AAA"];
    
    collectionView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0);
}

- (void)drawHeaderView
{
    self.infiniteScrollView = [[LCFInfiniteScrollView alloc] initWithFrame:CGRectMake(0, -150, ScreenWidth, 150)];
    self.infiniteScrollView.itemSize = CGSizeMake(ScreenWidth, 150);
    self.infiniteScrollView.itemSpacing = 0;
    self.infiniteScrollView.autoscroll = YES;
    self.infiniteScrollView.timeInterval = 1.5;
    UIColor *color = [UIColor colorWithRed:237 / 255.0 green:237 / 255.0 blue:237 / 255.0 alpha:1];
    self.infiniteScrollView.placeholderImage = [color lcf_imageSized:CGSizeMake(ScreenWidth, 150)];
    [self.collectionView addSubview:self.infiniteScrollView];
    
    self.infiniteScrollView.didSelectItemAtIndex = ^(NSUInteger index) {
        NSLog(@"didSelectItemAtIndex: %@", @(index));
    };
//        NSMutableArray *array2 = [NSMutableArray array];
//    for (NSString *urlStr in array1)
//    {
//        LCFInfiniteScrollViewItem *item = [LCFInfiniteScrollViewItem itemWithImageURL:urlStr text:nil];
//        [array2 addObject:item];
//    }
//    self.infiniteScrollView.items = array2;
}

- (void)didSearch
{

}

#pragma mark -
#pragma mark ================= ICollectionViewDelegate,UICollectionViewDataSource =================
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 1;
    }
    if (section == 1)
    {
        return self.modelZuiXingJieXiaoArray.count+1;
    }
    if (section == 2)
    {
        switch (self.seleIndex)
        {
            case 1:
            {
                return 4;
            }
                break;
            case 2:
            {
                return 8;
            }
                break;
            case 3:
            {
                return 13;
            }
                break;
                
            default:
                break;
        }
    }
    
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        HomePageCollectionCell1 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomePageCollectionCell1" forIndexPath:indexPath];
        cell.titleArray = self.modelLunBoZhongJiangArray;
        return cell;
    }
    
    if (indexPath.section == 1)
    {
        if (indexPath.row == 0)
        {
            HomePageCollectionCell2 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomePageCollectionCell2" forIndexPath:indexPath];
            return cell;
        }else{
            HomePageCollectionCell3 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomePageCollectionCell3" forIndexPath:indexPath];
            cell.model = self.modelZuiXingJieXiaoArray[indexPath.row-1];
            return cell;
        }
    }
    
    if (indexPath.section == 2)
    {
        if (indexPath.row == 0)
        {
            HomePageCollectionCell4 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomePageCollectionCell4" forIndexPath:indexPath];
            
            __weak typeof(self) weakSelf = self;
            cell.clickFengMiaoQuBlock = ^(){
                weakSelf.seleIndex = 1;
                [weakSelf.collectionView reloadData];
            };
            cell.clickKuangZhanQuBlock = ^(){
                weakSelf.seleIndex = 2;
                [weakSelf.collectionView reloadData];
            };
            cell.clickYuanMengQuBlock = ^(){
                weakSelf.seleIndex = 3;
                [weakSelf.collectionView reloadData];
            };
            
            return cell;
        }else{
            HomePageCollectionCell5 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomePageCollectionCell5" forIndexPath:indexPath];
            return cell;
        }
    }
    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AAA" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

//每一个cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return CGSizeMake(ScreenWidth, 30);
    }
    
    if (indexPath.section == 1)
    {
        if (indexPath.row == 0)
        {
            return CGSizeMake(ScreenWidth, 40);
        }
        else
        {
            return CGSizeMake((ScreenWidth-1)/3, 120);
        }
    }
    
    if (indexPath.section == 2)
    {
        if (indexPath.row == 0)
        {
            return CGSizeMake(ScreenWidth, 40);
        }
        else
        {
            return CGSizeMake((ScreenWidth-2)/2, 150);
        }
    }
    
    return CGSizeMake(0, 0);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section == 0)
    {
        return UIEdgeInsetsMake(0, 0, 10, 0);
    }
    if (section == 1)
    {
        return UIEdgeInsetsMake(0, 0, 10, 1);
    }
    
    if (section == 2)
    {
        return UIEdgeInsetsMake(0, 0, 10, 1);
    }
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    if (section == 0)
    {
        return 0.;
    }
    if (section == 1)
    {
        return 1.;
    }
    if (section == 2)
    {
        return 1.;
    }
    
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if (section == 0)
    {
        return 0.;
    }
    if (section == 1)
    {
        return 0;
    }
    if (section == 2)
    {
        return 1;
    }
    
    return 0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1)
    {
        if (indexPath.row != 0)
        {
            LQModelProductDetail *model = self.modelZuiXingJieXiaoArray[indexPath.row -1];
            
            ProductDetailsVC *vc = [[ProductDetailsVC alloc] init];
            vc.addedId = model.added.sid;
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    if (indexPath.section == 2)
    {
        if (indexPath.row != 0)
        {
            ProductDetailsVC *vc = [[ProductDetailsVC alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

#pragma mark -
#pragma mark ================= 网络 =================
/**
 *  获取轮播图
 */
- (void)requestLunBoTu
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"0" forKey:@"type"];
    
    [[LQHTTPSessionManager sharedManager] LQPost:@"/app/sys/user/getImages" parameters:params showTips:@"正在加载.." success:^(id responseObject) {
        
        NSArray *array = [LQModelPicture mj_objectArrayWithKeyValuesArray:[responseObject valueForKey:@"appPictureList"]];
        
        [self.modelPictureArray removeAllObjects];
        for (LQModelPicture *model in array)
        {
            LCFInfiniteScrollViewItem *item = [LCFInfiniteScrollViewItem itemWithImageURL:URLSTR(model.appPath) text:@""];
            [self.modelPictureArray addObject:item];
        }
        self.infiniteScrollView.items = self.modelPictureArray;
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

/**
 *  轮播中奖信息
 */
- (void)requestLunBoZhongJiang
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"5" forKey:@"count"];
    
    [[LQHTTPSessionManager sharedManager] LQPost:@"/app/prd/added/findNewPublish" parameters:params showTips:@"正在加载.." success:^(id responseObject) {
        
        NSArray *array = [LQModelLunBoZhongJiang mj_objectArrayWithKeyValuesArray:[responseObject valueForKey:@"messageList"]];
        
        [self.modelLunBoZhongJiangArray removeAllObjects];
        for (LQModelLunBoZhongJiang *model in array)
        {
            [self.modelLunBoZhongJiangArray addObject:model.message];
        }
        
        [self.collectionView reloadData];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

/**
 *  获取最新揭晓
 */
- (void)requestZuiXinJieXiao
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"1" forKey:@"isMain"];
    
    [[LQHTTPSessionManager sharedManager] LQPost:@"/app/prd/record/findPublish" parameters:params showTips:@"正在加载.." success:^(id responseObject) {
        
        NSArray *array = [LQModelProductDetail mj_objectArrayWithKeyValuesArray:[responseObject valueForKey:@"recordList"]];

        [self.modelZuiXingJieXiaoArray removeAllObjects];
        for (LQModelProductDetail *model in array)
        {
            [self.modelZuiXingJieXiaoArray addObject:model];
        }
        
        [self.collectionView reloadData];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark -
#pragma mark ================= <UITableViewDelegate,UITableViewDataSource> =================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UITableViewCell new];
}

@end

//
//  HomePageVC.m
//  lingdaozhe
//
//  Created by liqiang on 16/4/20.
//  Copyright © 2016年 bckj. All rights reserved.
//

#import "HomePageVC.h"
#import "ScrollImage.h"
#import "NextViewController.h"
#import "LCFInfiniteScrollView.h"
#import "UIColor+LCFImageAdditions.h"
#import "HomePageCollectionCell1.h"
#import "HomePageCollectionCell2.h"
#import "HomePageCollectionCell3.h"
#import "HomePageCollectionCell4.h"
#import "HomePageCollectionCell5.h"

@interface HomePageVC ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,ScrollImageDelegate>

@property (nonatomic, strong) LCFInfiniteScrollView *infiniteScrollView;
@property (nonatomic, weak) UICollectionView *collectionView;
@end

@implementation HomePageVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *leftBarBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_search"] style:UIBarButtonItemStylePlain target:self action:@selector(didSearch)];
    self.navigationItem.leftBarButtonItem = leftBarBtn;
    
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_msg"] style:UIBarButtonItemStylePlain target:self action:@selector(didSearch)];
    self.navigationItem.rightBarButtonItem = rightBarBtn;
    
    [self drawView];
    [self drawHeaderView];
//    [self request];
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
    
    /** 网络图片 **/
    NSArray *array1 = @[@"http://ww2.sinaimg.cn/mw690/006gEoYogw1f4thgwt71jj30qo140wl8.jpg",@"http://ww2.sinaimg.cn/mw690/006gEoYogw1f4thgwt71jj30qo140wl8.jpg",@"http://ww2.sinaimg.cn/mw690/006gEoYogw1f4thgwt71jj30qo140wl8.jpg",@"http://ww2.sinaimg.cn/mw690/006gEoYogw1f4thgwt71jj30qo140wl8.jpg",@"http://ww2.sinaimg.cn/mw690/006gEoYogw1f4thgwt71jj30qo140wl8.jpg",@"http://ww2.sinaimg.cn/mw690/006gEoYogw1f4thgwt71jj30qo140wl8.jpg",@"http://ww2.sinaimg.cn/mw690/006gEoYogw1f4thgwt71jj30qo140wl8.jpg",@"http://ww2.sinaimg.cn/mw690/006gEoYogw1f4thgwt71jj30qo140wl8.jpg"];
    NSMutableArray *array2 = [NSMutableArray array];
    for (NSString *urlStr in array1)
    {
        LCFInfiniteScrollViewItem *item = [LCFInfiniteScrollViewItem itemWithImageURL:urlStr text:nil];
        [array2 addObject:item];
    }
    self.infiniteScrollView.items = array2;
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
        return 4;
    }
    if (section == 2)
    {
        return 10;
    }
    
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        HomePageCollectionCell1 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomePageCollectionCell1" forIndexPath:indexPath];
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
            return cell;
        }
    }
    
    if (indexPath.section == 2)
    {
        if (indexPath.row == 0)
        {
            HomePageCollectionCell4 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomePageCollectionCell4" forIndexPath:indexPath];
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
            return CGSizeMake((ScreenWidth-1)/3, 120);
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

#pragma mark -
#pragma mark ================= 网络 =================
- (void)request
{
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 3; i++) {
        
        LCFInfiniteScrollViewItem *item = [LCFInfiniteScrollViewItem itemWithImageURL:@"http://a.hiphotos.baidu.com/image/pic/item/f9dcd100baa1cd11daf25f19bc12c8fcc3ce2d46.jpg" text:@"啊实打实大师的"];
        [array addObject:item];
        
    }
    
    self.infiniteScrollView.items = array;
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

//
//  HomePageVC.m
//  lingdaozhe
//
//  Created by liqiang on 16/4/20.
//  Copyright © 2016年 bckj. All rights reserved.
//

#import "HomePageVC.h"
#import "LCFInfiniteScrollView.h"
#import "UIColor+LCFImageAdditions.h"

@interface HomePageVC ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) LCFInfiniteScrollView *infiniteScrollView;

@property (nonatomic, assign) CGSize itemSize;
@property (nonatomic, assign) CGFloat itemSpacing;

@property (nonatomic, copy) NSArray<LCFInfiniteScrollViewItem *> *items;

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
    [self request];
}

- (void)drawView
{
//    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64) style:UITableViewStyleGrouped];
//    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    tableView.delegate = self;
//    tableView.dataSource = self;
//    [self.view addSubview:tableView];
//    self.tableView = tableView;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    UICollectionView *photoCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:layout];
    [photoCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    photoCollectionView.backgroundColor = [UIColor whiteColor];
    photoCollectionView.delaysContentTouches = NO;
    photoCollectionView.dataSource = self;
    photoCollectionView.delegate = self;
    [self.view addSubview:photoCollectionView];
}

- (UIView *)drawHeaderView
{
    self.infiniteScrollView = [[LCFInfiniteScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, self.itemSize.height)];
    [self.view addSubview:self.infiniteScrollView];
    //    self.tableView.tableHeaderView = self.infiniteScrollView;
    
    self.infiniteScrollView.itemSize = self.itemSize;
    self.infiniteScrollView.itemSpacing = self.itemSpacing;
    
    self.infiniteScrollView.autoscroll = YES;
    self.infiniteScrollView.timeInterval = 1.5;
    
    UIColor *color = [UIColor colorWithRed:237 / 255.0 green:237 / 255.0 blue:237 / 255.0 alpha:1];
    self.infiniteScrollView.placeholderImage = [color lcf_imageSized:self.itemSize];
    
    self.infiniteScrollView.didSelectItemAtIndex = ^(NSUInteger index) {
        NSLog(@"didSelectItemAtIndex: %@", @(index));
    };
    
    return self.infiniteScrollView;
}

- (CGSize)itemSize
{
    return CGSizeMake(ScreenWidth, 150);
}

- (CGFloat)itemSpacing
{
    return 0;
}


- (void)didSearch
{

}

#pragma mark -
#pragma mark ================= ICollectionViewDelegate,UICollectionViewDataSource =================
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 3;
    }
    
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [UICollectionViewCell new];
}


//定义并返回每个headerView或footerView
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//
//}


//每一个cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return CGSizeMake((ScreenWidth - 2)/3, (ScreenWidth - 2)/3);
    }
    else
    {
        return CGSizeMake((ScreenWidth - 1)/2, (ScreenWidth - 1)/2);
    }
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

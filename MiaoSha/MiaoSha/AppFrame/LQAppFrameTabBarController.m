//
//  LQAppFrameTabBarController.m
//  我的框架
//
//  Created by liqiang on 16/3/24.
//  Copyright © 2016年 Liqiang. All rights reserved.
//

#import "LQAppFrameTabBarController.h"
#import "LatestAnnouncementVC.h"
#import "RankingListVC.h"
#import "ShowOrderVC.h"
#import "MeVC.h"
#import "HomePageVC.h"

#define kClassKey   @"rootVCClassString"
#define kTitleKey   @"title"
#define kImgKey     @"imageName"
#define kSelImgKey  @"selectedImageName"
#define kSupportPortraitOnly @"supportPortraitOnly"

@interface LQAppFrameTabBarController ()

@end

@implementation LQAppFrameTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tab_bg"];
    
    NSArray *childItemsArray = @[
                                 @{kClassKey  : @"HomePageVC",
                                   kTitleKey  : @"首页",
                                   kImgKey    : @"tab_ic_home-grey",
                                   kSelImgKey : @"tab_ic_home-orange",
                                   kSupportPortraitOnly :[NSNumber numberWithBool:NO]},
                                 
                                 @{kClassKey  : @"LatestAnnouncementVC",
                                   kTitleKey  : @"最新揭晓",
                                   kImgKey    : @"tab_ic_zxjx-grey",
                                   kSelImgKey : @"tab_ic_zxjx-orange",
                                   kSupportPortraitOnly :[NSNumber numberWithBool:NO]},
                                 
                                 @{kClassKey  : @"ShowOrderVC",
                                   kTitleKey  : @"晒单",
                                   kImgKey    : @"tab_ic_sd-grey",
                                   kSelImgKey : @"tab_ic_sd-orange",
                                   kSupportPortraitOnly :[NSNumber numberWithBool:NO]},
                                 
                                 @{kClassKey  : @"RankingListVC",
                                   kTitleKey  : @"排行榜",
                                   kImgKey    : @"tab_ic_phb-grey",
                                   kSelImgKey : @"tab_ic_phb-orange",
                                   kSupportPortraitOnly :[NSNumber numberWithBool:NO]},
                                 
                                 @{kClassKey  : @"MeVC",
                                   kTitleKey  : @"我",
                                   kImgKey    : @"tab_ic_me-grey",
                                   kSelImgKey : @"tab_ic_me-orange",
                                   kSupportPortraitOnly :[NSNumber numberWithBool:NO]} ];
    
    __weak typeof(self) weakSelf = self;
    [childItemsArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        UIViewController *vc = [NSClassFromString(dict[kClassKey]) new];
        vc.title = dict[kTitleKey];
        BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
        UITabBarItem *item = nav.tabBarItem;
        item.title = dict[kTitleKey];
        item.image = [UIImage imageNamed:dict[kImgKey]];
        item.selectedImage = [[UIImage imageNamed:dict[kSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : LQRGBColor(255, 210, 0, 1)} forState:UIControlStateSelected];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : LQRGBColor(153, 153, 153, 1)} forState:UIControlStateNormal];
        [weakSelf addChildViewController:nav];
    }];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    BaseNavigationController *nav = self.selectedViewController;
    UIViewController *vc = nav.topViewController;
    
    if ([vc isKindOfClass:[ChildBaseViewController class]] || [vc isKindOfClass:[MainBaseViewController class]])
    {
        return UIInterfaceOrientationPortrait == toInterfaceOrientation;
    }
    else
    {
        return [vc shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];
    }
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    BaseNavigationController *nav = self.selectedViewController;
    UIViewController *vc = nav.topViewController;
    
    if ([vc isKindOfClass:[ChildBaseViewController class]] || [vc isKindOfClass:[MainBaseViewController class]])
    {
        return UIInterfaceOrientationMaskPortrait;
    }
    else
    {
        return [vc supportedInterfaceOrientations];
    }
}

// New Autorotation support.
- (BOOL)shouldAutorotate
{
    BaseNavigationController *nav = self.selectedViewController;
    UIViewController *vc = nav.topViewController;
    
    if ([vc isKindOfClass:[ChildBaseViewController class]] || [vc isKindOfClass:[MainBaseViewController class]])
    {
        return NO;
    }
    else
    {
        return [vc shouldAutorotate];
    }
}

@end

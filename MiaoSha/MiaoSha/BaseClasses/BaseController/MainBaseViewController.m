//
//  MainBaseViewController.m
//  lingdaozhe
//
//  Created by liqiang on 16/5/5.
//  Copyright © 2016年 bckj. All rights reserved.
//

#import "MainBaseViewController.h"

@interface MainBaseViewController ()

@end

@implementation MainBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.automaticallyAdjustsScrollViewInsets = NO;
    self.tabBarController.automaticallyAdjustsScrollViewInsets = NO;
    
    self.supportPortraitOnly = YES;
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController.navigationBar setTranslucent:NO];
    
    self.navigationController.navigationBar.barTintColor = NAV_BAR_COLOR;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont fontWithName:@"HelveticaNeue-Bold" size:18],NSFontAttributeName,nil]];
}

@end

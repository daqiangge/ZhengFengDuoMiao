//
//  HomePageCollectionCell4.m
//  MiaoSha
//
//  Created by liqiang on 16/6/20.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "HomePageCollectionCell4.h"

@interface HomePageCollectionCell4 ()

@property (nonatomic, weak) UIView *lineView;
@property (nonatomic, weak) UIButton *btn1;
@property (nonatomic, weak) UIButton *btn2;
@property (nonatomic, weak) UIButton *btn3;

@end

@implementation HomePageCollectionCell4

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        [self drawView];
    }
    
    return self;
}

- (void)drawView
{
    UIButton *btn1 = [[UIButton alloc] init];
    [btn1 setTitle:@"疯秒区" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor colorWithRed:0.988 green:0.820 blue:0.188 alpha:1.00] forState:UIControlStateHighlighted];
    [btn1 setTitleColor:[UIColor colorWithRed:0.988 green:0.820 blue:0.188 alpha:1.00] forState:UIControlStateSelected];
    [btn1 addTarget:self action:@selector(didClickBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn1];
    self.btn1 = btn1;
    
    UIButton *btn2 = [[UIButton alloc] init];
    [btn2 setTitle:@"狂战区" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor colorWithRed:0.988 green:0.820 blue:0.188 alpha:1.00] forState:UIControlStateHighlighted];
    [btn2 setTitleColor:[UIColor colorWithRed:0.988 green:0.820 blue:0.188 alpha:1.00] forState:UIControlStateSelected];
    [btn2 addTarget:self action:@selector(didClickBtn2:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn2];
    self.btn2 = btn2;
    
    UIButton *btn3 = [[UIButton alloc] init];
    [btn3 setTitle:@"圆梦区" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor colorWithRed:0.988 green:0.820 blue:0.188 alpha:1.00] forState:UIControlStateHighlighted];
    [btn3 setTitleColor:[UIColor colorWithRed:0.988 green:0.820 blue:0.188 alpha:1.00] forState:UIControlStateSelected];
    [btn3 addTarget:self action:@selector(didClickBtn3:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn3];
    self.btn3 = btn3;
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor colorWithRed:0.988 green:0.820 blue:0.188 alpha:1.00];
    [self.contentView addSubview:lineView];
    self.lineView = lineView;
    
    btn1.selected = YES;
    
    btn1.sd_layout
    .leftSpaceToView(self.contentView,0)
    .topSpaceToView(self.contentView,0)
    .bottomSpaceToView(self.contentView,0)
    .widthIs(ScreenWidth/3);
    
    btn2.sd_layout
    .leftSpaceToView(btn1,0)
    .topSpaceToView(self.contentView,0)
    .bottomSpaceToView(self.contentView,0)
    .widthIs(ScreenWidth/3);
    
    btn3.sd_layout
    .leftSpaceToView(btn2,0)
    .topSpaceToView(self.contentView,0)
    .bottomSpaceToView(self.contentView,0)
    .widthIs(ScreenWidth/3);
    
    lineView.sd_layout
    .centerXEqualToView(btn1)
    .topSpaceToView(btn1,-2)
    .widthIs(80)
    .heightIs(2);
}

- (void)didClickBtn1:(UIButton *)btn
{
    self.btn1.selected = NO;
    self.btn2.selected = NO;
    self.btn3.selected = NO;
    
    btn.selected = YES;
    
    self.lineView.sd_resetLayout
    .centerXEqualToView(btn)
    .topSpaceToView(btn,-2)
    .widthIs(80)
    .heightIs(2);
    
    if (self.clickFengMiaoQuBlock) {
        self.clickFengMiaoQuBlock();
    }
}

- (void)didClickBtn2:(UIButton *)btn
{
    self.btn1.selected = NO;
    self.btn2.selected = NO;
    self.btn3.selected = NO;
    
    btn.selected = YES;
    
    self.lineView.sd_resetLayout
    .centerXEqualToView(btn)
    .topSpaceToView(btn,-2)
    .widthIs(80)
    .heightIs(2);
    if (self.clickKuangZhanQuBlock) {
        self.clickKuangZhanQuBlock();
    }
}

- (void)didClickBtn3:(UIButton *)btn
{
    self.btn1.selected = NO;
    self.btn2.selected = NO;
    self.btn3.selected = NO;
    
    btn.selected = YES;
    
    self.lineView.sd_resetLayout
    .centerXEqualToView(btn)
    .topSpaceToView(btn,-2)
    .widthIs(80)
    .heightIs(2);
    
    if (self.clickYuanMengQuBlock) {
        self.clickYuanMengQuBlock();
    }
}

@end

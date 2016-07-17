//
//  LQTouTiaoView.m
//  仿淘宝头条效果
//
//  Created by liqiang on 16/4/12.
//  Copyright © 2016年 Liqiang. All rights reserved.
//

#import "LQTouTiaoView.h"
#import "UIView+Extension.h"

@interface LQTouTiaoView()

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) NSTimer *time;

@end

@implementation LQTouTiaoView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor whiteColor];
        
        self.titleArray = [NSMutableArray array];
        
        [self drawView];
    }
    
    return self;
}

- (void)setTitleArray:(NSMutableArray *)titleArray
{
    _titleArray = titleArray;
    
    for (UIView *vv in self.scrollView.subviews)
    {
        [vv removeFromSuperview];
    }
    
    for (int i = 0; i < self.titleArray.count; i ++)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, self.scrollView.frame.size.height * i, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
        label.text = self.titleArray[i];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor grayColor];
        [self.scrollView addSubview:label];
    }
    
    [self.time invalidate];
    
    __weak typeof(self) weakSelf = self;
    self.time = [NSTimer scheduledTimerWithTimeInterval:2 target:weakSelf selector:@selector(lunBo) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.time forMode:NSRunLoopCommonModes];
}

- (void)drawView
{
    self.index = 0;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width , self.frame.size.height)];
    scrollView.contentSize = CGSizeMake(self.frame.size.width, self.frame.size.height * 2);
    scrollView.pagingEnabled = YES;
    scrollView.scrollEnabled = NO;
    [self addSubview:scrollView];
    self.scrollView = scrollView;
}

- (void)clickToutiao
{
    if (self.didClickToutiao) {
        self.didClickToutiao();
    }
}

- (void)lunBo
{
    if (self.index >= [self.titleArray count]-1) {
        self.index = 0;
    }else {
        self.index++;
    }
    
    [self.scrollView setContentOffset:CGPointMake(0, self.frame.size.height*self.index) animated:YES];
}

@end

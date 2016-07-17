//
//  LQTouTiaoView.h
//  仿淘宝头条效果
//
//  Created by liqiang on 16/4/12.
//  Copyright © 2016年 Liqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^didClickToutiao)();

@interface LQTouTiaoView : UIView

@property (nonatomic, strong) NSMutableArray *titleArray;

@property (nonatomic, copy) didClickToutiao didClickToutiao;

@end

//
//  HomePageCollectionCell4.h
//  MiaoSha
//
//  Created by liqiang on 16/6/20.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickFengMiaoQuBlock)();
typedef void(^ClickKuangZhanQuBlock)();
typedef void(^ClickYuanMengQuBlock)();

@interface HomePageCollectionCell4 : UICollectionViewCell

@property (nonatomic, copy) ClickFengMiaoQuBlock clickFengMiaoQuBlock;
@property (nonatomic, copy) ClickKuangZhanQuBlock clickKuangZhanQuBlock;
@property (nonatomic, copy) ClickYuanMengQuBlock clickYuanMengQuBlock;

@end

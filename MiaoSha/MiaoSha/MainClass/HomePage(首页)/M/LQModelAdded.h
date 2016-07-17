//
//  LQModelAdded.h
//  MiaoSha
//
//  Created by liqiang on 16/7/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQModelAdded : NSObject

@property (nonatomic, copy) NSString *sid;
@property (nonatomic, copy) NSString *remarks;
@property (nonatomic, copy) NSString *createDate;
@property (nonatomic, copy) NSString *updateDate;
@property (nonatomic, strong) LQModelProduct *product;
@property (nonatomic, copy) NSString *issue;//期号
@property (nonatomic, copy) NSString *ispublish;//商品状态0未开奖1已开奖2倒计时
@property (nonatomic, copy) NSString *time;//总共次数
@property (nonatomic, copy) NSString *nowTime;//本次参与人次
@property (nonatomic, strong) LQModelUser *user;

@end

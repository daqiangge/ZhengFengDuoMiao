//
//  LQModelProductDetail.h
//  MiaoSha
//
//  Created by liqiang on 16/7/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LQModelOrderDetail.h"

@interface LQModelProductDetail : NSObject

@property (nonatomic, copy) NSString *sid;
@property (nonatomic, copy) NSString *createDate;
@property (nonatomic, copy) NSString *updateDate;
@property (nonatomic, strong) LQModelProduct *product;
@property (nonatomic, strong) LQModelUser *user;
@property (nonatomic, strong) LQModelOrderDetail *orderDetail;
@property (nonatomic, strong) LQModelOrderDetail *lastOrderDetail;
@property (nonatomic, strong) LQModelUser *lastUser;
@property (nonatomic, strong) LQModelProductDetail *period;

/**
 *  开奖时间
 */
@property (nonatomic, copy) NSString *lotteryTime;
/**
 *  上期开奖时间
 */
@property (nonatomic, copy) NSString *lastLotteryTime;
/**
 *  期数
 */
@property (nonatomic, copy) NSString *number;
/**
 *  上期期数
 */
@property (nonatomic, copy) NSString *lastNumber;
/**
 *  中奖用户ip
 */
@property (nonatomic, copy) NSString *ip;
/**
 *  上期中奖用户ip
 */
@property (nonatomic, copy) NSString *lastIp;
/**
 *  中奖用户地址
 */
@property (nonatomic, copy) NSString *address;
/**
 *  开奖状态 0 是未开奖 1是已开奖 2是待开奖
 */
@property (nonatomic, copy) NSString *status;
/**
 *  中奖人本次秒杀次数、将该用户所有的购买次数相加
 */
@property (nonatomic, assign) int userCount;
/**
 *  上期中奖人秒杀次数
 */
@property (nonatomic, assign) int lastUserCount;
/**
 *  秒杀次数
 */
@property (nonatomic, assign) int allCount;
/**
 *  当前购买次数
 */
@property (nonatomic, assign) int currentCount;

@property (nonatomic, assign) NSInteger lotteryTimeLong;


/**
 *  参与次数,秒杀记录那用到了
 */
@property (nonatomic, assign) int count;

@end

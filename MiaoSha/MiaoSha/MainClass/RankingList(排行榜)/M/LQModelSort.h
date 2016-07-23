//
//  LQModelSort.h
//  MiaoSha
//
//  Created by liqiang on 16/7/20.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQModelSort : NSObject

@property (nonatomic, copy) NSString *sid;
@property (nonatomic, copy) NSString *createDate;
@property (nonatomic, copy) NSString *updateDate;
@property (nonatomic, strong) LQModelUser *user;
/**
 *  秒杀次数
 */
@property (nonatomic, copy) NSString *seckillingCount;
/**
 *  充值金额
 */
@property (nonatomic, copy) NSString *amount;
/**
 *  1为秒杀王 2 为充值王
 */
@property (nonatomic, copy) NSString *type;

@end

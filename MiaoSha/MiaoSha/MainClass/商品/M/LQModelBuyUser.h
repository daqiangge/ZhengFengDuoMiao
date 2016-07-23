//
//  LQModelBuyUser.h
//  MiaoSha
//
//  Created by liqiang on 16/7/20.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

/**
 *  参与秒杀的人
 */

#import <Foundation/Foundation.h>

@interface LQModelBuyUser : NSObject

@property (nonatomic, copy) NSString *sid;
@property (nonatomic, copy) NSString *createDate;
@property (nonatomic, copy) NSString *updateDate;
@property (nonatomic, strong) LQModelUser *user;
@property (nonatomic, strong) LQModelProductDetail *period;
@property (nonatomic, assign) int price;
@property (nonatomic, copy) NSString *count;
@property (nonatomic, copy) NSString *number;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *ip;
@end

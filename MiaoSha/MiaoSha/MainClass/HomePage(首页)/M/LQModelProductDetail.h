//
//  LQModelProductDetail.h
//  MiaoSha
//
//  Created by liqiang on 16/7/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQModelProductDetail : NSObject

@property (nonatomic, copy) NSString *sid;
@property (nonatomic, copy) NSString *remarks;
@property (nonatomic, copy) NSString *createDate;
@property (nonatomic, copy) NSString *updateDate;
@property (nonatomic, strong) LQModelUser *user;
@property (nonatomic, strong) LQModelAdded *added;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *number;

@end

//
//  LQModelUser.h
//  MiaoSha
//
//  Created by liqiang on 16/7/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQModelUser : NSObject

@property (nonatomic, copy) NSString *sid;
@property (nonatomic, copy) NSString *createDate;
@property (nonatomic, copy) NSString *updateDate;
@property (nonatomic, copy) NSString *loginName;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *mobile;
@property (nonatomic, copy) NSString *userType;
@property (nonatomic, copy) NSString *appPhoto;

@property (nonatomic, copy) NSString *ip;
@property (nonatomic, copy) NSString *isSue;
@property (nonatomic, copy) NSString *luckNumber;
@property (nonatomic, copy) NSString *showTime;
@property (nonatomic, copy) NSString *time;

@end

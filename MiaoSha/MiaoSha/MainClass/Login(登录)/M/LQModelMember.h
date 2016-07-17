//
//  LQModelMember.h
//  MiaoSha
//
//  Created by liqiang on 16/7/10.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQModelMember : NSObject

@property (nonatomic, copy) NSString *sid;
@property (nonatomic, copy) NSString *createDate;
@property (nonatomic, copy) NSString *loginName;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *mobile;
@property (nonatomic, copy) NSString *userType;
@property (nonatomic, copy) NSString *appPhoto;

+ (LQModelMember *)sharedMemberMySelf;

@end

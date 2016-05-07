//
//  ModelMemberAccount.h
//  lingdaozhe
//
//  Created by liqiang on 16/5/5.
//  Copyright © 2016年 bckj. All rights reserved.
//

#import <Foundation/Foundation.h>

/* 状态-正常 */
#define STATE_NORMAL 1
/* 状态-密码输错禁用 */
#define STATE_PWD_DISABLED 10

@interface ModelMemberAccount : NSObject

/* 会员标识 */
@property (nonatomic, assign) int memberId;
/* 账户牛币数余额 */
@property (nonatomic, assign) int accountBalance;
/* 账户密码，MD5加密，初始为登录密码 */
@property (nonatomic, copy) NSString *accountPwd;
/* 创建时戳 */
@property (nonatomic, assign) int createdTime;
/* 最后变动时戳 */
@property (nonatomic, assign) int lastModified;
/* 错误密码次数，预留 */
@property (nonatomic, assign) int failNum;
/* 账户状态 */
@property (nonatomic, assign) short state;

/* 冗余 */
@property (nonatomic, assign) double accountBalanceYuan;

@end

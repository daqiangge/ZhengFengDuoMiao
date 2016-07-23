//
//  LQModelMember.m
//  MiaoSha
//
//  Created by liqiang on 16/7/10.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "LQModelMember.h"

static LQModelMember *instanceModel = nil;

@implementation LQModelMember

+ (LQModelMember *)sharedMemberMySelf
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instanceModel = [[LQModelMember alloc] init];
        BOOL isLogin = [[UserDefaults valueForKey:@"isLogin"] boolValue];
        if (isLogin)
        {
            instanceModel.sid = [UserDefaults valueForKey:@"user_id"];
            instanceModel.createDate = [UserDefaults valueForKey:@"user_createDate"];
            instanceModel.loginName = [UserDefaults valueForKey:@"user_loginName"];
            instanceModel.name = [UserDefaults valueForKey:@"user_name"];
            instanceModel.mobile = [UserDefaults valueForKey:@"user_mobile"];
            instanceModel.userType = [UserDefaults valueForKey:@"user_userType"];
            instanceModel.appPhoto = [UserDefaults valueForKey:@"user_appPhoto"];
            instanceModel.userKey = [UserDefaults valueForKey:@"user_userKey"];
        }
    });
    return instanceModel;
}

//限制当前对象创建多实例
#pragma mark - sengleton setting
+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self) {
        if (instanceModel == nil) {
            instanceModel = [super allocWithZone:zone];
        }
    }
    return instanceModel;
}

+ (id)copyWithZone:(NSZone *)zone {
    return self;
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"sid":@"id"};
}

- (void)setSid:(NSString *)sid
{
    _sid = sid;
    
    [UserDefaults setValue:sid forKey:@"user_id"];
    [UserDefaults synchronize];
}

- (void)setCreateDate:(NSString *)createDate
{
    _createDate = createDate;
    
    [UserDefaults setValue:createDate forKey:@"user_createDate"];
    [UserDefaults synchronize];
}

- (void)setLoginName:(NSString *)loginName
{
    _loginName = loginName;
    
    [UserDefaults setValue:loginName forKey:@"user_loginName"];
    [UserDefaults synchronize];
}

- (void)setName:(NSString *)name
{
    _name = name;
    
    [UserDefaults setValue:name forKey:@"user_name"];
    [UserDefaults synchronize];
}

- (void)setMobile:(NSString *)mobile
{
    _mobile = mobile;
    
    [UserDefaults setValue:mobile forKey:@"user_mobile"];
    [UserDefaults synchronize];
}

- (void)setUserType:(NSString *)userType
{
    _userType = userType;
    
    [UserDefaults setValue:userType forKey:@"user_userType"];
    [UserDefaults synchronize];
}

- (void)setAppPhoto:(NSString *)appPhoto
{
    _appPhoto = appPhoto;
    
    [UserDefaults setValue:appPhoto forKey:@"user_appPhoto"];
    [UserDefaults synchronize];
}

- (void)setUserKey:(NSString *)userKey
{
    _userKey = userKey;
    
    [UserDefaults setValue:userKey forKey:@"user_userKey"];
    [UserDefaults synchronize];
}

- (void)logOut
{
    [UserDefaults removeObjectForKey:@"user_id"];
    [UserDefaults removeObjectForKey:@"user_createDate"];
    [UserDefaults removeObjectForKey:@"user_name"];
    [UserDefaults removeObjectForKey:@"user_loginName"];
    [UserDefaults removeObjectForKey:@"user_mobile"];
    [UserDefaults removeObjectForKey:@"user_userType"];
    [UserDefaults removeObjectForKey:@"user_appPhoto"];
    [UserDefaults removeObjectForKey:@"user_userKey"];
    [UserDefaults setValue:[NSNumber numberWithBool:NO] forKey:@"isLogin"];
    [UserDefaults synchronize];
}

@end

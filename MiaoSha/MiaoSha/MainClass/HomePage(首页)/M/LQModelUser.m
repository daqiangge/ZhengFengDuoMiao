//
//  LQModelUser.m
//  MiaoSha
//
//  Created by liqiang on 16/7/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "LQModelUser.h"

@implementation LQModelUser

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"sid":@"id"};
}

@end

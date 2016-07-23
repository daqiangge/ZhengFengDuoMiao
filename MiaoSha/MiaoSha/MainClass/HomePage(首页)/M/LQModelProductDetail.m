//
//  LQModelProductDetail.m
//  MiaoSha
//
//  Created by liqiang on 16/7/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "LQModelProductDetail.h"

@implementation LQModelProductDetail

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"sid":@"id"};
}

- (NSString *)address
{
    if (!_address)
    {
        return @"";
    }
    
    return _address;
}

@end

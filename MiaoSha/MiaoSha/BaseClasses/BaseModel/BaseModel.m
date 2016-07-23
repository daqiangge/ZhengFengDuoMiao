//
//  BaseModel.m
//  lingdaozhe
//
//  Created by liqiang on 16/4/20.
//  Copyright © 2016年 bckj. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

//+ (NSDictionary *)objectClassInArray
//{
//    return @{@"fieldErrors":@"ModelFieldError"};
//}


/**
 * 创建AppKey
 */
+ (NSString *)createAppKey:(NSDictionary *)dictionary
{
    NSArray *valueArray = dictionary.allValues;
    valueArray = [valueArray sortedArrayUsingSelector:@selector(compare:)];
    
    NSMutableString *compare = @"".mutableCopy;
    for (NSString *string in valueArray) {
        [compare appendString:string];
    }
    [compare appendString:[LQModelMember sharedMemberMySelf].userKey];
    return [NSString stringWithFormat:@"%@%@", [LQModelMember sharedMemberMySelf].userKey, [compare encryptSHA1]];
}

@end

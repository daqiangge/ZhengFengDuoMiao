//
//  LQModelShare.m
//  MiaoSha
//
//  Created by liqiang on 16/7/20.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "LQModelShare.h"

@implementation LQModelShare

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"sid":@"id",@"sdescription":@"description"};
}

- (NSArray *)imageList
{
    if (_imageList) {
        NSMutableArray *array = [NSMutableArray array];
        for (NSString *str in _imageList) {
            NSString *strr = URLSTR(str);
            [array addObject:strr];
        }
        return array;
    }
    
    return _imageList;
}

@end

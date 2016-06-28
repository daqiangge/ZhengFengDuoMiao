//
//  ModelOrder.h
//  MiaoSha
//
//  Created by liqiang on 16/6/13.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelOrder : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *joinNum;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, strong) NSArray *picArray;
@property (nonatomic, copy) NSString *qishu;
@property (nonatomic, copy) NSString *shangpingName;

@end

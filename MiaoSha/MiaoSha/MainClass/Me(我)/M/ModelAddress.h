//
//  ModelAddress.h
//  MiaoSha
//
//  Created by liqiang on 16/7/6.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelAddress : NSObject

@property (nonatomic, copy) NSString *sid;
@property (nonatomic, copy) NSString *remarks;
@property (nonatomic, copy) NSString *createDate;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *mobile;
@property (nonatomic, copy) NSString *province;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *county;
@property (nonatomic, copy) NSString *detail;
@property (nonatomic, copy) NSString *isDefault;

@property (nonatomic, assign) BOOL isSelect;

@end

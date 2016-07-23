//
//  LQModelShare.h
//  MiaoSha
//
//  Created by liqiang on 16/7/20.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQModelShare : NSObject

@property (nonatomic, copy) NSString *sid;
@property (nonatomic, copy) NSString *remarks;
@property (nonatomic, copy) NSString *createDate;
@property (nonatomic, copy) NSString *updateDate;
@property (nonatomic, strong) LQModelUser *user;
@property (nonatomic, strong) LQModelProductDetail *period;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *sdescription;
@property (nonatomic, strong) NSArray *imageList;
@property (nonatomic, copy) NSString *userCount;

@end

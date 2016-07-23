//
//  LQModelProduct.h
//  MiaoSha
//
//  Created by liqiang on 16/7/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQModelProduct : NSObject

@property (nonatomic, copy) NSString *sid;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int price;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *leastCount;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *remarks;
@property (nonatomic, strong) NSArray *imageList;

@end

//
//  LQCustomBtn.h
//  lingdaozhe
//
//  Created by liqiang on 16/5/3.
//  Copyright © 2016年 bckj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^didTouchesEnded)();

@interface LQCustomBtn : UIControl

@property (nonatomic, weak,nullable) UILabel *titleLabel;

@property (nonatomic, copy) didTouchesEnded didTouchesEnded;

- (void)setTitle:(nullable NSString *)title forState:(UIControlState)state;

- (void)setTitleColor:(nullable UIColor *)color forState:(UIControlState)state;

- (void)setImage:(nullable UIImage *)image forState:(UIControlState)state;

@end

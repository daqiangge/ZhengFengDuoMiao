//
//  LQCustomBtn.m
//  lingdaozhe
//
//  Created by liqiang on 16/5/3.
//  Copyright © 2016年 bckj. All rights reserved.
//

#import "LQCustomBtn.h"

@interface LQCustomBtn()

@property (nonatomic, weak) UIImageView *imageView;

@end

@implementation LQCustomBtn

- (instancetype)init
{
    if (self = [super init])
    {
        [self drawView];
    }
    
    return self;
}

- (void)drawView
{
    UIView *backgroundView = [[UIView alloc] init];
    backgroundView.backgroundColor = [UIColor clearColor];
    [self addSubview:backgroundView];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    [backgroundView addSubview:imageView];
    self.imageView = imageView;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [backgroundView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    backgroundView.sd_layout
    .bottomSpaceToView(self,5)
    .topSpaceToView(self,5)
    .rightSpaceToView(self,0)
    .leftSpaceToView(self,0);
    
    titleLabel.sd_layout
    .bottomSpaceToView(backgroundView,0)
    .leftSpaceToView(backgroundView,5)
    .rightSpaceToView(backgroundView,5)
    .heightRatioToView(backgroundView,0.25);
    
    imageView.sd_layout
    .bottomSpaceToView(titleLabel,5)
    .topSpaceToView(backgroundView,0)
    .centerXEqualToView(backgroundView)
    .widthEqualToHeight();
}


- (void)setTitle:(nullable NSString *)title forState:(UIControlState)state
{
    self.titleLabel.text = title;
}

- (void)setTitleColor:(nullable UIColor *)color forState:(UIControlState)state
{
    self.titleLabel.textColor = color;
}

- (void)setImage:(nullable UIImage *)image forState:(UIControlState)state
{
    self.imageView.image = image;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.didTouchesEnded) {
        self.didTouchesEnded();
    }
}

@end

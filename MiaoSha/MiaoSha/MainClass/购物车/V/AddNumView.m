//
//  AddNumView.m
//  TDS
//
//  Created by admin on 16/4/18.
//  Copyright © 2016年 sixgui. All rights reserved.
//

#import "AddNumView.h"
#import "Util.h"

@implementation AddNumView

-(id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        self.maxInteget = 10;
        
        num = 1;
        self.backgroundColor = LQRGBColor(251, 251, 251, 1);
        [Util makeCorner:0.5 view:self color:GrayLine];
        
        minusBtn = [[UIButton alloc] init];
        [minusBtn setTitle:@"-" forState:UIControlStateNormal];
        [minusBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        minusBtn.titleLabel.font = [UIFont systemFontOfSize:37.0];
        [minusBtn addTarget:self action:@selector(MinusBtn:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:minusBtn];
        
        numLabel = [[UILabel alloc] init];
        numLabel.textAlignment = NSTextAlignmentCenter;
        numLabel.textColor = TextColor;
        numLabel.font = [UIFont systemFontOfSize:17.0];
        [self addSubview:numLabel];
        [Util setFoursides:numLabel Direction:@"left" sizeW:18];
        [Util setFoursides:numLabel Direction:@"right" sizeW:18];
        
        addBtn = [[UIButton alloc] init];
        [addBtn setTitle:@"+" forState:UIControlStateNormal];
        [addBtn setTitleColor:UIColorRGBA(51, 51, 51, 1) forState:UIControlStateNormal];
        addBtn.titleLabel.font = [UIFont systemFontOfSize:25.0];
        [addBtn addTarget:self action:@selector(AddBtn:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:addBtn];
        
        minusBtn.sd_layout
        .leftSpaceToView(self,0)
        .topSpaceToView(self,0)
        .widthIs(32)
        .bottomSpaceToView(self,0);
        
        addBtn.sd_layout
        .rightSpaceToView(self,0)
        .topSpaceToView(self,0)
        .widthIs(32)
        .bottomSpaceToView(self,0);
        
        numLabel.sd_layout
        .leftSpaceToView(minusBtn,0)
        .centerYEqualToView(self)
        .rightSpaceToView(addBtn,0)
        .heightIs(18);
        
    }
    return self;
}



-(void)MinusBtn:(UIButton *)sender{

    if ((num - 1) <= 0 || num == 0) {
        
        NSLog(@"超出范围");
        
    }else{
    
        num  = num -1;
    }
    
    numLabel.text = [NSString stringWithFormat:@"%ld",(long)num];
    
    [_delegate AddNumView:num];
}

-(void)AddBtn:(UIButton *)sender{
    
    if (num >= self.maxInteget ) {
        
        NSLog(@"超出范围");
        
    }else{
        
        num = num +1;
    }
    
    numLabel.text = [NSString stringWithFormat:@"%ld",(long)num];
    
    [_delegate AddNumView:num];
    
}

-(void)setNumInteger:(NSInteger)numInteger{

    _numInteger = numInteger;
     numLabel.text = [NSString stringWithFormat:@"%ld",(long)_numInteger];
    num = _numInteger;
}

-(void)setMinInteget:(NSInteger)minInteget{

    _minInteget = minInteget;
    if (_minInteget == 0) {
      
        [_delegate AddNumView:_minInteget];
        numLabel.text = @"0";
        num = 0;
        
    }else if (_minInteget<=[numLabel.text integerValue]){
    
        [_delegate AddNumView:_minInteget];
        numLabel.text = [NSString stringWithFormat:@"%ld",(long)_minInteget];
        num = _minInteget;
    }
    
}

@end

//
//  UIAlertView+LQAlertView.m
//  微信支付自付宝支付封装
//
//  Created by liqiang on 16/3/24.
//  Copyright © 2016年 Liqiang. All rights reserved.
//

#import "UIAlertView+LQAlertView.h"

//为块声明静态存储空间
static DismissBlock _dismissBlock;
static CancelBlock _cancelBlock;

@implementation UIAlertView (LQAlertView)

+ (void)showNilDelegateAlertViewWithTitle:(NSString *)title theMessage:(NSString *)message
{
    UIAlertView *alterView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
    [alterView show];
}


+ (UIAlertView *)showAlertViewWithTitle:(NSString *)title
                                message:(NSString *)message
                      cancelButtonTitle:(NSString *)cancelButtonTitle
                      otherButtonTitles:(NSArray*)otherButtons
                              onDismiss:(DismissBlock)dismissed
                               onCancel:(CancelBlock)cancelled
{
    _cancelBlock  = [cancelled copy];
    
    _dismissBlock  = [dismissed copy];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:[self self]
                                          cancelButtonTitle:cancelButtonTitle
                                          otherButtonTitles:nil];
    
    for(NSString *buttonTitle in otherButtons)
    {
        [alert addButtonWithTitle:buttonTitle];
    }
    
    [alert show];
    return alert;
}

//处理UIAlertViewDelegate
+ (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == [alertView cancelButtonIndex])
    {
        _cancelBlock();
    }
    else
    {
        _dismissBlock([[NSNumber numberWithInteger:buttonIndex] intValue] - 1); // cancel button is button 0
    }
}

@end
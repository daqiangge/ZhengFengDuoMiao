//
//  ZhuCeVC.m
//  蓝牙机器人
//
//  Created by liqiang on 16/7/10.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ZhuCeVC.h"
#import "JXTimeButton.h"

@interface ZhuCeVC ()

@property (nonatomic, weak) UITextField *telTextField;
@property (nonatomic, weak) UITextField *yanZhenMaTextField;
@property (nonatomic, weak) UITextField *passwordTextField;
@property (nonatomic, weak) UITextField *ensurePasswordTextField;
@property (nonatomic, weak) JXTimeButton * timeBtn;

@property (nonatomic, copy) NSString *key;

@end

@implementation ZhuCeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"注册";
    
    self.view.backgroundColor = [UIColor colorWithRed:0.906 green:0.910 blue:0.914 alpha:1.00];
    
    [self drawView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)drawView
{
    UITextField *telTextField = [[UITextField alloc] init];
    telTextField.placeholder = @"手机号码";
    telTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tel"]];
    telTextField.leftViewMode = UITextFieldViewModeAlways;
    telTextField.font = [UIFont systemFontOfSize:16];
    telTextField.backgroundColor = [UIColor whiteColor];
    telTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    telTextField.layer.borderWidth = 0.5;
    [self.view addSubview:telTextField];
    self.telTextField = telTextField;
    
    UITextField *yanZhenMaTextField = [[UITextField alloc] init];
    yanZhenMaTextField.placeholder = @"验证码";
    yanZhenMaTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"key"]];
    yanZhenMaTextField.leftViewMode = UITextFieldViewModeAlways;
    yanZhenMaTextField.font = [UIFont systemFontOfSize:16];
    yanZhenMaTextField.backgroundColor = [UIColor whiteColor];
    yanZhenMaTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    yanZhenMaTextField.layer.borderWidth = 0.5;
    [self.view addSubview:yanZhenMaTextField];
    self.yanZhenMaTextField = yanZhenMaTextField;
    
    UITextField *passwordTextField = [[UITextField alloc] init];
    passwordTextField.placeholder = @"密码";
    passwordTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pw"]];
    passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    passwordTextField.font = [UIFont systemFontOfSize:16];
    passwordTextField.backgroundColor = [UIColor whiteColor];
    passwordTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    passwordTextField.layer.borderWidth = 0.5;
    passwordTextField.secureTextEntry = YES;
    [self.view addSubview:passwordTextField];
    self.passwordTextField = passwordTextField;
    
    UITextField *ensurePasswordTextField = [[UITextField alloc] init];
    ensurePasswordTextField.placeholder = @"确认密码";
    ensurePasswordTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pw"]];
    ensurePasswordTextField.leftViewMode = UITextFieldViewModeAlways;
    ensurePasswordTextField.font = [UIFont systemFontOfSize:16];
    ensurePasswordTextField.backgroundColor = [UIColor whiteColor];
    ensurePasswordTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    ensurePasswordTextField.layer.borderWidth = 0.5;
    ensurePasswordTextField.secureTextEntry = YES;
    [self.view addSubview:ensurePasswordTextField];
    self.ensurePasswordTextField = ensurePasswordTextField;
    
    UIButton *loginBtn = [[UIButton alloc] init];
    [loginBtn setTitle:@"确认" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    loginBtn.backgroundColor = [UIColor colorWithRed:0.992 green:0.824 blue:0.188 alpha:1.00];
    [loginBtn addTarget:self action:@selector(ensure) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    
    telTextField.sd_layout
    .topSpaceToView(self.view,15)
    .leftSpaceToView(self.view,15)
    .rightSpaceToView(self.view,15)
    .heightIs(40);
    
    yanZhenMaTextField.sd_layout
    .topSpaceToView(telTextField,15)
    .leftSpaceToView(self.view,15)
    .rightSpaceToView(self.view,15)
    .heightIs(40);
    
    passwordTextField.sd_layout
    .topSpaceToView(yanZhenMaTextField,15)
    .leftSpaceToView(self.view,15)
    .rightSpaceToView(self.view,15)
    .heightIs(40);
    
    ensurePasswordTextField.sd_layout
    .topSpaceToView(passwordTextField,15)
    .leftSpaceToView(self.view,15)
    .rightSpaceToView(self.view,15)
    .heightIs(40);
    
    loginBtn.sd_layout
    .topSpaceToView(ensurePasswordTextField,15)
    .leftSpaceToView(self.view,15)
    .rightSpaceToView(self.view,15)
    .heightIs(40);
    
    UIView *yuanZhenMaRightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 110, 40)];
    yuanZhenMaRightView.backgroundColor = [UIColor clearColor];
    yanZhenMaTextField.rightView = yuanZhenMaRightView;
    yanZhenMaTextField.rightViewMode = UITextFieldViewModeAlways;
    
    __weak typeof(self) weakSelf = self;
    JXTimeButton * timeBtn = [[JXTimeButton alloc] initWithFrame:CGRectMake(0, 0, 90, 20) AndBeforeTitle:@"获取验证码" AndWorkingMarkStr:@"剩余时间:" AndTimeSum:60 AndTimeButtonStar:^{
        NSLog(@"STAR");
        [weakSelf requestGetCode];
    } AndTimeButtonStop:^{
        NSLog(@"STOP");
    }];
    timeBtn.textColor = [UIColor whiteColor];
    timeBtn.center = self.view.center;
    timeBtn.font = [UIFont systemFontOfSize:14];
    timeBtn.textAlignment = 1;
    timeBtn.backgroundColor = [UIColor colorWithRed:0.992 green:0.824 blue:0.188 alpha:1.00];
    timeBtn.layer.masksToBounds = YES;
    timeBtn.layer.cornerRadius = 8;
    [yuanZhenMaRightView addSubview:timeBtn];
    self.timeBtn = timeBtn;
    
    timeBtn.sd_layout
    .centerYEqualToView(yuanZhenMaRightView)
    .rightSpaceToView(yuanZhenMaRightView,15)
    .widthIs(90)
    .heightIs(30);

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


- (void)ensure
{
    [self.view endEditing:YES];
    
    if (self.telTextField.text.length != 11 || ![self.telTextField.text LQ_isAllNum])
    {
        [LCProgressHUD showFailure:@"请填写正确的手机号"];
        return;
    }
    
    if (self.yanZhenMaTextField.text.length != 6 || ![self.yanZhenMaTextField.text LQ_isAllNum])
    {
        [LCProgressHUD showFailure:@"请填写正确的验证码"];
        return;
    }
    
    if (self.passwordTextField.text.length < 6)
    {
        [LCProgressHUD showFailure:@"密码不得小于6位"];
        return;
    }
    
    if (self.ensurePasswordTextField.text.length < 6)
    {
        [LCProgressHUD showFailure:@"确认密码不得小于6位"];
        return;
    }
    
    if (![self.ensurePasswordTextField.text isEqualToString:self.passwordTextField.text])
    {
        [LCProgressHUD showFailure:@"请确认密码是否一致"];
        return;
    }

    [self requestZhuCe];
}

#pragma mark -
#pragma mark ================= 网络 =================
/**
 *  获取验证码
 */
- (void)requestGetCode
{
    [self.view endEditing:YES];
    
    if (self.telTextField.text.length != 11 || ![self.telTextField.text LQ_isAllNum])
    {
        [self.timeBtn stop];
        [LCProgressHUD showFailure:@"请填写正确的手机号"];
        return;
    }
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:self.telTextField.text forKey:@"mobile"];
    [params setValue:@"0" forKey:@"type"];

    [[LQHTTPSessionManager sharedManager] LQPost:@"/app/sys/user/getVerificationCode" parameters:params showTips:nil success:^(id responseObject) {

    } successBackfailError:^(id responseObject) {
        [LCProgressHUD showFailure:@"验证获取失败"];
    } failure:^(NSError *error) {
        [LCProgressHUD showFailure:@"验证获取失败"];
    }];
}

/**
 *  注册
 */
- (void)requestZhuCe
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:self.telTextField.text forKey:@"mobile"];
    [params setValue:self.passwordTextField.text forKey:@"password"];
    [params setValue:self.yanZhenMaTextField.text forKey:@"verificationCode"];
    
    [[LQHTTPSessionManager sharedManager] LQPost:@"/app/sys/user/save" parameters:params showTips:nil success:^(id responseObject) {
        [LCProgressHUD showSuccess:@"注册成功"];
        [self.navigationController popViewControllerAnimated:YES];
        
    } successBackfailError:^(id responseObject) {
        [LCProgressHUD showFailure:@"注册失败"];
    } failure:^(NSError *error) {
        [LCProgressHUD showFailure:@"注册失败"];
    }];
}

@end

//
//  registerViewController.m
//  UITest
//
//  Created by tianyou_ios on 2019/1/7.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import "registerViewController.h"
#import "UIColor+ColorChange.h"
#import "ViewController.h"

#define  SCREENSCALEWIDTH 1000/1080
#define  SCREENSCALEHEIGHT 1000/1920
#define  SCREEN_WIDTH ([[UIScreen mainScreen]bounds].size.width)
#define  SCREEN_HEIGHT ([[UIScreen mainScreen]bounds].size.height)

@interface registerViewController ()
@property(nonatomic,readonly)UIView *registerView;
@property(nonatomic,strong)UIImageView *logoImageView;
@property(nonatomic,strong)UITextField *accountFd;
@property(nonatomic,strong)UITextField *passwordFd;
@property(nonatomic,strong)UITextField *passwordAgainFd;
@property(nonatomic,strong)UIButton *btnRegister;
@property(nonatomic,strong)UIButton *btnBack;
@end

@implementation registerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"1.jpg"]]];
    [self.view setAlpha:0.5];
    [self loadRegisterView];
    
}

-(void)loadRegisterView
{
    _registerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH*SCREENSCALEWIDTH, SCREEN_HEIGHT*SCREENSCALEHEIGHT)];
    _registerView.center =CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    _registerView.backgroundColor =[UIColor colorWithHexString:@"#343645"];
    _registerView.layer.cornerRadius=25.0;
    _registerView.layer.masksToBounds=YES;
    _registerView.autoresizesSubviews=YES;
    NSLog(@"%f,%f",_registerView.frame.size.height,_registerView.frame.size.width);
    [self.view addSubview:_registerView];
    
    //图标的设置
    _logoImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _registerView.frame.size.width*0.45,_registerView.frame.size.height*0.09)];
    _logoImageView.center=CGPointMake(_registerView.frame.size.width/2, 0.05*_registerView.frame.size.height+_logoImageView.frame.size.height/2);
    _logoImageView.image=[UIImage imageNamed:@"1-9.png"];
    [_registerView addSubview:_logoImageView];
    
    //返回按钮的设置
    _btnBack=[UIButton buttonWithType:UIButtonTypeCustom];
    _btnBack.frame=CGRectMake(0, 0, _registerView.frame.size.width*3/20, _registerView.frame.size.width*3/20);
    _btnBack.center=CGPointMake(_registerView.frame.size.width/2+_logoImageView.frame.size.width*0.75, _logoImageView.center.y);
    [_btnBack setTitle:@"<" forState:UIControlStateNormal];
    [_btnBack setFont:[UIFont fontWithName:@"Helvetica-Bold" size:28]];
    _btnBack.layer.cornerRadius=_registerView.frame.size.width*3/40;
    _btnBack.clipsToBounds=YES;
    [_btnBack setBackgroundColor:[UIColor colorWithHexString:@"abc6cf"]];
    [_btnBack addTarget:self action:@selector(backToExView:) forControlEvents:UIControlEventTouchDown];
    [_registerView addSubview:_btnBack];
    
    //用户框的设置
    _accountFd=[[UITextField alloc]initWithFrame:CGRectMake(0, 0, _registerView.frame.size.width*0.8, _registerView.frame.size.height*0.12)];
    _accountFd.center=CGPointMake(_registerView.frame.size.width/2, _logoImageView.center.y+_accountFd.frame.size.height);
    _accountFd.layer.cornerRadius=8.0;
    _accountFd.backgroundColor=[UIColor colorWithHexString:@"#2c2d3b"];
    _accountFd.placeholder=[NSString stringWithFormat:@"邮箱账号/ID"];
    UIImageView *accountLogo=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,_registerView.frame.size.height*0.05, _registerView.frame.size.height*0.05*(7/6))];
    accountLogo.image=[UIImage imageNamed:@"1-6.png"];
    accountLogo.contentMode=UIViewContentModeScaleAspectFit;
    _accountFd.leftView=accountLogo;
    _accountFd.leftViewMode=UITextFieldViewModeAlways;
    UIView *lineViewAcc=[[UIView alloc]initWithFrame:CGRectMake(accountLogo.frame.origin.x,_accountFd.bounds.size.height, _accountFd.frame.size.width, 2)];
    lineViewAcc.backgroundColor = [UIColor whiteColor];
    [_accountFd addSubview:lineViewAcc];
    [_registerView addSubview:_accountFd];
    
    
    //密码框的设置
    _passwordFd=[[UITextField alloc]initWithFrame:CGRectMake(0, 0, _registerView.frame.size.width*0.8, _registerView.frame.size.height*0.12)];
    _passwordFd.center=CGPointMake(_registerView.frame.size.width/2, _accountFd.center.y*1.1+_passwordFd.frame.size.height);
    _passwordFd.layer.cornerRadius=8.0;
    _passwordFd.backgroundColor=[UIColor colorWithHexString:@"#2c2d3b"];
    _passwordFd.placeholder=[NSString stringWithFormat:@"密码"];
    UIImageView *passwordLogo=[[UIImageView alloc]initWithFrame:CGRectMake(_passwordFd.frame.size.width*0.09, 0,_registerView.frame.size.height*0.05, _registerView.frame.size.height*0.05*(7/6))];
    passwordLogo.image=[UIImage imageNamed:@"1-5.png"];
    passwordLogo.contentMode=UIViewContentModeScaleAspectFit;
    _passwordFd.leftView=passwordLogo;
    _passwordFd.leftViewMode=UITextFieldViewModeAlways;
    _passwordFd.textColor=[UIColor whiteColor];
    UIView *lineViewPsw=[[UIView alloc]initWithFrame:CGRectMake(accountLogo.frame.origin.x,_passwordFd.bounds.size.height, _passwordFd.bounds.size.width, 2)];
    lineViewPsw.backgroundColor = [UIColor whiteColor];
    NSLog(@"pswAg line:%f,%f",lineViewPsw.center.x,lineViewPsw.center.y);
    [_passwordFd addSubview:lineViewPsw];
    [_registerView addSubview:_passwordFd];
    
    //二次密码框的设置
    _passwordAgainFd=[[UITextField alloc]initWithFrame:CGRectMake(0, 0, _registerView.frame.size.width*0.8, _registerView.frame.size.height*0.12)];
    _passwordAgainFd.center=CGPointMake(_registerView.frame.size.width/2, _passwordFd.center.y*1.3+_passwordAgainFd.frame.size.height);
    _passwordAgainFd.layer.cornerRadius=8.0;
    _passwordAgainFd.backgroundColor=[UIColor colorWithHexString:@"#2c2d3b"];
    _passwordAgainFd.placeholder=[NSString stringWithFormat:@"请再次输入密码"];
    _passwordAgainFd.textColor=[UIColor whiteColor];
    UIImageView *passwordAgainLogo=[[UIImageView alloc]initWithFrame:CGRectMake(_passwordFd.frame.size.width*0.09, 0,_registerView.frame.size.height*0.05, _registerView.frame.size.height*0.05*(7/6))];
    passwordAgainLogo.image=[UIImage imageNamed:@"1-5.png"];
    passwordAgainLogo.contentMode=UIViewContentModeScaleAspectFit;
    _passwordAgainFd.leftView=passwordAgainLogo;
    _passwordAgainFd.leftViewMode=UITextFieldViewModeAlways;
    _passwordAgainFd.textColor=[UIColor whiteColor];
   UIView *lineViewPswA=[[UIView alloc]initWithFrame:CGRectMake(accountLogo.frame.origin.x,_passwordAgainFd.bounds.size.height, _passwordAgainFd.bounds.size.width, 2)];
    lineViewPswA.backgroundColor = [UIColor whiteColor];
     NSLog(@"pswAg line:%f,%f",lineViewPswA.center.x,lineViewPswA.center.y);
    [_accountFd addSubview:lineViewPswA];
    [_registerView addSubview:_passwordAgainFd];
    
    
    //注册按钮的设置
    _btnRegister=[UIButton buttonWithType:UIButtonTypeCustom];
    _btnRegister.frame=CGRectMake(0, 0, _registerView.frame.size.width*0.68, _registerView.frame.size.height*0.12);
    _btnRegister.center=CGPointMake(_registerView.frame.size.width/2, _passwordFd.center.y*2+_btnRegister.frame.size.height);
    [[_btnRegister layer]setCornerRadius:30.0];
    [_btnRegister setTitle:@"注册" forState:UIControlStateNormal];
    [_btnRegister setFont:[UIFont systemFontOfSize:25]];
    [_btnRegister setBackgroundColor:[UIColor colorWithHexString:@"ff8c37"]];
    [_registerView addSubview:_btnRegister];
}
-(void)backToExView:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

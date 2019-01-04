//
//  ViewController.m
//  UITest
//
//  Created by tianyou_ios on 2019/1/4.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+ColorChange.h"

#define  SCREENSCALEWIDTH 1000/1080
#define  SCREENSCALEHEIGHT 1000/1920
#define  SCREEN_WIDTH ([[UIScreen mainScreen]bounds].size.width)
#define  SCREEN_HEIGHT ([[UIScreen mainScreen]bounds].size.height)


@interface ViewController ()
@property(nonatomic,readonly)UIView *loginView;
@property(nonatomic,strong)UIImageView *logoImageView;
@property(nonatomic,strong)UITextField *accountFd;
@property(nonatomic,strong)UITextField *passwordFd;
@property(nonatomic,strong)UIButton *loginBtn;
@property(nonatomic,strong)UIButton *registerBtn;
@property(nonatomic,strong)UILabel *forgetPsw;
@property(nonatomic,strong)UIButton *loginFB;
@property(nonatomic,strong)UIButton *loginVistors;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self loadLoginView];

}
-(void)setLine{
    UIView *lineView=[[UIView alloc]initWithFrame:CGRectMake(self.view.center.x-self.view.frame.size.width/2, self.view.frame.size.height, self.view.frame.size.width, 1)];
    [self.view  addSubview:lineView];
}
-(void)loadLoginView
{
    _loginView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH*SCREENSCALEWIDTH, SCREEN_HEIGHT*SCREENSCALEHEIGHT)];
    _loginView.center =CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    _loginView.backgroundColor =[UIColor colorWithHexString:@"#343645"];
    _loginView.layer.cornerRadius=25.0;
    _loginView.layer.masksToBounds=YES;
    _loginView.autoresizesSubviews=YES;
    NSLog(@"%f,%f",_loginView.frame.size.height,_loginView.frame.size.width);
    [self.view addSubview:_loginView];
    
    //图标的设置
    _logoImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _loginView.frame.size.width*0.45,_loginView.frame.size.height*0.09)];
    _logoImageView.center=CGPointMake(_loginView.frame.size.width/2, 0.05*_loginView.frame.size.height+_logoImageView.frame.size.height/2);
    _logoImageView.image=[UIImage imageNamed:@"1-9.png"];
    NSLog(@"%f,%f",_logoImageView.frame.size.height,_logoImageView.frame.size.width);
    [_loginView addSubview:_logoImageView];
    
    
    
    //用户框的设置
    _accountFd=[[UITextField alloc]initWithFrame:CGRectMake(0, 0, _loginView.frame.size.width*0.8, _loginView.frame.size.height*0.12)];
    _accountFd.center=CGPointMake(_loginView.frame.size.width/2, _logoImageView.center.y+_accountFd.frame.size.height);
    _accountFd.layer.cornerRadius=8.0;
    _accountFd.backgroundColor=[UIColor colorWithHexString:@"#2c2d3b"];
    _accountFd.placeholder=[NSString stringWithFormat:@"邮箱账号/ID"];
    UIImageView *accountLogo=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,_loginView.frame.size.height*0.05, _loginView.frame.size.height*0.05*(7/6))];
    accountLogo.image=[UIImage imageNamed:@"1-6.png"];
    accountLogo.contentMode=UIViewContentModeScaleAspectFit;
    _accountFd.leftView=accountLogo;
    _accountFd.leftViewMode=UITextFieldViewModeAlways;
    UIView *lineView= [[UIView alloc]initWithFrame:CGRectMake(_accountFd.center.x-_accountFd.frame.size.width,_accountFd.frame.size.height, _accountFd.frame.size.width, 1)];
    [_accountFd addSubview:lineView];
    _accountFd.textColor=[UIColor whiteColor];
    UIView *lineViewy=[[UIView alloc]initWithFrame:CGRectMake(_accountFd.center.x-_accountFd.frame.size.width/2, _accountFd.frame.size.height, _accountFd.frame.size.width, 1)];
    lineViewy.backgroundColor = [UIColor whiteColor];
    [_accountFd addSubview:lineViewy];
    [_loginView addSubview:_accountFd];


     //密码框的设置
    _passwordFd=[[UITextField alloc]initWithFrame:CGRectMake(0, 0, _loginView.frame.size.width*0.8, _loginView.frame.size.height*0.12)];
    _passwordFd.center=CGPointMake(_loginView.frame.size.width/2, _accountFd.center.y*1.1+_passwordFd.frame.size.height);
    
    _passwordFd.layer.cornerRadius=8.0;
    _passwordFd.backgroundColor=[UIColor colorWithHexString:@"#2c2d3b"];
    _passwordFd.placeholder=[NSString stringWithFormat:@"密码"];
    UIImageView *passwordLogo=[[UIImageView alloc]initWithFrame:CGRectMake(_passwordFd.frame.size.width*0.09, 0,_loginView.frame.size.height*0.05, _loginView.frame.size.height*0.05*(7/6))];
    passwordLogo.image=[UIImage imageNamed:@"1-5.png"];
    passwordLogo.contentMode=UIViewContentModeScaleAspectFit;
    _passwordFd.leftView=passwordLogo;
    _passwordFd.leftViewMode=UITextFieldViewModeAlways;
    _passwordFd.textColor=[UIColor whiteColor];
    [_loginView addSubview:_passwordFd];

    
    //登录按钮的设置
    _loginBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _loginBtn.frame=CGRectMake(0, 0, _loginView.frame.size.width*0.68, _loginView.frame.size.height*0.12);
    _loginBtn.center=CGPointMake(_loginView.frame.size.width/2, _passwordFd.center.y*1.1+_loginBtn.frame.size.height);
    [[_loginBtn layer]setCornerRadius:30.0];
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [_loginBtn setFont:[UIFont systemFontOfSize:25]];
    [_loginBtn setBackgroundColor:[UIColor colorWithHexString:@"ff8c37"]];
    [_loginView addSubview:_loginBtn];
    
    //注册按钮的设置
    _registerBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _registerBtn.frame=CGRectMake(0, 0, _loginBtn.frame.size.width*0.55, _loginView.frame.size.width*0.10);
_registerBtn.center=CGPointMake(_loginBtn.center.x+_loginBtn.frame.size.width/4, _loginBtn.center.y+_loginBtn.frame.size.height);
    [[_registerBtn layer]setCornerRadius:23.0];
    [_registerBtn setTitle:@"立即注册" forState:UIControlStateNormal];
    [_registerBtn setBackgroundColor:[UIColor colorWithHexString:@"#777777"]];
    [_loginView addSubview:_registerBtn];
    
    //忘记密码的label设置
     _forgetPsw=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, _loginBtn.frame.size.width*0.55, _loginView.frame.size.width*0.10)];
_forgetPsw.center=CGPointMake(_loginBtn.center.x-_loginBtn.frame.size.width/4, _loginBtn.center.y+_loginBtn.frame.size.height);
    [_forgetPsw setLineBreakMode:NSLineBreakByWordWrapping];
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc]initWithString:@"忘记密码"];
    NSRange contentRange = {0,[content length]};
    [content addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:contentRange];
    _forgetPsw.attributedText = content;
    [_loginView addSubview:_forgetPsw];

    //下划线的设置
   
    //FB的用户接入
    _loginFB=[UIButton buttonWithType:UIButtonTypeCustom];
    _loginFB.frame=CGRectMake(0, 0, _loginView.frame.size.width*0.25, _loginView.frame.size.width*0.25);
_loginFB.center=CGPointMake(_registerBtn.center.x+_registerBtn.frame.size.width/4, _registerBtn.center.y*1.1+_registerBtn.frame.size.height);
    [_loginFB setTitle:@"Facebook登录" forState:UIControlStateNormal];
    UIImage *backgroundImage=[UIImage imageNamed:@"1-7.png"];
    [_loginFB setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    _loginFB.imageEdgeInsets=UIEdgeInsetsMake(backgroundImage.size.height, 0, backgroundImage.size.height*-1, 0);
    _loginFB.titleEdgeInsets=UIEdgeInsetsMake(0, , 0, 0);
    [_loginView addSubview:_loginFB];
    //游客用户的设置
}

@end

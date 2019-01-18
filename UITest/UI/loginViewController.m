//
//  loginViewController.m
//  UITest
//
//  Created by tianyou_ios on 2019/1/7.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import "loginViewController.h"
#import "UIColor+ColorChange.h"

#define  SCREENSCALEWIDTH 1000/1080
#define  SCREENSCALEHEIGHT 1000/1920
#define  SCREEN_WIDTH ([[UIScreen mainScreen]bounds].size.width)
#define  SCREEN_HEIGHT ([[UIScreen mainScreen]bounds].size.height)

@interface loginViewController ()
@property(nonatomic,readonly)UIView *loginView;
@property(nonatomic,strong)UIImageView *logoImageView;
@property(nonatomic,strong)UITextField *accountFd;
@property(nonatomic,strong)UITextField *passwordFd;
@property(nonatomic,strong)UIButton *loginBtn;
@property(nonatomic,strong)UIButton *registerBtn;
@property(nonatomic,strong)UILabel *forgetPsw;
@property(nonatomic,strong)UIButton *BtnLoginFB;
@property(nonatomic)UIEdgeInsets titleEdgeInsets;
@property(nonatomic)UIEdgeInsets imageEdgeInsets;
@property(nonatomic,strong)UIButton *BtnLoginVistors;
@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    
    [self loadLoginView];
    
}

-(void)loadLoginView
{
    
    CGSize titleSize= _BtnLoginFB.titleLabel.bounds.size;
    CGSize imageSize= _BtnLoginFB.imageView.bounds.size;
    
    
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
    UIView *lineViewAcc=[[UIView alloc]initWithFrame:CGRectMake(accountLogo.frame.origin.x,_accountFd.bounds.size.height, _accountFd.frame.size.width, 2)];
    lineViewAcc.backgroundColor = [UIColor whiteColor];
    [_accountFd addSubview:lineViewAcc];
    NSLog(@"acc line:%f,%f",lineViewAcc.center.x,lineViewAcc.center.y);
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
    UIView *lineViewPsw=[[UIView alloc]initWithFrame:CGRectMake(accountLogo.frame.origin.x,_passwordFd.bounds.size.height, _passwordFd.bounds.size.width, 2)];
    lineViewPsw.backgroundColor = [UIColor whiteColor];
    NSLog(@"psw line:%f,%f",lineViewPsw.center.x,lineViewPsw.center.y);
    [_passwordFd addSubview:lineViewPsw];
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
    UIView *lineViewLogin=[[UIView alloc]initWithFrame:CGRectMake(0,0, _loginView.frame.size.width, 2)];
    lineViewLogin.center=CGPointMake(_loginBtn.center.x, _registerBtn.center.y*1.08);
    lineViewLogin.backgroundColor = [UIColor whiteColor];
    NSLog(@"acc line:%f,%f",lineViewLogin.center.x,lineViewLogin.center.y);
    [_loginView addSubview:lineViewLogin];
    
    //FB的用户接入
    _BtnLoginFB=[UIButton buttonWithType:UIButtonTypeCustom];
    _BtnLoginFB.frame=CGRectMake(0, 0, _loginView.frame.size.width*0.20, _loginView.frame.size.width*0.20);
    _BtnLoginFB.center=CGPointMake(_loginBtn.center.x-_loginBtn.frame.size.width/4, _registerBtn.center.y*1.1+_registerBtn.frame.size.height);
    UIImage *backgroundImageFB=[UIImage imageNamed:@"1-7.png"];
    [_BtnLoginFB setBackgroundImage:backgroundImageFB forState:UIControlStateNormal];
    _BtnLoginFB.titleLabel.backgroundColor=_BtnLoginFB.backgroundColor;
    _BtnLoginFB.imageView.backgroundColor = _BtnLoginFB.backgroundColor;
    [_BtnLoginFB setTitleEdgeInsets:UIEdgeInsetsMake(imageSize.height,-imageSize.height,0,0)];
    [_BtnLoginFB setImageEdgeInsets:UIEdgeInsetsMake(0, 0, titleSize.height,-titleSize.height)];
    NSLog(@"%f,%f",imageSize.height,titleSize.height);
    [_loginView addSubview:_BtnLoginFB];
    
    
    //游客用户的设置
    _BtnLoginVistors=[UIButton buttonWithType:UIButtonTypeCustom];
    _BtnLoginVistors.frame=CGRectMake(0, 0, _loginView.frame.size.width*0.20, _loginView.frame.size.width*0.20);
    _BtnLoginVistors.center=CGPointMake(_registerBtn.center.x+_registerBtn.frame.size.width/4, _registerBtn.center.y*1.1+_registerBtn.frame.size.height);
    UIImage *backgroundImageVistor=[UIImage imageNamed:@"1-8.png"];
    [_BtnLoginVistors setBackgroundImage:backgroundImageVistor forState:UIControlStateNormal];
    _BtnLoginVistors.titleLabel.backgroundColor=_BtnLoginFB.backgroundColor;
    _BtnLoginVistors.imageView.backgroundColor = _BtnLoginFB.backgroundColor;
    [_BtnLoginVistors setTitleEdgeInsets:UIEdgeInsetsMake(imageSize.height,-imageSize.height,0,0)];
    [_BtnLoginVistors setImageEdgeInsets:UIEdgeInsetsMake(0, 0, titleSize.height,-titleSize.height)];
    NSLog(@"%f,%f",imageSize.height,titleSize.height);
    [_loginView addSubview:_BtnLoginVistors];
}


@end

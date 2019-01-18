//
//  TYLoginView.m
//  UITest
//
//  Created by tianyou_ios on 2019/1/7.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import "TYLoginView.h"
#import "UIColor+ColorChange.h"
#import "TYSDKLoginManager.h"
#import "TYSDKContainer.h"
#import "TYSDK.h"
#import "TYSDKDataModel.h"
#import "TYSDKDataDeal.h"
#import "TYSDKNetW.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#define  SCREENSCALEWIDTH 1000/1080
#define  SCREENSCALEHEIGHT 1000/1920
#define  SCREEN_WIDTH ([[UIScreen mainScreen]bounds].size.width)
#define  SCREEN_HEIGHT ([[UIScreen mainScreen]bounds].size.height)

#define MYBUNDLE_NAME   @"TYSDKResource.bundle"
#define MYBUNDLE_PATH   [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:MYBUNDLE_NAME]
#define MYBUNDLE        [NSBundle bundleWithPath:MYBUNDLE_PATH]



@interface TYLoginView ()<UITextFieldDelegate>
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

@implementation TYLoginView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];

    [self loadLoginView];
    
}

-(void)loadLoginView
{
    
    CGSize titleSize= _BtnLoginFB.titleLabel.bounds.size;
    CGSize imageSize= _BtnLoginFB.imageView.bounds.size;
    
    
    _loginView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH*SCREENSCALEWIDTH, SCREEN_HEIGHT*SCREENSCALEHEIGHT)];
    _loginView.center =CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    //    _loginView.backgroundColor=[UIColor colorNamed:[UIColor yellowColor]];
    _loginView.backgroundColor =[UIColor colorWithHexString:@"#343645"];
    _loginView.layer.cornerRadius=25.0;
    _loginView.layer.masksToBounds=YES;
    _loginView.autoresizesSubviews=YES;
    [self.view addSubview:_loginView];
    
    
    //图标的设置
    _logoImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _loginView.frame.size.width*0.45,_loginView.frame.size.height*0.09)];
    _logoImageView.center=CGPointMake(_loginView.frame.size.width/2, 0.05*_loginView.frame.size.height+_logoImageView.frame.size.height/2);
    NSString *imgPathLogo= [MYBUNDLE_PATH stringByAppendingPathComponent:@"1-9"];
    _logoImageView.image=[UIImage imageWithContentsOfFile:imgPathLogo];
    NSLog(@"%@",_logoImageView.image);
    [_loginView addSubview:_logoImageView];
    
    
    
    //用户框的设置
    _accountFd=[[UITextField alloc]initWithFrame:CGRectMake(0, 0, _loginView.frame.size.width*0.8, _loginView.frame.size.height*0.12)];
    _accountFd.center=CGPointMake(_loginView.frame.size.width/2, _logoImageView.center.y+_accountFd.frame.size.height);
    _accountFd.layer.cornerRadius=8.0;
    _accountFd.inputDelegate=(id)self;
    _accountFd.backgroundColor=[UIColor colorWithHexString:@"#2c2d3b"];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentLeft;
    NSAttributedString *attri = [[NSAttributedString alloc] initWithString:@"邮箱账号/ID" attributes:@{NSForegroundColorAttributeName:[UIColor  lightGrayColor],NSFontAttributeName:[UIFont fontWithName:@"futura" size:18], NSParagraphStyleAttributeName:style}];
    _accountFd.attributedPlaceholder = attri;
    UIImageView *accountLogo=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,_loginView.frame.size.height*0.05, _loginView.frame.size.height*0.05*(7/6))];
    NSString *imgPathAcc= [MYBUNDLE_PATH stringByAppendingPathComponent:@"1-6"];
    accountLogo.image=[UIImage imageWithContentsOfFile:imgPathAcc];
    accountLogo.contentMode=UIViewContentModeScaleAspectFit;
    _accountFd.leftView=accountLogo;
    _accountFd.leftViewMode=UITextFieldViewModeAlways;
    UIView *lineViewAcc=[[UIView alloc]initWithFrame:CGRectMake(accountLogo.frame.origin.x,_accountFd.bounds.size.height, _accountFd.frame.size.width, 2)];
    lineViewAcc.backgroundColor = [UIColor whiteColor];
    [_accountFd addSubview:lineViewAcc];
    [_loginView addSubview:_accountFd];
    
    
    
    //密码框的设置
    _passwordFd=[[UITextField alloc]initWithFrame:CGRectMake(0, 0, _loginView.frame.size.width*0.8, _loginView.frame.size.height*0.12)];
    _passwordFd.center=CGPointMake(_loginView.frame.size.width/2, _accountFd.center.y*1.1+_passwordFd.frame.size.height);
    _passwordFd.layer.cornerRadius=8.0;
    _passwordFd.inputDelegate=self;
    _passwordFd.backgroundColor=[UIColor colorWithHexString:@"#2c2d3b"];
    NSMutableParagraphStyle *psStyle = [[NSMutableParagraphStyle alloc] init];
    psStyle.alignment = NSTextAlignmentLeft;
    NSAttributedString *attriPsw = [[NSAttributedString alloc] initWithString:@"密码" attributes:@{NSForegroundColorAttributeName:[UIColor  lightGrayColor],NSFontAttributeName:[UIFont fontWithName:@"futura" size:18], NSParagraphStyleAttributeName:psStyle}];
    _passwordFd.attributedPlaceholder = attriPsw;
    UIImageView *passwordLogo=[[UIImageView alloc]initWithFrame:CGRectMake(_passwordFd.frame.size.width*0.09, 0,_loginView.frame.size.height*0.05, _loginView.frame.size.height*0.05*(7/6))];
    NSString *imgPathPsw= [MYBUNDLE_PATH stringByAppendingPathComponent:@"1-5"];
    passwordLogo.image=[UIImage imageWithContentsOfFile:imgPathPsw];
    passwordLogo.contentMode=UIViewContentModeScaleAspectFit;
    _passwordFd.leftView=passwordLogo;
    _passwordFd.leftViewMode=UITextFieldViewModeAlways;
    _passwordFd.textColor=[UIColor whiteColor];
    _passwordFd.secureTextEntry=YES;
    UIView *lineViewPsw=[[UIView alloc]initWithFrame:CGRectMake(accountLogo.frame.origin.x,_passwordFd.bounds.size.height, _passwordFd.bounds.size.width, 2)];
    lineViewPsw.backgroundColor = [UIColor whiteColor];
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
    [_loginBtn addTarget:self action:@selector(EventsLogin:) forControlEvents:UIControlEventTouchDown];
    [_loginView addSubview:_loginBtn];
    
    //注册按钮的设置
    _registerBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _registerBtn.frame=CGRectMake(0, 0, _loginBtn.frame.size.width*0.55, _loginView.frame.size.width*0.10);
    _registerBtn.center=CGPointMake(_loginBtn.center.x+_loginBtn.frame.size.width/4, _loginBtn.center.y+_loginBtn.frame.size.height);
    [[_registerBtn layer]setCornerRadius:23.0];
    [_registerBtn setTitle:@"立即注册" forState:UIControlStateNormal];
    [_registerBtn setBackgroundColor:[UIColor colorWithHexString:@"#777777"]];
    [_registerBtn addTarget:self action:@selector(EventsRegister:) forControlEvents:UIControlEventTouchDown];
    [_loginView addSubview:_registerBtn];
    
    
    //忘记密码的label设置
    _forgetPsw=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, _loginBtn.frame.size.width*0.55, _loginView.frame.size.width*0.10)];
    _forgetPsw.center=CGPointMake(_loginBtn.center.x-_loginBtn.frame.size.width/4, _loginBtn.center.y+_loginBtn.frame.size.height);
       NSMutableAttributedString *content = [[NSMutableAttributedString alloc]initWithString:@"忘记密码"];
    //label添加文本下划线
    [_forgetPsw setLineBreakMode:NSLineBreakByWordWrapping];
    NSRange contentRange = {0,[content length]};
    [content addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:contentRange];
    //label添加文本
    _forgetPsw.attributedText = content;
    //label添加点击事件
    UITapGestureRecognizer *labelGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(activiate:)];
    [_forgetPsw setUserInteractionEnabled:YES];
    [_forgetPsw addGestureRecognizer:labelGesture];
    [_loginView addSubview:_forgetPsw];
    
    
    //下划线的设置
    //下划线
    UIView *lineViewLogin1=[[UIView alloc]initWithFrame:CGRectMake(0,_registerBtn.center.y*1.15, SCREEN_WIDTH, 2)];
    lineViewLogin1.backgroundColor = [UIColor whiteColor];
    [_loginView addSubview:lineViewLogin1];
    //中间or
    UILabel *orLabel=[[UILabel alloc]initWithFrame:CGRectMake(0,0, 40, 50)];
    orLabel.center=CGPointMake(_loginView.frame.size.width/2, _registerBtn.center.y*1.15);
    [orLabel setText:@"OR"];
    orLabel.textAlignment=NSTextAlignmentCenter;
    [orLabel setTextColor:[UIColor whiteColor]];
    orLabel.backgroundColor = [UIColor colorWithHexString:@"#343645"];
    [_loginView addSubview:orLabel];
    
    
    
    //FB的用户接入
    _BtnLoginFB=[UIButton buttonWithType:UIButtonTypeCustom];
    _BtnLoginFB.frame=CGRectMake(0, 0, _loginView.frame.size.width*0.20, _loginView.frame.size.width*0.20);
    _BtnLoginFB.center=CGPointMake(_forgetPsw.center.x-_forgetPsw.frame.size.width/4, orLabel.center.y*1.15);
    NSString *imgPathFB= [MYBUNDLE_PATH stringByAppendingPathComponent:@"1-7"];
    UIImage *backgroundImageFB=[UIImage imageWithContentsOfFile:imgPathFB];
    [_BtnLoginFB setBackgroundImage:backgroundImageFB forState:UIControlStateNormal];
    _BtnLoginFB.titleLabel.backgroundColor=_BtnLoginFB.backgroundColor;
    _BtnLoginFB.imageView.backgroundColor = _BtnLoginFB.backgroundColor;
    [_BtnLoginFB setTitleEdgeInsets:UIEdgeInsetsMake(imageSize.height,-imageSize.height,0,0)];
    [_BtnLoginFB setImageEdgeInsets:UIEdgeInsetsMake(0, 0, titleSize.height,-titleSize.height)];
    [_BtnLoginFB addTarget:self action:@selector(loginFB:) forControlEvents:UIControlEventTouchUpInside];
    [_loginView addSubview:_BtnLoginFB];
    
    
    //游客用户的设置
    _BtnLoginVistors=[UIButton buttonWithType:UIButtonTypeCustom];
    _BtnLoginVistors.frame=CGRectMake(0, 0, _loginView.frame.size.width*0.20, _loginView.frame.size.width*0.20);
    _BtnLoginVistors.center=CGPointMake(_registerBtn.center.x+_registerBtn.frame.size.width/4, orLabel.center.y*1.15);
    NSString *imgPathVis= [MYBUNDLE_PATH stringByAppendingPathComponent:@"1-8"];
    UIImage *backgroundImageVistor=[UIImage imageWithContentsOfFile:imgPathVis];
    [_BtnLoginVistors setBackgroundImage:backgroundImageVistor forState:UIControlStateNormal];
    _BtnLoginVistors.titleLabel.backgroundColor=_BtnLoginFB.backgroundColor;
    _BtnLoginVistors.imageView.backgroundColor = _BtnLoginFB.backgroundColor;
    [_BtnLoginVistors setTitleEdgeInsets:UIEdgeInsetsMake(imageSize.height,-imageSize.height,0,0)];
    [_BtnLoginVistors setImageEdgeInsets:UIEdgeInsetsMake(0, 0, titleSize.height,-titleSize.height)];
    [_loginView addSubview:_BtnLoginVistors];
}
#pragma mark --- 设置注册按钮事件 ---
-(void)EventsRegister:(id)sender
{
    [[TYSDKLoginManager sharedInstance] registerAcc];
   
}
#pragma mark --- UITapGestureRecognizer 忘记密码事件 ---
-(void)activiate:(UITapGestureRecognizer *)sender
{
    [[TYSDKLoginManager sharedInstance]forgetPsw];
    NSLog(@"忘记密码按钮激活");
}

#pragma mark --- 设置登录按钮事件 ---
-(void)EventsLogin:(id)sender
{
   
    if(![self isValidateEmail:_accountFd.text])
    {
        NSLog(@"请输入有效的邮箱");
    }
    else{
        [TYSDKDataModel sharedInstance].userModel.ty_user_email=_accountFd.text;
        NSLog(@"邮箱是%@",[TYSDKDataModel sharedInstance].userModel.ty_user_email);
        if(![self isValidatePassword:_passwordFd.text])
        {
            NSLog(@"请输入有效的密码");
        }else{
            [TYSDKDataModel sharedInstance].userModel.ty_password=_passwordFd.text;
            NSLog(@"密码是%@",[TYSDKDataModel sharedInstance].userModel.ty_password);
            [[TYSDKNetW shareInstance] createSession];
        }
    }
    [TYSDK loginSuccessHandler:^(NSString * user_name,NSString * user_lingpai,NSString * email,NSString * token) {
        NSLog(@"Login Success：userName:%@ lingpai:%@ email:%@ token: %@",user_name,user_lingpai,email,token);
    } logoutHandler:^{
        NSLog(@"logout sdk");
    }];
}
-(void)loginFB:(id)sender{
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[@"public_profile"@"Email"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             NSLog(@"Logged in");
         }
     }];
}
- (void)setLoginBtnState:(BOOL)canClick
{
    if (canClick) {
        _loginBtn.userInteractionEnabled = YES;
        NSLog(@"按钮响应");
    }
    else {
        _loginBtn.userInteractionEnabled = NO;
        NSLog(@"按钮不响应");
    }
}

-(BOOL )isValidateEmail:(NSString*)email
{
    NSString*emailRegex =@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}" ;
    NSPredicate *emailTest=[NSPredicate predicateWithFormat : @"SELF MATCHES%@",emailRegex];
    return[emailTest evaluateWithObject:email];
}
-(BOOL )isValidatePassword:(NSString*)password
{
    if(password==nil)
    {
        NSLog(@"请输入密码");
        return NO;
    }else if([password length]<6)
    {
        NSLog(@"密码长度小于6，无效");
        return NO;
    }else{
        NSLog(@"密码格式正确,有效");
        return YES;
    }
}
@end

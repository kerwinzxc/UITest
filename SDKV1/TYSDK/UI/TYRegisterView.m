//
//  TYRegisterView.m
//  UITest
//
//  Created by tianyou_ios on 2019/1/7.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import "TYRegisterView.h"
#import "UIColor+ColorChange.h"
#import "TYSDKLoginManager.h"
#import "TYSDKContainer.h"
#import "TYSDK.h"
#import "TYSDKDataModel.h"
#import "TYSDKDataDeal.h"

#define  SCREENSCALEWIDTH 1000/1080
#define  SCREENSCALEHEIGHT 1000/1920
#define  SCREEN_WIDTH ([[UIScreen mainScreen]bounds].size.width)
#define  SCREEN_HEIGHT ([[UIScreen mainScreen]bounds].size.height)

#define MYBUNDLE_NAME   @"TYSDKResource.bundle"
#define MYBUNDLE_PATH   [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:MYBUNDLE_NAME]
#define MYBUNDLE        [NSBundle bundleWithPath:MYBUNDLE_PATH]

@interface TYRegisterView ()
@property(nonatomic,readonly)UIView *registerView;
@property(nonatomic,strong)UIImageView *logoImageView;
@property(nonatomic,strong)UITextField *accountFd;
@property(nonatomic,strong)UITextField *passwordFd;
@property(nonatomic,strong)UITextField *passwordAgainFd;
@property(nonatomic,strong)UIButton *btnRegister;
@property(nonatomic,strong)UIButton *btnBack;
@end

@implementation TYRegisterView

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"1.jpg"]]];
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
    [self.view addSubview:_registerView];
    
    //图标的设置
    _logoImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _registerView.frame.size.width*0.45,_registerView.frame.size.height*0.09)];
    _logoImageView.center=CGPointMake(_registerView.frame.size.width/2, 0.05*_registerView.frame.size.height+_logoImageView.frame.size.height/2);
    NSString *imgPathLogo= [MYBUNDLE_PATH stringByAppendingPathComponent:@"1-9"];
    _logoImageView.image=[UIImage imageWithContentsOfFile:imgPathLogo];
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
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentLeft;
    NSAttributedString *attri = [[NSAttributedString alloc] initWithString:@"邮箱账号/ID" attributes:@{NSForegroundColorAttributeName:[UIColor  lightGrayColor],NSFontAttributeName:[UIFont fontWithName:@"futura" size:18], NSParagraphStyleAttributeName:style}];
    _accountFd.attributedPlaceholder = attri;
    UIImageView *accountLogo=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,_registerView.frame.size.height*0.05, _registerView.frame.size.height*0.05*(7/6))];
    NSString *imgPathAcc= [MYBUNDLE_PATH stringByAppendingPathComponent:@"1-6"];
    accountLogo.image=[UIImage imageWithContentsOfFile:imgPathAcc];
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
    NSMutableParagraphStyle *psStyle = [[NSMutableParagraphStyle alloc] init];
    psStyle.alignment = NSTextAlignmentLeft;
    NSAttributedString *attriPsw = [[NSAttributedString alloc] initWithString:@"密码" attributes:@{NSForegroundColorAttributeName:[UIColor  lightGrayColor],NSFontAttributeName:[UIFont fontWithName:@"futura" size:18], NSParagraphStyleAttributeName:psStyle}];
    _passwordFd.attributedPlaceholder = attriPsw;
    UIImageView *passwordLogo=[[UIImageView alloc]initWithFrame:CGRectMake(_passwordFd.frame.size.width*0.09, 0,_registerView.frame.size.height*0.05, _registerView.frame.size.height*0.05*(7/6))];
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
    [_registerView addSubview:_passwordFd];
    
    //二次密码框的设置
    _passwordAgainFd=[[UITextField alloc]initWithFrame:CGRectMake(0, 0, _registerView.frame.size.width*0.8, _registerView.frame.size.height*0.12)];
    _passwordAgainFd.center=CGPointMake(_registerView.frame.size.width/2, _passwordFd.center.y*1.3+_passwordAgainFd.frame.size.height);
    _passwordAgainFd.layer.cornerRadius=8.0;
    _passwordAgainFd.backgroundColor=[UIColor colorWithHexString:@"#2c2d3b"];
    NSMutableParagraphStyle *psAgainStyle = [[NSMutableParagraphStyle alloc] init];
    psAgainStyle.alignment = NSTextAlignmentLeft;
    NSAttributedString *attriPswAgain = [[NSAttributedString alloc] initWithString:@"请再次输入密码" attributes:@{NSForegroundColorAttributeName:[UIColor  lightGrayColor],NSFontAttributeName:[UIFont fontWithName:@"futura" size:18], NSParagraphStyleAttributeName:psAgainStyle}];
    _passwordAgainFd.attributedPlaceholder = attriPswAgain;
    _passwordAgainFd.textColor=[UIColor whiteColor];
    _passwordAgainFd.secureTextEntry=YES;
    UIImageView *passwordAgainLogo=[[UIImageView alloc]initWithFrame:CGRectMake(_passwordFd.frame.size.width*0.09, 0,_registerView.frame.size.height*0.05, _registerView.frame.size.height*0.05*(7/6))];
    NSString *imgPathPswAg= [MYBUNDLE_PATH stringByAppendingPathComponent:@"1-5"];
    passwordAgainLogo.image=[UIImage imageWithContentsOfFile:imgPathPswAg];
    passwordAgainLogo.contentMode=UIViewContentModeScaleAspectFit;
    _passwordAgainFd.leftView=passwordAgainLogo;
    _passwordAgainFd.leftViewMode=UITextFieldViewModeAlways;
    _passwordAgainFd.textColor=[UIColor whiteColor];
   UIView *lineViewPswA=[[UIView alloc]initWithFrame:CGRectMake(accountLogo.frame.origin.x,_passwordAgainFd.bounds.size.height, _passwordAgainFd.bounds.size.width, 2)];
    lineViewPswA.backgroundColor = [UIColor whiteColor];
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
    [_btnRegister addTarget:self action:@selector(EventsRegister:) forControlEvents:UIControlEventTouchUpInside];
    [_registerView addSubview:_btnRegister];
}
-(void)backToExView:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark --- 设置注册按钮事件 ---
-(void)EventsRegister:(id)sender
{
    if(![self isValidateEmail:_accountFd.text])
    {
        [self showMessage:@"请输入有效的邮箱或者ID"];
        NSLog(@"请输入有效的邮箱或者ID");
    }
    else{
        [TYSDKDataModel sharedInstance].userModel.email=_accountFd.text;
        NSLog(@"邮箱是%@",[TYSDKDataModel sharedInstance].userModel.email);
        if(![self isValidatePassword:_passwordFd.text])
        {
            [self showMessage:@"请输入有效的密码"];
            NSLog(@"请输入有效的密码");
        }
        else if(_passwordFd.text==_passwordAgainFd.text){
            [TYSDKDataModel sharedInstance].userModel.password=_passwordFd.text;
            NSLog(@"密码是%@",[TYSDKDataModel sharedInstance].userModel.password);
            [TYSDKDataModel sharedInstance].userModel.event=@"signup";
            [[TYSDKNetW shareInstance]createSession:^(NSDictionary *jsonDic)
             {
                 [self showMessage:[jsonDic valueForKey:@"message"]];
                 NSLog(@"%@",[jsonDic valueForKey:@"message"]);
                 [self showMessage:@"成功注册"];
             }];
        }
        else{
            [self showMessage:@"两次密码不匹配"];
            NSLog(@"两次密码不匹配");
        }
    }
}

-(BOOL)isValidateEmail:(NSString*)email
{
    NSString*emailRegex =@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}" ;
    NSPredicate *emailTest=[NSPredicate predicateWithFormat : @"SELF MATCHES%@",emailRegex];
    return[emailTest evaluateWithObject:email];
}
-(BOOL )isValidatePassword:(NSString*)password
{
    if(password==nil)
    {
       [self showMessage:@"请输入密码"];
        NSLog(@"请输入密码");
        return NO;
    }else if([password length]<6)
    {
        [self showMessage:@"密码长度小于6，无效"];
        NSLog(@"密码长度小于6，无效");
        return NO;
    }else{
        NSLog(@"密码格式正确,有效");
        return YES;
    }
}

- (void)showMessage:(NSString *)message
{
    // 1.创建UIAlertController
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Notification"
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    // 2.创建并添加按钮
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        

        //可跳转至登录窗口
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }];
    
    [alertController addAction:cancelAction];       // B
    [alertController addAction:okAction];           // A
    
    
    // 3.呈现UIAlertContorller
    [self presentViewController:alertController animated:YES completion:nil];
}

@end

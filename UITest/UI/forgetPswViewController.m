//
//  forgetPswViewController.m
//  UITest
//
//  Created by tianyou_ios on 2019/1/7.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import "forgetPswViewController.h"

#import "UIColor+ColorChange.h"


#define  SCREENSCALEWIDTH 1000/1080
#define  SCREENSCALEHEIGHT 1000/1920
#define  SCREEN_WIDTH ([[UIScreen mainScreen]bounds].size.width)
#define  SCREEN_HEIGHT ([[UIScreen mainScreen]bounds].size.height)

@interface forgetPswViewController ()
@property(nonatomic,readonly)UIView *forgetPswView;
@property(nonatomic,strong)UIImageView *logoImageView;
@property(nonatomic,strong)UITextField *emailFd;
@property(nonatomic,strong)UILabel *emailUP;
@property(nonatomic,strong)UILabel *emailDOWN1;
@property(nonatomic,strong)UILabel *emailDOWN2;
@property(nonatomic,strong)UIButton *btnZhaoHuiPsw;
@property(nonatomic,strong)UIButton *btnBack;
@end

@implementation forgetPswViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadForgetPswView];
    
}

-(void)loadForgetPswView
{
    _forgetPswView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH*SCREENSCALEWIDTH, SCREEN_HEIGHT*SCREENSCALEHEIGHT)];
    _forgetPswView.center =CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    _forgetPswView.backgroundColor =[UIColor colorWithHexString:@"#343645"];
    _forgetPswView.layer.cornerRadius=25.0;
    _forgetPswView.layer.masksToBounds=YES;
    _forgetPswView.autoresizesSubviews=YES;
    NSLog(@"%f,%f",_forgetPswView.frame.size.height,_forgetPswView.frame.size.width);
    [self.view addSubview:_forgetPswView];
    
    //图标的设置
    _logoImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _forgetPswView.frame.size.width*0.45,_forgetPswView.frame.size.height*0.09)];
    _logoImageView.center=CGPointMake(_forgetPswView.frame.size.width/2, 0.05*_forgetPswView.frame.size.height+_logoImageView.frame.size.height/2);
    _logoImageView.image=[UIImage imageNamed:@"1-9.png"];
    [_forgetPswView addSubview:_logoImageView];
    
    //返回按钮的设置
    _btnBack=[UIButton buttonWithType:UIButtonTypeCustom];
    _btnBack.frame=CGRectMake(0, 0, _forgetPswView.frame.size.width*3/20, _forgetPswView.frame.size.width*3/20);
    _btnBack.center=CGPointMake(_forgetPswView.frame.size.width/2+_logoImageView.frame.size.width*0.75, _logoImageView.center.y);
    [_btnBack setTitle:@"<" forState:UIControlStateNormal];
    [_btnBack setFont:[UIFont fontWithName:@"Helvetica-Bold" size:28]];
    _btnBack.layer.cornerRadius=_forgetPswView.frame.size.width*3/40;
    _btnBack.clipsToBounds=YES;
    [_btnBack setBackgroundColor:[UIColor colorWithHexString:@"abc6cf"]];
    [_btnBack addTarget:self action:@selector(backToExView:) forControlEvents:UIControlEventTouchDown];
    [_forgetPswView addSubview:_btnBack];
    
    //用户框的设置
    _emailFd=[[UITextField alloc]initWithFrame:CGRectMake(0, 0, _forgetPswView.frame.size.width*0.8, _forgetPswView.frame.size.height*0.12)];
    _emailFd.center=CGPointMake(_forgetPswView.frame.size.width/2, _forgetPswView.frame.size.width/2);
    _emailFd.layer.cornerRadius=8.0;
    _emailFd.backgroundColor=[UIColor colorWithHexString:@"#2c2d3b"];
    _emailFd.placeholder=[NSString stringWithFormat:@"请输入邮箱账号"];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentCenter;
    NSAttributedString *attri = [[NSAttributedString alloc] initWithString:@"请输入邮箱账号" attributes:@{NSForegroundColorAttributeName:[UIColor  lightGrayColor],NSFontAttributeName:[UIFont fontWithName:@"futura" size:18], NSParagraphStyleAttributeName:style}];
    _emailFd.attributedPlaceholder = attri;
    UIImageView *accountLogo=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,_forgetPswView.frame.size.height*0.05, _forgetPswView.frame.size.height*0.05*(7/6))];
    accountLogo.backgroundColor=[UIColor clearColor];
    accountLogo.contentMode=UIViewContentModeScaleAspectFit;
    _emailFd.leftView=accountLogo;
    _emailFd.leftViewMode=UITextFieldViewModeAlways;
    UIView *lineViewAcc=[[UIView alloc]initWithFrame:CGRectMake(accountLogo.frame.origin.x,_emailFd.bounds.size.height, _emailFd.frame.size.width, 2)];
    lineViewAcc.backgroundColor = [UIColor whiteColor];
    [_emailFd addSubview:lineViewAcc];
    [_forgetPswView addSubview:_emailFd];
    
    _emailUP=[[UILabel alloc]initWithFrame:CGRectMake(_emailFd.frame.origin.x, _emailFd.frame.origin.y-_emailFd.frame.size.height/2,_emailFd.frame.size.width, 10)];
    [_emailUP setText:[NSString stringWithFormat:@"通过邮箱验证找回密码："]];
    [_emailUP setTextColor:[UIColor whiteColor]];
    [_forgetPswView addSubview:_emailUP];
    
    
    _emailDOWN1=[[UILabel alloc]initWithFrame:CGRectMake(_emailFd.frame.origin.x, _emailFd.frame.origin.y+_emailFd.frame.size.height*1.4,_emailFd.frame.size.width, 20)];
    [_emailDOWN1 setText:[NSString stringWithFormat:@"我们将发送一封邮件到您的邮箱"]];
    [_emailDOWN1 setTextColor:[UIColor whiteColor]];
    [_forgetPswView addSubview:_emailDOWN1];
    
    _emailDOWN2=[[UILabel alloc]initWithFrame:CGRectMake(_emailFd.frame.origin.x, _emailDOWN1.frame.origin.y+_emailDOWN1.frame.size.height, _emailFd.frame.size.width, 20)];
    [_emailDOWN2 setText:[NSString stringWithFormat:@"请注意查收"]];
    [_emailDOWN2 setTextColor:[UIColor whiteColor]];
    [_forgetPswView addSubview:_emailDOWN2];
    
    
    //找回按钮的设置
    _btnZhaoHuiPsw=[UIButton buttonWithType:UIButtonTypeCustom];
    _btnZhaoHuiPsw.frame=CGRectMake(0, 0, _forgetPswView.frame.size.width*0.68, _forgetPswView.frame.size.height*0.12);
    _btnZhaoHuiPsw.center=CGPointMake(_forgetPswView.frame.size.width/2, _emailFd.center.y*2);
    [[_btnZhaoHuiPsw layer]setCornerRadius:30.0];
    [_btnZhaoHuiPsw setTitle:@"找回密码" forState:UIControlStateNormal];
    [_btnZhaoHuiPsw setFont:[UIFont systemFontOfSize:25]];
    [_btnZhaoHuiPsw setBackgroundColor:[UIColor colorWithHexString:@"ff8c37"]];
    [_forgetPswView addSubview:_btnZhaoHuiPsw];
}
-(void)backToExView:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

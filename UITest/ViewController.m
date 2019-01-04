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
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self loadLoginView];
   
}

-(void)loadLoginView
{
    _loginView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH*SCREENSCALEWIDTH, SCREEN_HEIGHT*SCREENSCALEHEIGHT)];
    _loginView.center =CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    _loginView.backgroundColor =[UIColor colorWithHexString:@"#343645"];
    _loginView.layer.cornerRadius=25;
    _loginView.layer.masksToBounds=YES;
//    _loginView.backgroundColor=[UIColor colorWithRed:52.0 green:54.0 blue:69.0 alpha:1.0];
    [self.view addSubview:_loginView];
    
    
    _logoImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80,20)];
    _logoImageView.center=CGPointMake(0, 0);
    _logoImageView.image=[UIImage imageNamed:@"1-9.png"];
    [_loginView addSubview:_logoImageView];
    
    
//    _accountFd=[[UITextField alloc]initWithFrame:CGRectMake(0, 90, 680/1000*_loginView.frame.size.width, 120/1000*_loginView.frame.size.height)];
//    _accountFd.layer.cornerRadius=2;
//    _accountFd.backgroundColor=[UIColor colorWithHexString:@"#2c2d3b"];
//    UIImageView *accountLogo=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height)];
//    accountLogo.image=[UIImage imageNamed:@"1-6.png"];
//    accountLogo.contentMode=UIViewContentModeScaleAspectFit;
//    _accountFd.leftView=accountLogo;
//    _accountFd.leftViewMode=UITextFieldViewModeAlways;
//    [_loginView addSubview:_accountFd];
//
    
    
//    _passwordFd=[[UITextField alloc]initWithFrame:CGRectMake(0,120, 680/1000*_loginView.frame.size.width, 120/1000*_loginView.frame.size.height)];
//    _passwordFd.backgroundColor=[UIColor colorWithHexString:@"#2c2d3b"];
//    [_loginView addSubview:_passwordFd];
    
    
}



@end

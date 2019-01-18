//
//  ViewController.m
//  TYSDKV1
//
//  Created by tianyou_ios on 2019/1/3.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import "ViewController.h"
#import <TYSDK/TYSDK.h>
#define AppId @"1073"
#define ServerId @"89"
#define ServerName @"遥远之忆"
#define RoleId @"190984"
#define RoleName @"盆子"
#define AccountId @"107093"

@interface ViewController ()
@property(nonatomic)UIButton *btnLogin;
@property(nonatomic)UIButton *btnPay;
@property(nonatomic)UIButton *btnLogout;
@property(nonatomic)UIButton *btnGame;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //登录
    _btnLogin=[UIButton buttonWithType:UIButtonTypeCustom];
    _btnLogin=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 200, 100)];
    _btnLogin.center=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2-150);
    [_btnLogin setTitle:@"登录" forState:UIControlStateNormal];
    _btnLogin.backgroundColor=[UIColor darkGrayColor];
    [_btnLogin addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:_btnLogin];
    //充值
    _btnPay=[UIButton buttonWithType:UIButtonTypeCustom];
    _btnPay=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 200, 100)];
    _btnPay.center=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2-50);
    [_btnPay setTitle:@"充值" forState:UIControlStateNormal];
    _btnPay.backgroundColor=[UIColor lightGrayColor];
    [_btnPay addTarget:self action:@selector(pay:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:_btnPay];
    
    _btnLogout=[UIButton buttonWithType:UIButtonTypeCustom];
    _btnLogout=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 200, 100)];
    _btnLogout.center=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2+50);
    [_btnLogout setTitle:@"登出" forState:UIControlStateNormal];
    _btnLogout.backgroundColor=[UIColor grayColor];
    [_btnLogout addTarget:self action:@selector(logout:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:_btnLogout];
    
    _btnGame=[UIButton buttonWithType:UIButtonTypeCustom];
    _btnGame=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 200, 100)];
    _btnGame.center=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2+150);
    [_btnGame setTitle:@"游戏参数传值" forState:UIControlStateNormal];
    _btnGame.backgroundColor=[UIColor grayColor];
    [_btnGame addTarget:self action:@selector(onGame:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:_btnGame];
    
    
   
   
    // Do any additional setup after loading the view, typically from a nib.


}
-(void)login:(id)sender
{
    [TYSDK createRoleWithServerId:ServerId serverName:ServerName roleId:RoleId roleName:RoleName accountID:AccountId];
    [TYSDK showTheLoginView];
}
-(void)pay:(id)sender{
    //充值，待写
}
-(void)logout:(id)sender{
    [TYSDK logout];
}

-(void)onGame:(id)sender{
    [TYSDK createRoleWithServerId:ServerId serverName:ServerName roleId:RoleId roleName:RoleName accountID:AccountId];
}
@end


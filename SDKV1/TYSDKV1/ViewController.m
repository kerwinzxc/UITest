//
//  ViewController.m
//  TYSDKV1
//
//  Created by tianyou_ios on 2019/1/3.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import "ViewController.h"
#import <TYSDK/TYSDK.h>
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
@end


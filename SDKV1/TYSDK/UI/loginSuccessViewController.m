//
//  loginSuccessViewController.m
//  TYSDK
//
//  Created by tianyou_ios on 2019/1/22.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import "loginSuccessViewController.h"
#import "TYLoginView.h"
#import "UIColor+ColorChange.h"
#import "TYSDKDataModel.h"

#define  SCREENSCALEHEIGHT 200/1920

#define  SCREEN_WIDTH ([[UIScreen mainScreen]bounds].size.width)
#define  SCREEN_HEIGHT ([[UIScreen mainScreen]bounds].size.height)
@interface loginSuccessViewController ()

@end

@implementation loginSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
-(void)loadSuccessView:(loginSucceessHandler)loginSuccessHandler{
    
    _ty_loginHandle=loginSuccessHandler;
    self.view.backgroundColor=[UIColor clearColor];
    self.view.userInteractionEnabled=YES;
    
    UIView *vc=[[UIView alloc]init];
    vc.frame=CGRectMake(0, 0, SCREEN_WIDTH, SCREENSCALEHEIGHT*SCREEN_HEIGHT);
    //    [vc setBackgroundColor:[UIColor colorWithHexString:@"#ffffff"]];
    [vc setBackgroundColor:[UIColor redColor]];
    [vc setAlpha:0.8];
    [self.view addSubview:vc];
    
    UILabel *label=[[UILabel alloc]init];
    label.frame=CGRectMake(0, 0, vc.frame.size.width, vc.frame.size.height);
    label.center=CGPointMake(vc.frame.size.width/2, vc.frame.size.height/2);
    label.text=[NSString stringWithFormat:@"欢迎，%@",[TYSDKDataModel sharedInstance].userModel.ty_user_lingPai];
    [vc addSubview:label];
    
    UILabel *labelSwitchUsers=[[UILabel alloc]init];
    labelSwitchUsers.bounds=CGRectMake(0, 0, 10, 10);
    labelSwitchUsers.center=CGPointMake(vc.frame.size.width/2, vc.frame.size.height/2);
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc]initWithString:@"切换账号"];
    //label添加文本下划线
    [labelSwitchUsers setLineBreakMode:NSLineBreakByWordWrapping];
    NSRange contentRange = {0,[content length]};
    [content addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:contentRange];
    //label添加文本
    labelSwitchUsers.attributedText = content;
    //label添加点击事件
    UITapGestureRecognizer *labelGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(switchUser:)];
    [labelSwitchUsers setUserInteractionEnabled:YES];
    [labelSwitchUsers addGestureRecognizer:labelGesture];
    [vc addSubview:labelSwitchUsers];
    
//    return vc;
}

@end

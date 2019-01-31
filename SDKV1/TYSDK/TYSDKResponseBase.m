//
//  TYSDKResponseBase.m
//  UITest
//
//  Created by tianyou_ios on 2019/1/8.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import "TYSDKResponseBase.h"
#import "TYLoginView.h"
#import "TYSDKDataModel.h"
#import "TYTokenManager.h"
#import "loginSuccessViewController.h"

@implementation TYSDKResponseBase
-(void)viewDidLoad{
   
}
+(void)analyTheDic:(NSDictionary *)jsonDicitonary
{
    NSNumber *tyResultCode=[jsonDicitonary valueForKey:@"resultCode"];
    NSString *tyMessage=[jsonDicitonary valueForKey:@"message"];
    NSDictionary *tyData=[jsonDicitonary valueForKey:@"data"];
    NSUserDefaults *myUserData = [NSUserDefaults standardUserDefaults];
    id accountIdTydata=[tyData valueForKey:@"accountId"];
    id tokenTydata=[tyData valueForKey:@"token"];
    id loginState=0;
    //添加一个提示框
    
    if([tyResultCode isEqualToNumber:[NSNumber numberWithInt:200]])
    {
        
        [self showLoginSuccessMessage:[NSString stringWithFormat:@"%@",tyMessage]];
        NSLog(@"showLoginSuccessMessage:%@",tyMessage);
        //保存游戏数据中Data里面的accountID以及token，以备以后进行快速登录
        [myUserData setObject:accountIdTydata forKey:@"AccountID"];
        [myUserData setObject:tokenTydata forKey:@"Token"];
        [myUserData synchronize];
        
    }else if([tyResultCode isEqualToNumber:[NSNumber numberWithInt:40009]]){
        [self showMessage:[NSString stringWithFormat:@"%@",tyMessage]];
        
        NSLog(@"%@",tyMessage);
        //提示游戏账户异常，弹出对话框让玩家尽快联系客服处理账户异常问题,可以进入游戏
    }else if([tyResultCode isEqualToNumber:[NSNumber numberWithInt:40102]]){
        [self showMessage:[NSString stringWithFormat:@"%@",tyMessage]];
        NSLog(@"%@",tyMessage);
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:tyMessage delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
        [alert show];
        
        //添加延迟时间为1.0秒 然后执行dismiss:方法
        [self performSelector:@selector(dismiss:) withObject:alert afterDelay:5.0];
        //游戏账号已经冻结，禁止进入游戏
    }else{
        if(![tyData isKindOfClass:[NSNull class]]){
            [self showMessage:[NSString stringWithFormat:@"%@",tyMessage]];
            NSLog(@"%@",tyResultCode);
            NSLog(@"%@",tyMessage);
        }else{
            [self showMessage:[NSString stringWithFormat:@"%@",tyData]];
            NSLog(@"%@",tyResultCode);
            NSLog(@"%@",tyData);
        }
    }
   
}
+(UIView *)currentView
{
    return [[[UIApplication sharedApplication] delegate] window] ;
}
+(void)showMessage:(NSString *)message
{
    // 1.创建UIAlertController
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示"
                                                                             message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    // 2.创建并添加按钮
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"OK Action");
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Cancel Action");
    }];
    
    [alertController addAction:cancelAction];       // B
    [alertController addAction:okAction];           // A
    
    // 3.添加UIAlertControllerw为视图窗口
    [[self topViewController] presentViewController:alertController animated:YES completion:nil];
}
+(void)showLoginSuccessMessage:(NSString *)message
{
    // 1.创建UIAlertController
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示"
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    // 2.创建并添加按钮
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"OK Action");
        
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Cancel Action");
    }];
    
    [alertController addAction:cancelAction];       // B
    [alertController addAction:okAction];           // A
    
    // 3.添加UIAlertControllerw为视图窗口
    [[self topViewController] presentViewController:alertController animated:YES completion:nil];
}


+(UIViewController*)topViewController
{
    return [self topViewControllerWithRootViewController:[[UIApplication sharedApplication] keyWindow].rootViewController];
}

+(UIViewController*)topViewControllerWithRootViewController:(UIViewController*)rootViewController
{
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarController = (UITabBarController *)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
    } else {
        return rootViewController;
    }
}



//实现dismiss方法
- (void)dismiss:(UIAlertView *)alert
{
    //此处相当于5秒之后自动点了cancel按钮
    [alert dismissWithClickedButtonIndex:[alert cancelButtonIndex] animated:YES];
}
@end

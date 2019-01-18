//
//  TYSDKContainer.mm
//  UITest
//
//  Created by tianyou_ios on 2019/1/8.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "TYSDKContainer.h"
#import "TYLoginView.h"
#import "TYSDKLoginManager.h"
#import "TYRegisterView.h"
#import "TYforgetPswView.h"
#import "TYSDKUser.h"
#import "TYLoginLogic.h"
#import "TYSDKDataDeal.h"

@interface TYSDKContainer()
@property (nonatomic) id<TYSDKContainerDelegate>delegate;
@end

@implementation TYSDKContainer
+(instancetype)sharedInstance{
    static TYSDKContainer* instance=nil;
    static dispatch_once_t once= 0;
    dispatch_once (&once,^{
        instance = [[TYSDKContainer alloc]init];
    });
    return instance;
}

//-(void)doInitThirdSDK:(id<TYSDKContainerDelegate>)delegate Application:(UIApplication *)application  Options:(NSDictionary *)launchOptions{
//    self.delegate=delegate;
//    self.applica=application;
//    self.launchOp=launchOptions;
//    NSLog(@"doInitThirdSDK and Game Version is %@and %@",application,launchOptions);
//}
-(void)doInitThirdSDK:(NSString *)appId{
    
    [TYSDKDataModel sharedInstance].accountModel.appId=appId;
    NSLog(@"%@",_appId);
}
-(void)loginSDK{
    TYLoginView *loginViewSDK= [TYLoginView alloc];
    [self.currentView presentViewController:loginViewSDK animated:YES completion:nil];
    NSLog(@"loginSDK");
}
-(void)logoutSDK{
     NSLog(@"logoutSDK");
}

-(void)loginSuccessHandler:(void(^)(NSString * user_name,NSString * user_id,NSString * phone_number,NSString * session_id))loginHander logoutHandler:(void (^)(void))logoutHandler{
    
    if(loginHander){
        [TYLoginLogic sharedInstance].p_loginHandler=loginHander;
    }
    if(logoutHandler){
        [TYLoginLogic sharedInstance].p_logoutHandler = logoutHandler;
    }
     [[TYSDKDataDeal shareInstance]dicPinJie];
}


-(void)switchUser{
    [self logoutSDK];
    [self loginSDK];
     NSLog(@"switchUser");
}
-(void)paySDK{
     NSLog(@"paySDK");
}
-(void)registerSDK
{
    TYRegisterView *registerViewSDK= [TYRegisterView alloc];
    [self.getCurrentView presentViewController:registerViewSDK animated:YES completion:nil];
    NSLog(@"注册界面激活");
}
-(void)forgetSDK{
    TYforgetPswView *forgetViewSDK= [TYforgetPswView alloc];
    [self.getCurrentView presentViewController:forgetViewSDK animated:YES completion:nil];
    NSLog(@"忘记密码界面激活");
}
-(UIViewController *)currentView
{
    return [[[[UIApplication sharedApplication] delegate] window] rootViewController];
}

//获取当前o屏幕的UIViewController
-(UIViewController *)getCurrentView
{
    UIViewController *rootViewController= [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *currentView=[self getCurrentViewFrom:rootViewController];
    return currentView;
}


-(UIViewController* )getCurrentViewFrom:(UIViewController *)rootVC
{
    UIViewController *currentView;
    if([rootVC presentedViewController] )
    {
        rootVC=[rootVC presentedViewController];
    }
    
    if([rootVC isKindOfClass:[UITabBarController class]] )
    {
        currentView= [self getCurrentViewFrom:[(UITabBarController *)rootVC selectedViewController]];
    }
    else if([rootVC isKindOfClass:[UINavigationController class]] )
    {
        currentView= [self getCurrentViewFrom:[(UINavigationController *)rootVC visibleViewController]];
    }else{
        currentView = rootVC;
    }
    return currentView;
}
@end

//
//  TYSDKLoginManager.m
//  UITest
//
//  Created by tianyou_ios on 2019/1/8.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "TYSDKLoginManager.h"
#import "TYSDKContainer.h"

#import "UI/TYLoginView.h"
#import "TYSDKDataDeal.h"
#import "TYSDKNetW.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "TYSDKDataModel.h"


@implementation TYSDKLoginManager
+(instancetype)sharedInstance{
    static TYSDKLoginManager* instance=nil;
    static dispatch_once_t once= 0;
    dispatch_once (&once,^{
        instance = [[TYSDKLoginManager alloc]init];
    });
    return instance;
}
-(void)TYInitSDK:(NSString*)appId
{
    [[TYSDKContainer sharedInstance]doInitThirdSDK:appId];
}
//-(void)TYInitSDK:(UIApplication *)application  Options:(NSDictionary *)launchOptions;{
//    [[TYSDKContainer sharedInstance]doInitThirdSDK:self Application:application Options:launchOptions];
//    [[FBSDKApplicationDelegate sharedInstance] application:application
//                             didFinishLaunchingWithOptions:launchOptions];
//
//}
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    
    BOOL handled = [[FBSDKApplicationDelegate sharedInstance] application:application
                                                                  openURL:url sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey] annotation:options[UIApplicationOpenURLOptionsAnnotationKey]
            ];
    // Add any custom logic here.
    return handled;
}

-(void)TYLoginShowView{
    [[TYSDKContainer sharedInstance] loginSDK];
}
-(void)TYLogoutSDK{
    [[TYSDKContainer sharedInstance] logoutSDK];

}
-(void)TYSwithchUserSDK{
    [[TYSDKContainer sharedInstance] switchUser];
    
}

-(void)registerAcc{
    [[TYSDKContainer sharedInstance]registerSDK];
}
-(void)TYPaySDK{
     [[TYSDKContainer sharedInstance] paySDK];
}
-(void)forgetPsw{
    [[TYSDKContainer sharedInstance]forgetSDK];
}
-(void)createRoleWithServerId:(NSString *)serverId serverName:(NSString *)serverName roleId:(NSString *)roleId roleName:(NSString *)roleName accountID:(NSString*)accountId{
    
    [TYSDKDataModel sharedInstance].accountModel.serverName=serverName;
    [TYSDKDataModel sharedInstance].accountModel.serverId=serverId;
    [TYSDKDataModel sharedInstance].accountModel.roleName=roleName;
    [TYSDKDataModel sharedInstance].accountModel.roleId=roleId;
    [TYSDKDataModel sharedInstance].accountModel.accountId= accountId;
}

//-(void)createSession:(updataTheUI)block{
//    [TYSDKNetW shareInstance]createSession:<#^(NSDictionary *jsonDic)block#>;
//}
-(void)initFinish:(NSDictionary*)initMsg{
    
    [self TYLoginShowView];
    NSLog(@"SDK Init Success");
}
-(void)loginFinished:(NSDictionary*)loginMsg{
    NSLog(@"SDK Login Success");
    
}
-(void)logoutFinished:(NSDictionary*)logoutMsg{
    [self notifitionLogoutSuccess];
    NSLog(@"SDK Logout Success");
}
-(void)payFinish:(NSDictionary*)payMsg{
    NSLog(@"SDK Pay Finish");
}

@end

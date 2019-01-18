//
//  TYSDKLoginManager.m
//  UITest
//
//  Created by tianyou_ios on 2019/1/8.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import "TYSDKLoginManager.h"


@implementation TYSDKLoginManager
+(instancetype)sharedInstance{
    static TYSDKLoginManager* instance=nil;
    static dispatch_once_t once= 0;
    dispatch_once (&once,^{
        instance = [[TYSDKLoginManager alloc]init];
    });
    return instance;
}

-(void)TYInitSDK:(NSString *)gameVersion{
    [[TYSDKContainer sharedInstance]doInitThirdSDK:self gameVersion:gameVersion];
}
-(void)TYLoginSDK{
    [[TYSDKContainer sharedInstance] loginSDK];
}
-(void)TYLogoutSDK{
    [[TYSDKContainer sharedInstance] logoutSDK];
}
-(void)TYSwithchUserSDK{
    [[TYSDKContainer sharedInstance] switchUser];
}
-(void)TYPaySDK{
     [[TYSDKContainer sharedInstance] paySDK];
}
-(void)TYUsersCenterSDK{
    [[TYSDKContainer sharedInstance] showTheUserCenter];
}


-(void)initFinish:(NSDictionary*)initMsg{
    
    [self TYLoginSDK];
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

//通知
-(void)notifitionLoginSuccess:(TYSDKUser *)sdkUser{
//    [[NSNotificationCenter defaultCenter]postNotificationName:<#(nonnull NSNotificationName)#> object:self userInfo:<#(nullable NSDictionary *)#>];
     NSLog(@"SDK Login Success");
}
-(void)notifitionLoginError{
     NSLog(@"SDK Login Error");
}
-(void)notifitionLoginCancel{
     NSLog(@"SDK Login Cancel");
}

-(void)notifitionLogoutSuccess{
     NSLog(@"SDK Login Cancel");
}

-(void)notifitionCreateOrderError{
     NSLog(@"SDK Create Order Error");
}
-(void)notifitionPaySuccess{
     NSLog(@"SDK Pay Success");
}
-(void)notifitionPayCancel{
     NSLog(@"SDK Pay Cancel");
}
-(void)notifitionPayError{
     NSLog(@"SDK Pay Error");
}
-(void)notifitionPayShippingStatus{
     NSLog(@"SDK Pay Shipping");
}
-(void)notifitionPayNetError{
     NSLog(@"SDK Pay Net Error");
}

@end

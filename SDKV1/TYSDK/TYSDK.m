//
//  TYSDK.m
//  TYSDK
//
//  Created by tianyou_ios on 2019/1/8.
//  Copyright © 2019 tianyou_ios. All rights reserved.

#import "TYSDK.h"
#import "TYSDKLoginManager.h"
#import "UI/TYLoginView.h"
@implementation TYSDK
+(id)sharedInstance{
    static TYSDK *_instance = nil;
    static dispatch_once_t one_time = 0;
    dispatch_once(&one_time, ^{
        _instance = [[TYSDK alloc] init];
    });
    return _instance;
}

+(void)loginSuccessHandler:(void(^)(NSString * user_name,NSString * user_lingpai,NSString * email,NSString * token))loginHandler
             logoutHandler:(void (^)(void))logoutHandler{
    
    [TYSDKLoginManager loginSuccessHandler:loginHandler logoutHandler:logoutHandler];
}

+(void)initSDK:(NSString*)appId{
    [[TYSDKLoginManager sharedInstance]TYInitSDK:appId];
}

+(void)logout{
    [[TYSDKLoginManager sharedInstance]TYLogoutSDK];
}

+(void)payWithParams:(NSDictionary *)userParams{
//    []
}
+(void)createRoleWithServerId:(NSString *)serverId serverName:(NSString *)serverName roleId:(NSString *)roleId roleName:(NSString *)roleName accountID:(NSString*)accountId{
    [[TYSDKLoginManager sharedInstance]createRoleWithServerId:serverId serverName:serverName roleId:roleId roleName:roleName accountID:accountId];

}

+(void)showTheLoginView
{
    [[TYSDKContainer sharedInstance]loginSDK];
}
@end

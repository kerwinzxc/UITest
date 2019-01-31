//
//  TYSDKLoginManager.h
//  UITest
//
//  Created by tianyou_ios on 2019/1/8.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TYSDKLoginReq.h"
#import "TYSDKLoginManager.h"
#import "TYSDKContainer.h"

#import "UI/TYLoginView.h"
#import "TYSDKDataDeal.h"
#import "TYSDKNetW.h"

NS_ASSUME_NONNULL_BEGIN

@interface TYSDKLoginManager : NSObject<TYSDKContainerDelegate>

+(instancetype)sharedInstance;

-(void)TYInitSDK:(NSString*)appId;
-(void)TYLoginShowView;
-(void)TYLogoutSDK;
-(void)TYSwithchUserSDK;
-(void)TYPaySDK;
-(void)registerAcc;
-(void)forgetPsw;

-(void)createRoleWithServerId:(NSString *)serverId serverName:(NSString *)serverName roleId:(NSString *)roleId roleName:(NSString *)roleName accountID:(NSString*)accountId;
//-(void)TYPaySDK:(SDKPayInfo *)sdkPayInfo;
-(void)TYUsersCenterSDK;

+(void)loginSuccessHandler:(void(^)(NSString * user_name,NSString * user_id,NSString * phone_number,NSString * session_id))loginHander logoutHandler:(void (^)(void))logoutHandler;

@end

NS_ASSUME_NONNULL_END

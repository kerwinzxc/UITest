//
//  TYSDKContainer.h
//  UITest
//
//  Created by tianyou_ios on 2019/1/8.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TYSDKUser.h"
@protocol TYSDKContainerDelegate <NSObject>
-(void)initFinish:(NSDictionary*)initMsg;
-(void)loginFinished:(NSDictionary*)loginMsg;
-(void)logoutFinished:(NSDictionary*)logoutMsg;
-(void)payFinish:(NSDictionary*)payMsg;


-(void)notifitionLoginSuccess:(TYSDKUser *)sdkUser;
-(void)notifitionLoginError;
-(void)notifitionLoginCancel;

-(void)notifitionLogoutSuccess;

-(void)notifitionCreateOrderError;
-(void)notifitionPaySuccess;
-(void)notifitionPayCancel;
-(void)notifitionPayError;
-(void)notifitionPayDealing;
-(void)notifitionPayNetError;


@end
@interface TYSDKContainer : NSObject

@property (nonatomic,assign)UIApplication *applica;
@property (nonatomic,assign)NSDictionary *launchOp;
@property (nonatomic,copy)NSString *appId;
+(instancetype)sharedInstance;

-(void)doInitThirdSDK:(NSString *)appId;
-(void)loginSuccessHandler:(void(^)(NSString * user_name,NSString * user_id,NSString * phone_number,NSString * session_id))loginHander logoutHandler:(void (^)(void))logoutHandler;

-(void)loginSDK;
-(void)logoutSDK;
-(void)switchUser;
-(void)paySDK;
-(void)registerSDK;
-(void)forgetSDK;
@end



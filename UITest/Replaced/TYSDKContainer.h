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
-(void)notifitionPayShippingStatus;
-(void)notifitionPayNetError;

@end
@interface TYSDKContainer : NSObject
+(instancetype)sharedInstance;

-(void)doInitThirdSDK:(id<TYSDKContainerDelegate>)delegate gameVersion:(NSString*)gameVersion;

-(void)loginSDK;
-(void)logoutSDK;
-(void)switchUser;
-(void)paySDK;
-(void)showTheUserCenter;

@end



//
//  TYSDKLoginManager.h
//  UITest
//
//  Created by tianyou_ios on 2019/1/8.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TYSDKContainer.h"
#import "TYSDKLoginReq.h"


NS_ASSUME_NONNULL_BEGIN

@interface TYSDKLoginManager : NSObject<TYSDKContainerDelegate>
+(instancetype)sharedInstance;

-(void)TYInitSDK:(NSString *)gameVersion;
-(void)TYLoginSDK;
-(void)TYLogoutSDK;
-(void)TYSwithchUserSDK;
-(void)TYPaySDK;
//-(void)TYPaySDK:(SDKPayInfo *)sdkPayInfo;
-(void)TYUsersCenterSDK;
@end

NS_ASSUME_NONNULL_END

//
//  TYSDK.h
//  TYSDK
//
//  Created by tianyou_ios on 2019/1/8.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface TYSDK : NSObject

+(id)sharedInstance;


+(void)initSDK:(NSString*)appId;

+(void)showTheLoginView;
+(void)loginSuccessHandler:(void(^)(NSString * user_name,NSString * user_lingpai,NSString * email,NSString * token))loginHandler logoutHandler:(void (^)(void))logoutHandler;

+(void)logout;

+(void)createRoleWithServerId:(NSString *)serverId serverName:(NSString *)serverName roleId:(NSString *)roleId roleName:(NSString *)roleName accountID:(NSString*)accountId;
+(void)payWithParams:(NSDictionary *)userParams;



@end

NS_ASSUME_NONNULL_END

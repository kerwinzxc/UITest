//
//  TYSDKAccount.h
//  TYSDK
//
//  Created by tianyou_ios on 2019/1/14.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//
//--------------------全局账号参数----------------------------
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TYSDKAccount : NSObject
@property(nonatomic,copy)NSString *appId;
@property(nonatomic,copy)NSString *serverId;
@property(nonatomic,copy)NSString *serverName;
@property(nonatomic,copy)NSString *roleId;
@property(nonatomic,copy)NSString *roleName;
@property(nonatomic,copy)NSString *accountId;

@end

NS_ASSUME_NONNULL_END

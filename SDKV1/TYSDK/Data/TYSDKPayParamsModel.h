//
//  TYSDKUser.h
//  TYSDK
//
//  Created by tianyou_ios on 2019/1/18.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TYSDKUser : NSObject
/**
 玩家登录用的邮箱
 **/
@property(nonatomic , copy) NSString * email;
/**
 玩家登录用的令牌
 **/
@property(nonatomic , copy) NSString * ty_user_lingPai;
/**
 服务器校验玩家的token值
 **/
@property(nonatomic , copy) NSString * token;
/**
 玩家登录的密码
 **/
@property(nonatomic , copy) NSString * password;
@end

NS_ASSUME_NONNULL_END

//
//  TYTokenManager.m
//  TYSDK
//
//  Created by tianyou_ios on 2019/1/22.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import "TYTokenManager.h"

NSString *const TOKEN_KEY = @"Token";
@implementation TYTokenManager


+(void)saveToken:(TYSDKUser *)token
{
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    NSData *tokenData = [NSKeyedArchiver archivedDataWithRootObject:token];
    [userDefaults setObject:tokenData forKey:TOKEN_KEY];
    [userDefaults synchronize];
}

// 读取token
+(TYSDKUser *)getToken
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *tokenData = [userDefaults objectForKey:TOKEN_KEY];
    TYSDKUser *token = [NSKeyedUnarchiver unarchiveObjectWithData:tokenData];
    [userDefaults synchronize];
    return token;
}
+(void)cleanToken
{
    NSUserDefaults *UserLoginState = [NSUserDefaults standardUserDefaults];
    [UserLoginState removeObjectForKey:TOKEN_KEY];
    [UserLoginState synchronize];
}

@end

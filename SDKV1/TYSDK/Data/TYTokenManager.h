//
//  TYTokenManager.h
//  TYSDK
//
//  Created by tianyou_ios on 2019/1/22.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TYSDKUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface TYTokenManager : NSObject
// 存储token
+(void)saveToken:(TYSDKUser*)token;
// 读取token
+(TYSDKUser *)getToken;
// 清空token
+(void)cleanToken;
@end

NS_ASSUME_NONNULL_END

//
//  TYLoginLogic.h
//  TYSDK
//
//  Created by tianyou_ios on 2019/1/12.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^loginHandler)(NSString * userName,NSString * uid,NSString * mobile,NSString * sessionId);
typedef void (^logoutHandler)(void);
@interface TYLoginLogic : NSObject
@property(nonatomic , copy) loginHandler p_loginHandler;
@property(nonatomic , copy) logoutHandler p_logoutHandler;
+(TYLoginLogic *)sharedInstance;
+(void)loginCallBackWithAccount:(NSDictionary *)account;
@end

NS_ASSUME_NONNULL_END

//
//  TYSDKDataModel.h
//  TYSDK
//
//  Created by tianyou_ios on 2019/1/14.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TYSDKDevice.h"
#import "TYSDKUser.h"
#import "TYSDKAccount.h"



NS_ASSUME_NONNULL_BEGIN

@interface TYSDKDataModel:NSObject
+(instancetype)sharedInstance;


@property(nonatomic, strong) TYSDKAccount *accountModel;

@property(nonatomic, strong) TYSDKDevice *deviceModel;

@property(nonatomic, strong) TYSDKUser *userModel;
@end

NS_ASSUME_NONNULL_END

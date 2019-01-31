//
//  TYSDKDevice.h
//  TYSDK
//
//  Created by tianyou_ios on 2019/1/11.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//
//--------------------全局设备参数----------------------------



#import <Foundation/Foundation.h>
#import "Reachability.h"

NS_ASSUME_NONNULL_BEGIN

@interface TYSDKDevice : NSObject

@property(nonatomic,copy)NSString *package;
@property(nonatomic,copy)NSString *customerId;//md5(bundleId+imei)

@property(nonatomic,copy)NSString *imei;
@property(nonatomic,copy)NSString *mac;
@property(nonatomic,copy)NSString *appVersionCode;
@property(nonatomic,copy)NSString *appVersionName;
//设备模型
@property(nonatomic,copy)NSString *model;
//设备版本号
@property(nonatomic,copy)NSString *sysVersionCode;
@property(nonatomic,copy)NSString *sysVersionName;
@property(nonatomic,copy)NSString *time;

@property(nonatomic,copy)NSString *language;
@property(nonatomic,copy)NSString *screenSize;
@property(nonatomic,copy)NSString *countryCode;
//设备ID
@property(nonatomic,copy)NSString *idfa;
//当前网络状态
@property(nonatomic,copy)NSString *netType;
@property(nonatomic,copy)NSString *platform;
@property(nonatomic,copy)NSString *deviceIdentifier;
@property(nonatomic,copy)NSString *deviceType;
@end

NS_ASSUME_NONNULL_END

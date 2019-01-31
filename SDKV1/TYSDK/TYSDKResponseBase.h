//
//  TYSDKResponseBase.h
//  UITest
//
//  Created by tianyou_ios on 2019/1/8.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//
//-------------------------服务器回传的参数进行解析做相对应的基本处理----------------------------//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Data/TYSDKUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface TYSDKResponseBase : NSObject
@property (nonatomic)UIWindow *keyWindow;
+(void)analyTheDic:(NSDictionary *)jsonDicitonary;
+(void)showMessage:(NSString *)message;
@end

NS_ASSUME_NONNULL_END

//
//  TYSDKPay.h
//  TYSDK
//
//  Created by tianyou_ios on 2019/1/16.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TYSDKPay : NSObject
+(instancetype)shareInstance;
-(void)connectionWithParams:(NSDictionary *)params;
@end

NS_ASSUME_NONNULL_END

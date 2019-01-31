//
//  TYSDKApi.h
//  TYSDK
//
//  Created by tianyou_ios on 2019/1/14.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^failure)(NSInteger code,NSString * msg);
typedef void (^completionHandler)(NSDictionary * response);

@interface TYSDKApi : NSObject
+(void)enterApp;
@end

NS_ASSUME_NONNULL_END

//
//  TYSDKDataDeal.h
//  TYSDK
//
//  Created by tianyou_ios on 2019/1/15.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TYSDKDataModel.h"
#import "MJExtension.h"
#import "TY_Encryption.h"
NS_ASSUME_NONNULL_BEGIN

@interface TYSDKDataDeal : NSObject
@property(nonatomic,copy)NSMutableString *headPostKey;
@property(nonatomic,copy)NSMutableDictionary *dateBeforePost;
@property(nonatomic,copy)NSString *dicPinJie;
+(instancetype)shareInstance;

@end

NS_ASSUME_NONNULL_END

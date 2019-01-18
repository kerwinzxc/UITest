//
//  TYSDKDataModel.m
//  TYSDK
//
//  Created by tianyou_ios on 2019/1/14.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import "TYSDKDataModel.h"


@implementation TYSDKDataModel : NSObject
+(instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    static TYSDKDataModel * model;
    dispatch_once(&onceToken, ^{
        model = [[TYSDKDataModel alloc] initModels];
    });
     return model;
}

- (instancetype)initModels {
    self = [super init];
    if (self) {
        _accountModel = [[TYSDKAccount alloc] init];
        _deviceModel = [[TYSDKDevice alloc] init];
        _userModel = [[TYSDKUser alloc] init];
    }
    return self;
}
@end

//
//  SDKLoginManager.m
//  UITest
//
//  Created by tianyou_ios on 2019/1/8.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import "SDKLoginManager.h"


@implementation SDKLoginManager
+(instancetype)sharedInstance{
    static SDKLoginManager* instance=nil;
    static dispatch_once_t once= 0;
    dispatch_once (&once,^{
        instance = [[SDKLoginManager alloc]init];
    });
    return instance;
}

-(void)TYInitSDK:(NSString *)gameVersion{
    [[SDKContainer sharedInstance]doInitThirdSDK:self gameVersion:gameVersion];
}
-(void)TYLoginSDK{
    [[SDKContainer sharedInstance] loginSDK];
}
-(void)TYLogoutSDK{
    [[SDKContainer sharedInstance] logoutSDK];
}
-(void)TYSwithchUserSDK{
    [[SDKContainer sharedInstance] switchUser];
}
-(void)TYPaySDK{
     [[SDKContainer sharedInstance] paySDK];
}
-(void)TYUsersCenterSDK{
    [[SDKContainer sharedInstance] showTheUserCenter];
}

@end

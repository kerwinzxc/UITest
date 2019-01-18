//
//  TYSDKUser.m
//  UITest
//
//  Created by tianyou_ios on 2019/1/8.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import "TYSDKUser.h"

@implementation TYSDKUser
+(instancetype)sharedInstance{
    static TYSDKUser* instance=nil;
    static dispatch_once_t once= 0;
    dispatch_once (&once,^{
        instance = [[TYSDKUser alloc]init];
    });
    return instance;
}
@end

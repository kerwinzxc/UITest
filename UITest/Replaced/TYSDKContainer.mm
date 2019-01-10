//
//  SDKContainer.m
//  UITest
//
//  Created by tianyou_ios on 2019/1/8.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import "SDKContainer.h"

@implementation SDKContainer
+(instancetype)sharedInstance{
    static SDKContainer* instance=nil;
    static dispatch_once_t once= 0;
    dispatch_once (&once,^{
        instance = [[SDKContainer alloc]init];
    });
    return instance;
}
@end

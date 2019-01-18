//
//  TYLoginLogic.m
//  TYSDK
//
//  Created by tianyou_ios on 2019/1/12.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import "TYLoginLogic.h"


@implementation TYLoginLogic

+(TYLoginLogic *)sharedInstance{
    static dispatch_once_t once= 0;
    static TYLoginLogic * handler=nil;
    dispatch_once(&once,^{
        handler = [[TYLoginLogic alloc]init];
    });
    return handler;
}

+(void)loginCallBackWithAccount:(NSDictionary *)account{
    NSString * userName = [NSString stringWithFormat:@"%@",account[@"account"]];
    NSString * uid = [NSString stringWithFormat:@"%@",[account.allKeys containsObject:@"uid"]?account[@"uid"]:account[@"id"]];
    NSString * mobile = [NSString stringWithFormat:@"%@",[account[@"mobile"] isEqual:[NSNull null]]?@"":account[@"mobile"]];
    NSString * sessionId = [NSString stringWithFormat:@"%@",account[@"sessionId"]];
}
@end

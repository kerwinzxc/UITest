//
//  TYSDKApi.m
//  TYSDK
//
//  Created by tianyou_ios on 2019/1/14.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import "TYSDKApi.h"


@implementation TYSDKApi

+(void)enterApp{
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    [params setValue:@"enterApp" forKey:@"method"];
    [self postURL:@"api.php" parameters:params methodName:@"启动统计" showHUD:NO completionHandler:^(NSDictionary *response) {
    }];
}
+(void)postURL:(NSString *)url parameters:(NSMutableDictionary *)parameters methodName:(NSString *)methodName showHUD:(BOOL)show completionHandler:(completionHandler)handler{
    
}
@end

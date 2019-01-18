//
//  TYSDKLoginReq.m
//  UITest
//
//  Created by tianyou_ios on 2019/1/8.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import "TYSDKLoginReq.h"
#import "TYSDKDataModel.h"

#define targetURL @"http://45.249.246.198:30009/"
@implementation TYSDKLoginReq


-(void)uploadBodyTransform{
    NSDictionary *params=[[NSDictionary alloc]init];
//    [params setValue:[TYSDKDataModel sharedInstance].accountModel.appId forKey:@"AppID" ];
//    [params setValue:[TYSDKDataModel sharedInstance].accountModel.accountId forKey:@"AccountId" ];
//    [params setValue:[TYSDKDataModel sharedInstance].accountModel.roleId forKey:@"RoleId" ];
//    [params setValue:[TYSDKDataModel sharedInstance].accountModel.roleName forKey:@"RoleName" ];
    
    
   
}
+(NSString *)dictionaryToJson:(NSDictionary *)dic {
    NSError *parseError= nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}















//-(void)gameToServerRequest:(id)username password:(id)passWord{
//    // 1.创建一个网络路径
//    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:targetURL]];
//    // 2.创建一个网络请求，分别设置请求方法、请求参数
//    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:url];
//    request.HTTPMethod = @"POST";
////    NSString *args = [NSString stringWithFormat:@"yourname=%@&yourpass=%@&btn=login",_yourname,_yourpass];
////    request.HTTPBody = [args dataUsingEncoding:NSUTF8StringEncoding];
//    // 3.获得会话对象
//    NSURLSession *session = [NSURLSession sharedSession];
//
//    // 4.根据会话对象，创建一个Task任务
//    NSURLSessionDataTask *sessionDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSLog(@"从服务器获取到数据");
//        /*
//         对从服务器获取到的数据data进行相应的处理.
//         */
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableLeaves) error:nil];
//    }];
//
//    //5.最后一步，执行任务，(resume也是继续执行)。
//    [sessionDataTask resume];
//
//}


@end

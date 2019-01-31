//
//  TYSDKNetW.m
//  TYSDK
//
//  Created by tianyou_ios on 2019/1/15.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//



#import "TYSDKNetW.h"
#import "TYSDKDataDeal.h"

@implementation TYSDKNetW
@synthesize delegate;
-(NSURLSession*)session{
    if (!_session) {
        NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:configuration
                                                 delegate:self
                                            delegateQueue:[NSOperationQueue mainQueue]];
    }
    return _session;
}
+(instancetype)shareInstance{
    static TYSDKNetW* instance=nil;
    static dispatch_once_t once= 0;
    dispatch_once (&once,^{
        instance = [[TYSDKNetW alloc]init];
    });
    return instance;
}
-(NSString*)urlPost{
    
    NSString *head=@"http://";
//    NSArray *ipArray=[[NSArray alloc] initWithObjects:optionalIP1,optionalIP2,nil];
//    for(int i=0;i<2;i++){
//        int arcNum = arc4random()%ipArray.count;
//        NSString * arcStr = [ipArray objectAtIndex:arcNum];
//    }
//    head =[head stringByAppendingString:arcStr];
//    NSArray *portArray=[[NSArray alloc] initWithObjects:optionalIPort1,optionalIPort2,nil];
//    for(int i=0;i<2;i++){
//        int arcNum = arc4random()%portArray.count;
//        NSString * arcStr = [portArray objectAtIndex:arcNum];
//        head =[head stringByAppendingString:arcStr];
//        head =[head stringByAppendingPathComponent:@":"];
//    }
    NSArray *urlArray=[[NSArray alloc] initWithObjects:@"45.249.246.198:30001",
                       @"23.91.97.186:30001",
                       @"45.249.246.198:30002",
                       @"23.91.97.186:30002",nil];
    int arcNum = arc4random()%urlArray.count;
    NSString * arcStr = [urlArray objectAtIndex:arcNum];
    head =[head stringByAppendingString:arcStr];
    return head;
}
//-(void)finishTheNet:(updataTheUI)block{
//    _updataUI=block;
//}
-(void)createSession:(updataTheUI)block{
    NSString *tr=[NSString stringWithFormat:@"%@",[TYSDKDataDeal shareInstance].dicPinJie];
    _updataUI=block;
    [self jsonTest:tr];
    
}
-(void)jsonTest:(NSString *)dataPost {
    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession * session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    NSURL* url =[NSURL URLWithString:[NSString stringWithFormat:@"%@",[self urlPost]]];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
//    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setCachePolicy:NSURLRequestReloadIgnoringCacheData];
    [request setTimeoutInterval:20];
//     NSData *data= [NSJSONSerialization dataWithJSONObject:dataPost options:NSJSONWritingPrettyPrinted error:&error
    NSData *data=[dataPost dataUsingEncoding:NSUTF8StringEncoding ];
    NSURLSessionUploadTask * uploadtask = [session uploadTaskWithRequest:request fromData:data completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
//            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            NSString *baseStr=[self dataToString:data];
            NSString *jsonStr=[self decodedDate:baseStr];
            if(self.updataUI)
            {
                self.updataUI([self dictionaryWithJsonString:jsonStr]);
            }
        }
    }];
    [uploadtask resume];
}
-(NSString*)decodedDate:(NSString*)info
{
    NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:info options:0];
    NSString *decodedString = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
    return decodedString;
}
-(NSString *)dataToString:(NSData *)infod
{
    NSString *str  = [[NSString alloc] initWithBytes:infod.bytes length:infod.length encoding:NSUTF8StringEncoding];
    return str;
}

- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

@end

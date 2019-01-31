//
//  TYSDKDataDeal.m
//  TYSDK
//
//  Created by tianyou_ios on 2019/1/15.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import "TYSDKDataDeal.h"
#import<CommonCrypto/CommonDigest.h>
#define ESkyFunKey @"SDK-API-iOS-NTgzNjViOGZjMTg3M7unbLa9HkEL94jFR9uwU0tDcQLyexxK8J5iobfV97vGdkEMxTjEI6T0cmu6yogVAw"

@implementation TYSDKDataDeal

+(instancetype)shareInstance{
    static TYSDKDataDeal* instance=nil;
    static dispatch_once_t once= 0;
    dispatch_once (&once,^{
        instance = [[TYSDKDataDeal alloc]init];
    });
    return instance;
}
-(NSMutableString *)headPostKey{
    _headPostKey=[NSMutableString string];
     for (int i = 0; i < 32; i++) {
         int number = arc4random() % 36;
         if (number < 10) {
             int figure = arc4random() % 10;
             NSString *tempString = [NSString stringWithFormat:@"%d", figure];
             _headPostKey = [_headPostKey stringByAppendingString:tempString];
         }else {
             int figure = (arc4random() % 26) + 97;
             char character = figure;
             NSString *tempString = [NSString stringWithFormat:@"%c", character];
             _headPostKey = [_headPostKey stringByAppendingString:tempString];
         }
     }
    return _headPostKey;
}
-(NSString*)dicPinJie{
    //获取模型转化为字典1
    _dateBeforePost= [NSMutableDictionary dictionary];
    TYSDKDataModel *model =[TYSDKDataModel sharedInstance];
    _dateBeforePost=[self convert:model.mj_keyValues];
    NSLog(@"ModelConvertToDic:\n%@",_dateBeforePost);
    //将字典1升序排列成字符串，按照key值排列顺序
   NSString *str=[self convertToStringData:_dateBeforePost];
    NSString *eskyfunKey=[NSString stringWithFormat:ESkyFunKey];
    str=[str stringByAppendingString:eskyfunKey];
    
    //将升序的字符串md5加密为新的值Signature
    NSString *doo=[self md5:str];
    
    
    //将加密之后的值加回签名signature对应的value值,成为新的字典2
    NSMutableDictionary *postBodyBeforeCode=[NSMutableDictionary dictionary];
    postBodyBeforeCode=[self convert:model.mj_keyValues];
    [postBodyBeforeCode setObject:doo forKey:@"signature"];
    
    //将字典2json化，成为json1
    NSError *parseError= nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:postBodyBeforeCode options:NSJSONWritingPrettyPrinted error:&parseError];
    NSString*jsonBodyBeforePost=[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
   
    //json1经过base64加密
    NSData *data= [jsonBodyBeforePost dataUsingEncoding:NSUTF8StringEncoding];
    NSString *jsonBase64=[NSString string];
    jsonBase64=[data base64EncodedStringWithOptions:0];
   
    //base64的json添加进一个新的字典 ，key值可任意位数,成为字典3
    NSMutableDictionary *postToServer=[NSMutableDictionary dictionary];
    [postToServer setObject:jsonBase64 forKey:[self headPostKey]];
    NSString *strWillCommit=[self convertToString:postToServer];
   
    return strWillCommit;
}

-(NSMutableDictionary*)convert:(NSDictionary*)infoDict{
    NSMutableDictionary*d=[NSMutableDictionary dictionary];
    for (NSString* key in [infoDict allKeys]) {
        [d setValuesForKeysWithDictionary:[infoDict objectForKey:key]];
    }
    return d;
}

- (NSString*)convertToStringData:(id)infoDict
{
    NSString* jsonString=@"";
    NSArray *keyArray=[infoDict allKeys];
    NSArray *sortKeyArray = [keyArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];
    for (NSString* key in sortKeyArray) {
        NSString* keyValue=[NSString stringWithFormat:@"%@=%@",key,[infoDict objectForKey:key]];
        jsonString=[NSString stringWithFormat:@"%@&%@",jsonString,keyValue];
//        [jsonString deleteCharactersInRange:NSMakeRange(0,1)];
//        jsonString =[keyValue stringByAppendingPathComponent:@"&"];
        
    }
    jsonString=[jsonString substringFromIndex:1];

    return jsonString;
}

- (NSString*)convertToString:(id)infoDict
{
    NSString* jsonString=@"";
    NSArray *keys=[infoDict allKeys];
    for (NSString* key in keys){
    jsonString=[NSString stringWithFormat:@"%@=%@",key,[infoDict objectForKey:key]];
    }
    return jsonString;
}

-(NSString *)md5:(NSString *)input {
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), digest); // This is the md5 call
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
    [output appendFormat:@"%02x", digest[i]];
    return output;
}

@end

//
//  TYSDKDevice.m
//  TYSDK
//
//  Created by tianyou_ios on 2019/1/11.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import "TYSDKDevice.h"
#import <UIKit/UIKit.h>
// 获取广告的框架头文件
#import <AdSupport/AdSupport.h>
#import <sys/utsname.h>
// 输出的字符串需要加密
#import "NSString+URLEncode.h"
// 下面是获取mac地址需要导入的头文件
#include <sys/socket.h> // Per msqr
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>


#import <sys/sockio.h>
#import <sys/ioctl.h>
#import <arpa/inet.h>


@implementation TYSDKDevice

-(NSString *)model{
    if (!_model) {
        _model = [UIDevice currentDevice].model;
    }
    return [_model URLEncodedString];
}
-(NSString *)customerId{
    if (!_customerId) {
        NSString *stringBundid=[self package];
        NSString *stringImei=[self imei];
        NSString *str=[stringBundid stringByAppendingString:stringImei];
        return [TY_Encryption md5EncryptWithString:str];
    }
    return [_customerId URLEncodedString];
}
-(NSString *)imei{
    if(!_imei)
    {
        _imei = [UIDevice currentDevice].identifierForVendor.UUIDString;
    }
    return [_imei URLEncodedString];
}
-(NSString *)sysVersionCode{
    if (!_sysVersionCode) {
        _sysVersionCode = [UIDevice currentDevice].systemVersion;
    }
    return [_sysVersionCode URLEncodedString];
}
-(NSString *)sysVersionName{
    if (!_sysVersionName) {
        _sysVersionName = [UIDevice currentDevice].systemVersion;
    }
    return [_sysVersionName URLEncodedString];
}
-(NSString *)idfa{
    if (!_idfa) {
        _idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    }
    return [_idfa URLEncodedString];
}
-(NSString *)countryCode{
    if (!_countryCode) {
        NSLocale *currentLocale = [NSLocale currentLocale];
        _countryCode = [currentLocale objectForKey:NSLocaleCountryCode];
    }
    return [_countryCode URLEncodedString];
}

-(NSString *)mac{
    int mib[6];
    size_t len;
    char *buf;
    unsigned char *ptr;
    struct if_msghdr *ifm;
    struct sockaddr_dl *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1/n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    
    NSString *outstring = [NSString stringWithFormat:@"%02x:%02x:%02x:%02x:%02x:%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    
    return [[outstring uppercaseString]URLEncodedString];
}
-(NSString *)deviceIdentifier{
    if (!_deviceIdentifier) {
        struct utsname systemInfo;
        uname(&systemInfo);
        _deviceIdentifier = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    }
    return [_deviceIdentifier URLEncodedString];

}
-(NSString *)deviceType{
    struct utsname systemInfo;
    uname(&systemInfo);
    _deviceType = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    //iPhone 系列
    if ([_deviceType isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([_deviceType isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([_deviceType isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([_deviceType isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([_deviceType isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    if ([_deviceType isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([_deviceType isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([_deviceType isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([_deviceType isEqualToString:@"iPhone5,3"])    return @"iPhone 5C";
    if ([_deviceType isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
    if ([_deviceType isEqualToString:@"iPhone6,1"])    return @"iPhone 5S";
    if ([_deviceType isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
    if ([_deviceType isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([_deviceType isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([_deviceType isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([_deviceType isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([_deviceType isEqualToString:@"iPhone9,1"])    return @"iPhone 7 (CDMA)";
    if ([_deviceType isEqualToString:@"iPhone9,3"])    return @"iPhone 7 (GSM)";
    if ([_deviceType isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus (CDMA)";
    if ([_deviceType isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus (GSM)";
    
    //iPod 系列
    if ([_deviceType isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([_deviceType isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([_deviceType isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([_deviceType isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([_deviceType isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    
    //iPad 系列
    if ([_deviceType isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([_deviceType isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([_deviceType isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([_deviceType isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([_deviceType isEqualToString:@"iPad2,4"])      return @"iPad 2 (32nm)";
    if ([_deviceType isEqualToString:@"iPad2,5"])      return @"iPad mini (WiFi)";
    if ([_deviceType isEqualToString:@"iPad2,6"])      return @"iPad mini (GSM)";
    if ([_deviceType isEqualToString:@"iPad2,7"])      return @"iPad mini (CDMA)";
    
    if ([_deviceType isEqualToString:@"iPad3,1"])      return @"iPad 3(WiFi)";
    if ([_deviceType isEqualToString:@"iPad3,2"])      return @"iPad 3(CDMA)";
    if ([_deviceType isEqualToString:@"iPad3,3"])      return @"iPad 3(4G)";
    if ([_deviceType isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([_deviceType isEqualToString:@"iPad3,5"])      return @"iPad 4 (4G)";
    if ([_deviceType isEqualToString:@"iPad3,6"])      return @"iPad 4 (CDMA)";
    
    if ([_deviceType isEqualToString:@"iPad4,1"])      return @"iPad Air";
    if ([_deviceType isEqualToString:@"iPad4,2"])      return @"iPad Air";
    if ([_deviceType isEqualToString:@"iPad4,3"])      return @"iPad Air";
    if ([_deviceType isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([_deviceType isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    if ([_deviceType isEqualToString:@"i386"])         return @"Simulator";
    if ([_deviceType isEqualToString:@"x86_64"])       return @"Simulator";
    
    if ([_deviceType isEqualToString:@"iPad4,4"]
        ||[_deviceType isEqualToString:@"iPad4,5"]
        ||[_deviceType isEqualToString:@"iPad4,6"])      return @"iPad mini 2";
    
    if ([_deviceType isEqualToString:@"iPad4,7"]
        ||[_deviceType isEqualToString:@"iPad4,8"]
        ||[_deviceType isEqualToString:@"iPad4,9"])      return @"iPad mini 3";
    
    return [_deviceType URLEncodedString];
}

-(NSString *)appVersionCode{
    if (!_appVersionCode) {
        _appVersionCode = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    }
    return [_appVersionCode URLEncodedString];
}
-(NSString *)appVersionName{
    if (!_appVersionName) {
        _appVersionName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    }
    return [_appVersionName URLEncodedString];
}
-(NSString *)package{
    if (!_package) {
        _package = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    }
    return [_package URLEncodedString];
}
-(NSString *)language{
    if (!_language) {
        _language= [[NSLocale currentLocale] localeIdentifier];
    }
    return [_language URLEncodedString];
}
-(NSString *)platform{
    if (!_platform) {
        _platform= [UIDevice currentDevice].systemName;
    }
    return [_platform URLEncodedString];
    
}
-(NSString *)netType{
    Reachability *reachability   = [Reachability reachabilityWithHostName:@"www.apple.com"];
    
    NetworkStatus internetStatus = [reachability currentReachabilityStatus];
    
    NSString *net = @"WIFI";
    
    switch (internetStatus) {
            
        case ReachableViaWiFi:
            
            net = @"WIFI";
            
            break;
        case ReachableViaWWAN:
            
            net = @"蜂窝数据";
            
            //net = [self getNetType ];   //判断具体类型
            
            break;
        case NotReachable:
            
            net = @"当前无网路连接";
            
        default:
            
            break;
            
    }
    return [net URLEncodedString];
    
}

-(NSString *)screenSize{
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
    CGFloat scale = [[UIScreen mainScreen] scale];
    width = [[self getDeviceXMaxValue] floatValue];
    height = [[self getDeviceYMaxValue] floatValue];
    NSString *stringWidth=[NSString stringWithFormat:@"%@",[NSNumber numberWithFloat:(width * scale*0.5)]];
    NSString *stringHeight=[NSString stringWithFormat:@"%@",[NSNumber numberWithFloat:(height * scale*0.5)]];
    NSString *str=[NSString stringWithFormat:@"%@*%@",stringWidth,stringHeight];
    return [str URLEncodedString];
}
-(NSNumber *)getDeviceXMaxValue
{
    CGFloat xoffset = CGRectZero.origin.x;
    xoffset = CGRectGetWidth([[UIScreen mainScreen] bounds]);
    return [NSNumber numberWithFloat:xoffset];
}
-(NSNumber *)getDeviceYMaxValue
{
    CGFloat yoffset = CGRectZero.origin.x;
    yoffset = CGRectGetHeight([[UIScreen mainScreen] bounds]);
    return [NSNumber numberWithFloat:yoffset];
}
-(NSString *)time
{
    if (!_time) {
        NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
        NSTimeInterval time=[date timeIntervalSince1970]*1000;// *1000 是精确到毫秒，不乘就是精确到秒
        _time=[NSString stringWithFormat:@"%.0f", time];
        return _time;
    }
    return [_time URLEncodedString];
}

@end

//
//  TYSDKAccount.m
//  TYSDK
//
//  Created by tianyou_ios on 2019/1/14.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import "TYSDKAccount.h"
#import "TYSDKUser.h"
#import "NSString+URLEncode.h"


@implementation TYSDKAccount

-(NSString *)appId{
    return [_appId URLEncodedString];
}

-(NSString *)serverId{
    return [_serverId URLEncodedString];
}

-(NSString *)serverName{
    return [_serverName URLEncodedString];
}
-(NSString *)roleId{
    return [_roleId URLEncodedString];
}
-(NSString *)roleName{
    return [_roleName URLEncodedString];
}

-(NSString *)accountId{
    return [_accountId URLEncodedString];
}

@end


//
//  TYSDKUser.m
//  UITest
//
//  Created by tianyou_ios on 2019/1/8.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import "TYSDKUser.h"
#import "NSString+URLEncode.h"

@implementation TYSDKUser
-(NSString *)email{
    if (!_email) {
        return _email;
    }
    return [_email URLEncodedString];
}
-(NSString *)ty_user_lingPai{
    if (!_ty_user_lingPai) {
        return _ty_user_lingPai;
    }
    return [_ty_user_lingPai URLEncodedString];
}
-(NSString *)password{
    if (!_password) {
        return _password;
    }
    return [_password URLEncodedString];
}
-(NSString *)event{
    if (!_event) {
        return _event;
    }
    return [_event URLEncodedString];
}
-(NSString *)token{
    if (!_token) {
        return _token;
    }
    return [_token URLEncodedString];
}
@end

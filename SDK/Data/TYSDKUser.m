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
-(NSString *)ty_user_email{
    if (!_ty_user_email) {
        return _ty_user_email;
    }
    return [_ty_user_email URLEncodedString];
}
-(NSString *)ty_user_lingPai{
    if (!_ty_user_lingPai) {
        return _ty_user_lingPai;
    }
    return [_ty_user_lingPai URLEncodedString];
}
-(NSString *)ty_password{
    if (!_ty_password) {
        return _ty_password;
    }
    return [_ty_password URLEncodedString];
}
-(NSString *)ty_token{
    if (!_ty_token) {
        return _ty_token;
    }
    return [_ty_token URLEncodedString];
}
@end

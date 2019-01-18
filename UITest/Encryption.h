//
//  Encryption.h
//  UITest
//
//  Created by tianyou_ios on 2019/1/14.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
NS_ASSUME_NONNULL_BEGIN

@interface Encryption : NSObject
+ (NSString *)md5EncryptWithString:(NSString *)string;
@end

NS_ASSUME_NONNULL_END

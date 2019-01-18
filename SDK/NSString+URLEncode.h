//
//  NSString+URLEncode.h
//  TYSDK
//
//  Created by tianyou_ios on 2019/1/18.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (URLEncode)
/**
 *  URLEncode
 */
- (NSString *)URLEncodedString;

/**
 *  URLDecode
 */
-(NSString *)URLDecodedString;

@end

NS_ASSUME_NONNULL_END

//
//  TYSDKNetW.h
//  TYSDK
//
//  Created by tianyou_ios on 2019/1/15.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface TYSDKNetW : NSObject<NSURLSessionDelegate,NSURLSessionTaskDelegate>
@property (strong,nonatomic)NSURLSession * session;
@property (strong,nonatomic)NSURLSessionDataTask * dataTask;
@property (strong,nonatomic)NSURLSessionTask * task;
@property (nonatomic) BOOL isjsonTest;
+(instancetype)shareInstance;
-(void)createSession;
@end

NS_ASSUME_NONNULL_END

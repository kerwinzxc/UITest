//
//  TYSDKNetW.h
//  TYSDK
//
//  Created by tianyou_ios on 2019/1/15.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void(^updataTheUI)(NSDictionary *jsonDic);
NS_ASSUME_NONNULL_BEGIN

@protocol myViewDelegate <NSObject>

-(void)CallBackFun;

@end

@interface TYSDKNetW : NSObject<NSURLSessionDelegate,NSURLSessionTaskDelegate>{
    id<myViewDelegate> delegate;
}



@property(nonatomic,retain) id<myViewDelegate> delegate;

@property (strong,nonatomic)NSURLSession * session;
@property (strong,nonatomic)NSURLSessionDataTask * dataTask;
@property (strong,nonatomic)NSURLSessionTask * task;
@property (strong,nonatomic)updataTheUI updataUI;
@property (nonatomic) BOOL isjsonTest;
+(instancetype)shareInstance;
-(void)createSession:(updataTheUI)block;
//-(void)finishTheNet:(updataTheUI)block;
-(void)jsonTest:(NSString *)dataPost;



@end




NS_ASSUME_NONNULL_END

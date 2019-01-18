//
//  TYSDKContainer.mm
//  UITest
//
//  Created by tianyou_ios on 2019/1/8.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import "TYSDKContainer.h"

@interface TYSDKContainer()
@property (nonatomic) id<TYSDKContainerDelegate>delegate;
@end

@implementation TYSDKContainer
+(instancetype)sharedInstance{
    static TYSDKContainer* instance=nil;
    static dispatch_once_t once= 0;
    dispatch_once (&once,^{
        instance = [[TYSDKContainer alloc]init];
    });
    return instance;
}

-(void)doInitThirdSDK:(id<TYSDKContainerDelegate>)delegate gameVersion:(NSString*)gameVersion{
    self.delegate=delegate;
    NSLog(@"doInitThirdSDK");
}

-(void)loginSDK{
    NSLog(@"loginSDK");
}
-(void)logoutSDK{
     NSLog(@"logoutSDK");
}
-(void)switchUser{
    [self logoutSDK];
    [self loginSDK];
     NSLog(@"switchUser");
}
-(void)paySDK{
     NSLog(@"paySDK");
}
-(void)showTheUserCenter{
     NSLog(@"showTheUserCenter");
}
@end

//
//  loginSuccessViewController.h
//  TYSDK
//
//  Created by tianyou_ios on 2019/1/22.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^loginSucceessHandler) (UIView*displayVc);

@interface loginSuccessViewController : UIViewController

@property(nonatomic, copy) loginSucceessHandler ty_loginHandle;

-(void)loadSuccessView:(loginSucceessHandler)loginSuccessHandler;
@end

NS_ASSUME_NONNULL_END

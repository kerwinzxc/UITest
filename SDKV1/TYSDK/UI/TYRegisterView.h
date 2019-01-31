//
//  TYRegisterView.h
//  UITest
//
//  Created by tianyou_ios on 2019/1/7.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TYRegisterView : UIViewController
-(BOOL )isValidateEmail:(NSString*)email;
-(BOOL )isValidatePassword:(NSString*)password;
-(void)showMessage:(NSString *)message;
@end

NS_ASSUME_NONNULL_END

//
//  TYLoginView.h
//  UITest
//
//  Created by tianyou_ios on 2019/1/7.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^LoginHandler) (NSString *accountText);
NS_ASSUME_NONNULL_BEGIN

@interface TYLoginView : UIViewController

@property (nonatomic,copy)LoginHandler loginHandler;

@end

NS_ASSUME_NONNULL_END

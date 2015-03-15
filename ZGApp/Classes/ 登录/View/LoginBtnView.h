//
//  LoginBtnView.h
//  ZGApp
//
//  Created by Jevons on 15/2/7.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LoginBtnView;
@protocol LoginBtnViewDelegate<NSObject>
@optional

-(void)LogBtnView:(LoginBtnView*)View;
-(void)RegBtnView:(LoginBtnView*)View;
@end
@interface LoginBtnView : UIView
@property(nonatomic,weak)id<LoginBtnViewDelegate> delegate;

@end

//
//  ZGLoginView.h
//  ZGApp
//
//  Created by Jevons on 15/2/7.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZGLoginTextField.h"
@class ZGLoginView;
@protocol ZGLoginViewDelegate<NSObject>
@optional
-(void)loginBack:(ZGLoginView*)ZGLoginView;

@end
@interface ZGLoginView : UIView

@property(nonatomic,weak)id<ZGLoginViewDelegate> delegate;
@property(nonatomic,weak)ZGLoginTextField* emailText;
@property(nonatomic,weak)ZGLoginTextField* pswText;

@property(nonatomic,weak)UIImageView* iconView;

@property(nonatomic,assign)CGFloat textHeight;
@property(nonatomic,weak)UIImageView* backBG;

@property(nonatomic,weak)UIButton* ForgotPwdBtn;
@end

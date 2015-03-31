//
//  ZGRegView.h
//  ZGApp
//
//  Created by Jevons on 15/2/15.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZGLoginTextField.h"
#import "ZGBaceInfoTextField.h"
#import "ZGSexBtn.h"
@class ZGRegView;
@protocol ZGRegViewDelegate<NSObject>
@optional
-(void)RegBack:(ZGRegView*)ZGRegView btn:(UIButton*)btn;
-(void)RegViewWithCameraBtn:(ZGRegView*)RegView btn:(NSInteger)btnNum;
@end
@interface ZGRegView : UIView

@property(nonatomic,weak)id<ZGRegViewDelegate> delegate;

@property(nonatomic,weak)ZGLoginTextField* emailText;
@property(nonatomic,weak)ZGLoginTextField* pswText;
@property(nonatomic,weak)ZGLoginTextField* comfirmPsw;
@property(nonatomic,weak)UIImageView* iconView;

@property(nonatomic,assign)CGFloat textHeight;
@property(nonatomic,weak)UIImageView* backBG;

//@property(nonatomic,weak)UIButton* ForgotPwdBtn;

@property(nonatomic,weak)UIButton* backBtn;

@property(nonatomic,weak)UIScrollView* scrollText;

@property(nonatomic,weak)UIView*  AccountView;
@property(nonatomic,weak)UIView* BaseInfoView;

@property(nonatomic,weak)ZGBaceInfoTextField* nickName;
@property(nonatomic,weak)ZGBaceInfoTextField* profileText;
@property(nonatomic,weak)ZGSexBtn* maleBtn;
@property(nonatomic,weak)ZGSexBtn* femaleBtn;


@end

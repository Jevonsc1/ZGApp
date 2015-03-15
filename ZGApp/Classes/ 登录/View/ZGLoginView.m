//
//  ZGLoginView.m
//  ZGApp
//
//  Created by Jevons on 15/2/7.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGLoginView.h"
#import "UIImage+TB.h"

@interface ZGLoginView()
@property(nonatomic,weak)UIButton* backBtn;





@end
@implementation ZGLoginView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        UIButton* backBtn=[[UIButton alloc]init];
        [backBtn setImage:[UIImage imageNamed:@"page_log_back"] forState:UIControlStateNormal];
        [backBtn setTitle:@"返回" forState:UIControlStateNormal];
        backBtn.font=[UIFont systemFontOfSize:13];
        [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:backBtn];
        self.backBtn=backBtn;
        
        UIButton* ForgotPwdBtn=[[UIButton alloc]init];
        [ForgotPwdBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
        ForgotPwdBtn.font=[UIFont systemFontOfSize:13];
        [ForgotPwdBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self addSubview: ForgotPwdBtn];
        self.ForgotPwdBtn=ForgotPwdBtn;
       
        
        UIImageView* backBG=[[UIImageView alloc]init];
        backBG.image=[UIImage resizedImageWithName:@"page_log_background"];
        
        [self addSubview:backBG];
        self.backBG=backBG;
        
        
        
        
        ZGLoginTextField* emailText=[ZGLoginTextField initWithLeftImage:[UIImage imageNamed:@"page_log_email"] title:@"邮箱"];
        emailText.keyboardType= UIKeyboardTypeEmailAddress;
        emailText.background=[UIImage resizedImageWithName:@"page_log_register"];
        [self addSubview:emailText];
        self.emailText=emailText;
        
        
        
        
        ZGLoginTextField* pswText=[ZGLoginTextField initWithLeftImage:[UIImage imageNamed:@"page_log_password"] title:@"密码"];
        pswText.secureTextEntry=YES;
        pswText.background=[UIImage resizedImageWithName:@"page_log_register"];
        [self addSubview:pswText];
        self.pswText=pswText;
        
        
        
        
        
        UIImageView* iconView=[[UIImageView alloc]init];
        iconView.image=[UIImage imageNamed:@"page_log_portrait"];
        [self addSubview:iconView];
        self.iconView=iconView;
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat iconW=110;
    CGFloat iconH=iconW;
    CGFloat iconX=(ScreenviewWidth-iconW)*0.5-20;
    CGFloat iconY=0;
    self.iconView.frame=CGRectMake(iconX, iconY, iconW, iconH);
    
    CGFloat backBtnX=5;
    CGFloat backBtnW=40;
    CGFloat backBtnH=10;
    CGFloat backBtnY=CGRectGetMidY(self.iconView.frame)-backBtnH-5;
    self.backBtn.frame=CGRectMake(backBtnX, backBtnY, backBtnW, backBtnH);
    
    NSString *forgetStr=@"忘记密码";
    CGSize ForgetBtnSize=[forgetStr sizeWithFont:[UIFont systemFontOfSize:13]];
    CGFloat ForgetBtnX=self.frame.size.width-ForgetBtnSize.width-5;
    CGFloat ForgetBtnY=backBtnY-2;
    self.ForgotPwdBtn.frame=(CGRect){{ForgetBtnX, ForgetBtnY}, ForgetBtnSize};
    
    CGFloat backBgX=0;
    CGFloat backBgY=iconH*0.5;
    CGFloat backBgH=self.frame.size.height-backBgY;
    CGFloat backBgW=self.frame.size.width;
    self.backBG.frame=CGRectMake(backBgX, backBgY, backBgW, backBgH);
    
    CGFloat emailTextX=15;
    CGFloat emailTextY=self.frame.size.height*0.5+10;
    CGFloat emailTextW=self.frame.size.width-2*emailTextX;
    CGFloat emailTextH=(self.textHeight-15)*0.5;

    self.emailText.frame=CGRectMake(emailTextX, emailTextY, emailTextW, emailTextH);
    
   
    
    CGFloat pswTextX=emailTextX;
    CGFloat pswTextY=CGRectGetMaxY(self.emailText.frame)+15;
    CGFloat pswTextW=emailTextW;
    CGFloat pswTextH=emailTextH;
    self.pswText.frame=CGRectMake(pswTextX, pswTextY, pswTextW, pswTextH);
    
    
    
    
}
-(void)backBtnClick:(UIButton*)btn
{
    if ([self.delegate respondsToSelector:@selector(loginBack:)]) {
        [self.delegate loginBack:self];
    }
}









@end

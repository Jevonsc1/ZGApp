//
//  ZGRegView.m
//  ZGApp
//
//  Created by Jevons on 15/2/15.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGRegView.h"
#import "UIImage+TB.h"

#define  textGap 15
@interface ZGRegView()<UIActionSheetDelegate>
@property(nonatomic,weak)UIButton* curSexBtn;
@property(nonatomic,weak)UIButton* cameraView;
@end
@implementation ZGRegView
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
        
        
        UIImageView* backBG=[[UIImageView alloc]init];
        backBG.image=[UIImage resizedImageWithName:@"page_log_background"];
        backBG.userInteractionEnabled=YES;
        [self addSubview:backBG];
        self.backBG=backBG;
        

        
        
        UIView* AccountView=[[UIView alloc]init];
        [self.backBG addSubview:AccountView];
        AccountView.userInteractionEnabled=YES;
       
        self.AccountView=AccountView;
        
        
        
        ZGLoginTextField* emailText=[ZGLoginTextField initWithLeftImage:[UIImage imageNamed:@"page_log_email"] title:@"邮箱"];
        emailText.keyboardType= UIKeyboardTypeEmailAddress;
        emailText.background=[UIImage resizedImageWithName:@"page_log_register"];
        [self.AccountView addSubview:emailText];
        self.emailText=emailText;
        
        
        ZGLoginTextField* pswText=[ZGLoginTextField initWithLeftImage:[UIImage imageNamed:@"page_log_setpassword"] title:@"设置密码"];
        pswText.secureTextEntry=YES;
        pswText.background=[UIImage resizedImageWithName:@"page_log_register"];
        [self.AccountView addSubview:pswText];
        self.pswText=pswText;
        
        
        ZGLoginTextField* comfirmText=[ZGLoginTextField initWithLeftImage:[UIImage imageNamed:@"page_log_setpassword"] title:@"重复密码"];
        comfirmText.secureTextEntry=YES;
        comfirmText.background=[UIImage resizedImageWithName:@"page_log_register"];
        [self.AccountView addSubview:comfirmText];
        self.comfirmPsw=comfirmText;
        
        UIView* BaseInfoView=[[UIView alloc]init];
        [self.backBG addSubview:BaseInfoView];
        BaseInfoView.userInteractionEnabled=YES;
        BaseInfoView.layer.opacity=0;
        self.BaseInfoView=BaseInfoView;

        ZGBaceInfoTextField* nickNameText=[ZGBaceInfoTextField initWithLeftTitle:@"昵称                 " placeTitle:@""];
        nickNameText.background=[UIImage resizedImageWithName:@"page_log_register"];
        [self.BaseInfoView addSubview:nickNameText];
        self.nickName=nickNameText;
        
        ZGSexBtn* maleBtn=[[ZGSexBtn alloc]init];
        [maleBtn setTitle:@"男" forState:UIControlStateNormal];
        [maleBtn setBackgroundImage:[UIImage resizedImageWithName:@"page_log_register"] forState:UIControlStateNormal];
        [maleBtn setBackgroundImage:[UIImage resizedImageWithName:@"page_log_sex"] forState:UIControlStateSelected];
         [maleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [maleBtn addTarget:self action:@selector(sexBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.BaseInfoView addSubview:maleBtn];
        self.maleBtn=maleBtn;
        
        ZGSexBtn* femaleBtn=[[ZGSexBtn alloc]init];
        [femaleBtn setTitle:@"女" forState:UIControlStateNormal];
        [femaleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [femaleBtn setBackgroundImage:[UIImage resizedImageWithName:@"page_log_register"] forState:UIControlStateNormal];
        [femaleBtn setBackgroundImage:[UIImage resizedImageWithName:@"page_log_sex"] forState:UIControlStateSelected];
         [femaleBtn addTarget:self action:@selector(sexBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.BaseInfoView addSubview:femaleBtn];
        self.femaleBtn=femaleBtn;
        
        ZGBaceInfoTextField* profileText=[ZGBaceInfoTextField initWithLeftTitle:@"简介                 " placeTitle:@"（可选）"];
        profileText.background=[UIImage resizedImageWithName:@"page_log_register"];
        [self.BaseInfoView addSubview:profileText];
        self.profileText=profileText;
        
        
        UIImageView* iconView=[[UIImageView alloc]init];
        iconView.image=[UIImage imageNamed:@"page_log_portrait"];
        [self addSubview:iconView];
        self.iconView=iconView;
        
        UIButton* cameraView=[[UIButton alloc]init];
        [cameraView setImage:[UIImage imageNamed:@"page_user_editportrait"] forState:UIControlStateNormal];
        [self addSubview:cameraView];
        self.cameraView=cameraView;
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
    self.iconView.backgroundColor=[UIColor clearColor];
    self.iconView.layer.masksToBounds=YES;
    self.iconView.userInteractionEnabled=YES;
    self.iconView.layer.cornerRadius=iconW*0.5;
    
    
    self.cameraView.frame=CGRectMake(0,0, 25, 25);
    self.cameraView.layer.position=CGPointMake(self.frame.size.width*0.5+iconW*0.5*0.7,iconH*0.3*0.5 );
    [self.cameraView addTarget:self action:@selector(cameraViewClick:) forControlEvents:UIControlEventTouchUpInside];
    
    CGFloat backBtnX=5;
    CGFloat backBtnW=40;
    CGFloat backBtnH=10;
    CGFloat backBtnY=CGRectGetMidY(self.iconView.frame)-backBtnH-5;
    self.backBtn.frame=CGRectMake(backBtnX, backBtnY, backBtnW, backBtnH);

    
    CGFloat backBgX=0;
    CGFloat backBgY=iconH*0.5;
    CGFloat backBgH=self.frame.size.height-backBgY;
    CGFloat backBgW=self.frame.size.width;
    self.backBG.frame=CGRectMake(backBgX, backBgY, backBgW, backBgH);
    
    
    CGFloat AccountX=15;
    CGFloat AccountY=self.frame.size.height*0.2+10;
    CGFloat AccountW=self.frame.size.width-2*AccountX;
    CGFloat AccountH=self.textHeight;
    self.AccountView.frame=CGRectMake(AccountX, AccountY, AccountW, AccountH);
    
    CGFloat emailTextX=0;
    CGFloat emailTextY=0;
    CGFloat emailTextW=AccountW;
    CGFloat emailTextH=(self.textHeight-textGap*2)/3.0;
    
    self.emailText.frame=CGRectMake(emailTextX, emailTextY, emailTextW, emailTextH);
    
    
    
    CGFloat pswTextX=emailTextX;
    CGFloat pswTextY=CGRectGetMaxY(self.emailText.frame)+textGap;
    CGFloat pswTextW=emailTextW;
    CGFloat pswTextH=emailTextH;
    self.pswText.frame=CGRectMake(pswTextX, pswTextY, pswTextW, pswTextH);
    
    
    CGFloat comfirmX=emailTextX;
    CGFloat comfirmY=CGRectGetMaxY(self.pswText.frame)+textGap;
    CGFloat comfirmW=emailTextW;
    CGFloat comfirmH=emailTextH;
    self.comfirmPsw.frame=CGRectMake(comfirmX, comfirmY, comfirmW, comfirmH);
    
    
    CGFloat BaseX=15+self.frame.size.width;
    CGFloat BaseY=AccountY;
    CGFloat BaseW=AccountW;
    CGFloat BaseH=AccountH;
    self.BaseInfoView.frame=CGRectMake(BaseX, BaseY, BaseW, BaseH);
    
    CGFloat nickX=0;
    CGFloat nickY=0;
    CGFloat nickW=AccountW;
    CGFloat nickH=emailTextH;
    self.nickName.frame=CGRectMake(nickX, nickY, nickW, nickH);
    
    
    CGFloat maleBtnX=nickX;
    CGFloat maleBtnY=CGRectGetMaxY(self.nickName.frame)+textGap;
    CGFloat maleBtnW=(emailTextW-textGap)*0.5;
    CGFloat maleBtnH=emailTextH;
    self.maleBtn.frame=CGRectMake(maleBtnX, maleBtnY, maleBtnW, maleBtnH);
    
    CGFloat femaleBtnX=CGRectGetMaxX(self.maleBtn.frame)+textGap;
    CGFloat femaleBtnY=maleBtnY;
    CGFloat femaleBtnW=maleBtnW;
    CGFloat femaleBtnH=maleBtnH;
    self.femaleBtn.frame=CGRectMake(femaleBtnX, femaleBtnY, femaleBtnW, femaleBtnH);
    
    CGFloat profileX=0;
    CGFloat profileY=CGRectGetMaxY(self.maleBtn.frame)+textGap;;
    CGFloat profileW=nickW;
    CGFloat profileH=nickH;
    self.profileText.frame=CGRectMake(profileX, profileY, profileW, profileH);
    
}
-(void)sexBtnClick:(UIButton*)btn
{
    [self.curSexBtn setSelected:NO];
    [btn setSelected:YES];
    self.curSexBtn=btn;
    
}
-(void)backBtnClick:(UIButton*)btn
{
    if ([self.delegate respondsToSelector:@selector(RegBack:btn:)]) {
        [self.delegate RegBack:self btn:btn];
    }
}
-(void)cameraViewClick:(UIButton*)btn
{
    UIActionSheet* cameraSheet=[[UIActionSheet alloc]initWithTitle:@"修改头像" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从手机相册选择",@"系统头像",nil];
    cameraSheet.actionSheetStyle=UIActionSheetStyleBlackTranslucent;
    [cameraSheet showInView:self];
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if ([self.delegate respondsToSelector:@selector(RegViewWithCameraBtn:btn:)]) {
        [self.delegate RegViewWithCameraBtn:self btn:buttonIndex];
        
        
    }
}

@end

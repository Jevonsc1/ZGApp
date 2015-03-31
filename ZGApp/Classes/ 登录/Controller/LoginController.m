//
//  LoginController.m
//  ZGApp
//
//  Created by Jevons on 15/2/7.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "LoginController.h"
#import "LoginTopView.h"
#import "LoginBtnView.h"
#import "ZGLoginView.h"
#import "UIImage+TB.h"
#import "TBTabBarController.h"
#import "AFNetworking.h"
#import "ZGRegView.h"
#import "ZGAccount.h"
#import "ZGAccountTool.h"
#import "ZGAccountRegParam.h"
#import "MBProgressHUD.h"
#import "ZGHttpTool.h"
#import "NSString+Password.h"
@interface LoginController ()<LoginBtnViewDelegate,ZGLoginViewDelegate,ZGRegViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(nonatomic,weak)UIImageView* backImg;
@property(nonatomic,weak)LoginTopView* topView;
@property(nonatomic,weak)LoginBtnView* BtnView;
@property(nonatomic,weak)ZGLoginView* loginView;
@property(nonatomic,weak)ZGRegView* regView;
@property(nonatomic,weak)UIButton* loginBtn;

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView* backImg=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"background_ip5"]];
    backImg.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:backImg];
    self.backImg=backImg;
    self.backImg.userInteractionEnabled=YES;
   
    [self setupTop];
    [self setupBottom];
    
    
    [UIApplication sharedApplication].statusBarHidden=YES;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [UIApplication sharedApplication].statusBarHidden=YES;
}

- (void)login{
    ZGAccount *ac = [[ZGAccount alloc] init];
}

/**
 *  登录第二页的登录键
 */
-(void)setupLogBtn
{
    CGFloat loginBtnX=15;
    CGFloat loginBtnY=self.view.frame.size.height+20;
    CGFloat loginBtnW=ScreenviewWidth-2*loginBtnX;
    CGFloat loginBtnH=45;

    UIButton* loginBtn=[[UIButton alloc]init];
    [loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn setBackgroundImage:[UIImage resizedImageWithName:@"page_log_btn"] forState:UIControlStateNormal];
    loginBtn.frame=CGRectMake(loginBtnX, loginBtnY, loginBtnW, loginBtnH);
    [self.backImg addSubview:loginBtn];
    self.loginBtn=loginBtn;
    
}

-(void)setupReg
{
    CGFloat regX=15;
    CGFloat regY=-350;
    CGFloat regW=ScreenviewWidth-2*regX;
    CGFloat regH=regW;
    ZGRegView* regView=[[ZGRegView alloc]init];
    regView.frame=CGRectMake(regX, regY, regW, regH);
    regView.textHeight=135;
    regView.delegate=self;
    self.regView=regView;
    [self.backImg addSubview:regView];
}

-(void)setupLogin
{
    CGFloat loginX=15;
    CGFloat loginY=-250;
    CGFloat loginW=ScreenviewWidth-2*loginX;
    CGFloat loginH=loginW*0.8;
    ZGLoginView* loginView=[[ZGLoginView alloc]init];
    loginView.frame=CGRectMake(loginX, loginY, loginW, loginH);
    loginView.textHeight=90;
    loginView.delegate=self;
    self.loginView=loginView;
    [self.backImg addSubview:loginView];
    
}
-(void)setupTop
{
    CGFloat TopW=self.view.frame.size.width*0.4;
    CGFloat TopH=TopW/128.0*175;
    CGFloat TopX=(ScreenviewWidth-TopW)*0.5;
    CGFloat TopY=TopH*0.5;
    LoginTopView* TopView=[[LoginTopView alloc]init];
   
    TopView.frame=CGRectMake(TopX, TopY, TopW, TopH);
    [self.backImg addSubview:TopView];
    self.topView=TopView;
}

-(void)setupBottom
{
    
    CGFloat BotH=100;
    CGFloat BotX=20;
    CGFloat BotW=self.view.frame.size.width-2*BotX;
    CGFloat BotY=self.view.frame.size.height*0.73;
    LoginBtnView* BotView=[[LoginBtnView alloc]init];
    
    BotView.delegate=self;
    BotView.frame=CGRectMake(BotX, BotY, BotW, BotH);
    [self.backImg addSubview:BotView];
    
    self.BtnView=BotView;
}
/**
 *  第一页的注册键
 *
 */
-(void)RegBtnView:(LoginBtnView *)View
{
    [self setupReg];
    [self setupLogBtn];
    
    self.regView.backBtn.tag=1;
    
    
    [self.loginBtn setTitle:@"确认注册" forState:UIControlStateNormal];
    [self.loginBtn removeTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.loginBtn addTarget:self action:@selector(registerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.topView.transform=CGAffineTransformMakeTranslation(0, -300);
        self.BtnView.transform=CGAffineTransformMakeTranslation(0, 160);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            
            self.regView.transform=CGAffineTransformMakeTranslation(0, 380);
            self.loginBtn.transform=CGAffineTransformMakeTranslation(0, -250);
//            [self.loginView.emailText becomeFirstResponder];
            [self.topView removeFromSuperview];
            [self.BtnView removeFromSuperview];
        }];
        
    }];
}
-(void)LogBtnView:(LoginBtnView *)View
{
    [self setupLogin];
    [self setupLogBtn];

    [UIView animateWithDuration:0.3 animations:^{
        self.topView.transform=CGAffineTransformMakeTranslation(0, -300);
        self.BtnView.transform=CGAffineTransformMakeTranslation(0, 160);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            
            self.loginView.transform=CGAffineTransformMakeTranslation(0, 280);
            self.loginBtn.transform=CGAffineTransformMakeTranslation(0, -310);
            [self.loginView.emailText becomeFirstResponder];
            [self.topView removeFromSuperview];
            [self.BtnView removeFromSuperview];
        }];

    }];

}
-(void)loginBack:(ZGLoginView *)ZGLoginView
{
    [self setupTop];
    [self setupBottom];
    self.topView.transform=CGAffineTransformMakeTranslation(0, -300);
    self.BtnView.transform=CGAffineTransformMakeTranslation(0, 160);
    
    [UIView animateWithDuration:0.3 animations:^{
        [self.loginView endEditing:YES];
        self.loginView.transform=CGAffineTransformIdentity;
        self.loginBtn.transform=CGAffineTransformIdentity;
        

        
    }completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.3 animations:^{
            
            self.topView.transform=CGAffineTransformIdentity;
            self.BtnView.transform=CGAffineTransformIdentity;
            
            [self.loginView removeFromSuperview];
            [self.loginBtn removeFromSuperview];
            
        }];
  
    }];
    
}
-(void)RegBack:(ZGRegView *)ZGRegView btn:(UIButton *)btn
{
    if (btn.tag==1) {
        [self setupTop];
        [self setupBottom];
        self.topView.transform=CGAffineTransformMakeTranslation(0, -300);
        
        self.BtnView.transform=CGAffineTransformMakeTranslation(0, 160);
        
        [UIView animateWithDuration:0.3 animations:^{
            [self.regView endEditing:YES];
            self.regView.transform=CGAffineTransformIdentity;
            self.loginBtn.transform=CGAffineTransformIdentity;
            
            
            
        }completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.3 animations:^{
                
                self.topView.transform=CGAffineTransformIdentity;
                self.BtnView.transform=CGAffineTransformIdentity;
                
                [self.regView removeFromSuperview];
                [self.loginBtn removeFromSuperview];
                
            }];
            
        }];
    }
    else if(btn.tag==2){
        [UIView animateWithDuration:0.6 animations:^{
            self.regView.AccountView.layer.opacity=1;
            self.regView.AccountView.transform=CGAffineTransformIdentity;
            self.regView.BaseInfoView.layer.opacity=0;
            self.regView.BaseInfoView.transform=CGAffineTransformIdentity;
            
            [self.loginBtn setTitle:@"确认注册" forState:UIControlStateNormal];
            self.regView.backBtn.tag=1;
        }];
    }
   

}

-(void)loginBtnClick
{
    self.view.window.rootViewController=[[TBTabBarController alloc]init];
    [UIApplication sharedApplication].statusBarHidden=NO;
}
/**
 *  确认注册按键的效果
 *
 *  
 */
-(void)registerBtnClick:(UIButton*)btn
{
    [UIView animateWithDuration:0.6 animations:^{
        self.regView.AccountView.layer.opacity=0;
        self.regView.AccountView.transform=CGAffineTransformMakeTranslation(-self.regView.frame.size.width, 0);
        self.regView.BaseInfoView.layer.opacity=1;
        self.regView.BaseInfoView.transform=CGAffineTransformMakeTranslation(-self.regView.frame.size.width, 0);
        [self comfirmToReg];

        [self.loginBtn setTitle:@"下一步" forState:UIControlStateNormal];
        [self.loginBtn removeTarget:self action:@selector(registerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.loginBtn addTarget:self action:@selector(updateUserDetail) forControlEvents:UIControlEventTouchUpInside];
        self.regView.backBtn.tag=2;
    }];
    
}

/**
 *  注册的网络请求
 *
 */
-(void)comfirmToReg
{
    ZGAccountRegParam * param = [[ZGAccountRegParam alloc] init];
    param.user_name = self.regView.emailText.text;
    param.user_passwd = [[self.regView.pswText.text MD5] SHA1];
//    NSLog(@"%@ %@", param.user_name, param.user_passwd);
    
    [ZGAccountTool regiserWithParams:param success:^(ZGAccount *account) {
        [ZGAccountTool saveAccount:account];
//        NSLog(@"%@", NSHomeDirectory());
        NSLog(@"%@", [ZGAccountTool getAccount].user_name);
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    
    
}

-(void)updateUserDetail{
    ZGUserDetailParam * param = [[ZGUserDetailParam alloc] init];
    param.user_id = [ZGAccountTool getAccount].user_id;
    param.token = [ZGAccountTool getAccount].token;
    param.name = self.regView.nickName.text;
    if (self.regView.maleBtn.isSelected) {
        param.sex = 1;
    }else if (self.regView.femaleBtn.isSelected) {
        param.sex = 2;
    }
    param.introduction = self.regView.profileText.text;
    
    [ZGAccountTool setUserDetail:param success:^(id json) {
        NSLog(@"success");
        NSLog(@"%@", json);
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
//    NSLog(@"update");
}

-(void)RegViewWithCameraBtn:(ZGRegView *)RegView btn:(NSInteger)btnNum
{
    UIImagePickerController *ipc=[[UIImagePickerController alloc]init];
    if (btnNum==1) {
        ipc.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    }
    else if(btnNum==0) {
        ipc.sourceType=UIImagePickerControllerSourceTypeCamera;
    }
    ipc.delegate=self;
    [self presentViewController:ipc animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image=info[UIImagePickerControllerOriginalImage];
    //    self.iconImage=image;
    
    self.regView.iconView.layer.borderWidth=3;
    self.regView.iconView.layer.borderColor=[UIColor whiteColor].CGColor;
    self.regView.iconView.image=image;

    
}


@end


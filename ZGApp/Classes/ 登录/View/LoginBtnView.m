//
//  LoginBtnView.m
//  ZGApp
//
//  Created by Jevons on 15/2/7.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "LoginBtnView.h"
#import "UIImage+TB.h"
@interface LoginBtnView()
@property(nonatomic,weak)UIButton* RegisBtn;
@property(nonatomic,weak)UIButton* LogBtn;
@end
@implementation LoginBtnView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.userInteractionEnabled=YES;
        
        UIButton* RegisBtn=[[UIButton alloc]init];
        [RegisBtn setTitle:@"注册" forState:UIControlStateNormal];
        [RegisBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        RegisBtn.font=[UIFont systemFontOfSize:16];
        [RegisBtn addTarget:self action:@selector(RegisBtn:) forControlEvents:UIControlEventTouchUpInside];
        [RegisBtn setBackgroundImage:[UIImage resizedImageWithName:@"page_log_register"] forState:UIControlStateNormal];
        [self addSubview:RegisBtn];
        self.RegisBtn=RegisBtn;
        
        UIButton* LogBtn=[[UIButton alloc]init];
        [LogBtn setTitle:@"登录" forState:UIControlStateNormal];
        [LogBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
         LogBtn.font=[UIFont systemFontOfSize:16];

        [LogBtn addTarget:self action:@selector(LogBtn:) forControlEvents:UIControlEventTouchUpInside];
        [LogBtn setBackgroundImage:[UIImage resizedImageWithName:@"page_log_sign"] forState:UIControlStateNormal];
        [self addSubview:LogBtn];
        self.LogBtn=LogBtn;
        
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat btnH=(self.frame.size.height-15)*0.5;
    self.RegisBtn.frame=CGRectMake(0, 0, self.frame.size.width, btnH);
    
    CGFloat LogBtnY=CGRectGetMaxY(self.RegisBtn.frame)+15;
    self.LogBtn.frame=CGRectMake(0, LogBtnY, self.frame.size.width, btnH);
}
-(void)RegisBtn:(UIButton*)btn
{
    if ([self.delegate respondsToSelector:@selector(RegBtnView:)]) {
        [self.delegate RegBtnView:self];
    }
}
-(void)LogBtn:(UIButton*)btn
{
    if ([self.delegate respondsToSelector:@selector(LogBtnView:)]) {
        [self.delegate LogBtnView:self];
    }
}
@end

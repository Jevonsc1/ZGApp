//
//  ZGUserNav.m
//  ZGApp
//
//  Created by Jevons on 15/3/7.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGUserNav.h"
@interface ZGUserNav()
@property(nonatomic,weak)UIButton* backBtn;
@property(nonatomic,weak)UIButton* settingBtn;

@property(nonatomic,weak)UILabel* nameLabel;
@end
@implementation ZGUserNav

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        UIButton* backBtn=[[UIButton alloc]init];
        [backBtn setImage:[UIImage imageNamed:@"menubar_back"] forState:UIControlStateNormal];
        [self addSubview:backBtn];
        [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
        self.backBtn=backBtn;
        
        UIButton* settingBtn=[[UIButton alloc]init];
        [settingBtn setImage:[UIImage imageNamed:@"menubar_setting"] forState:UIControlStateNormal];
        [self addSubview:settingBtn];
        [settingBtn addTarget:self action:@selector(settingBtnClick) forControlEvents:UIControlEventTouchUpInside];
        self.settingBtn=settingBtn;
        
   
        
        UILabel* nameLabel=[[UILabel alloc]init];
        [self addSubview:nameLabel];
        self.nameLabel=nameLabel;
    }
    return self;
}
-(void)backBtnClick
{
    if ([self.delegate respondsToSelector:@selector(navBarWithBtnBack:)]) {
        [self.delegate navBarWithBtnBack:self];
    }
}

-(void)settingBtnClick
{
    if ([self.delegate respondsToSelector:@selector(navBarWithBtnSetting:)]) {
        [self.delegate navBarWithBtnSetting:self];
    }
}



-(void)setName:(NSString *)name
{
    _name=[name copy];
    CGFloat viewWidth=[UIScreen mainScreen].bounds.size.width;
    self.backBtn.frame=CGRectMake(10, meTopGap, 30, 30);
    
   
    
    CGFloat settingBtnW=30;
    CGFloat settingBtnX=viewWidth-settingBtnW-10;
    
    self.settingBtn.frame=CGRectMake(settingBtnX, meTopGap, settingBtnW, 30);
    
    
    CGSize nameLabelSize=[name sizeWithFont:[UIFont systemFontOfSize:19]];
    CGFloat nameLableX=viewWidth*0.5-nameLabelSize.width*0.5;
    CGFloat nameLableY=meTopGap+4;
    
    self.nameLabel.frame=(CGRect){{nameLableX,nameLableY},nameLabelSize};
    self.nameLabel.text=_name;
    self.nameLabel.textColor=[UIColor whiteColor];
    
}

@end

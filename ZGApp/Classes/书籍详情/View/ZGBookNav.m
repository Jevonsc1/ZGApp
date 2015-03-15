//
//  ZGBookNav.m
//  ZGApp
//
//  Created by Jevons on 15/3/8.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//
#import "ZGBookNav.h"
@interface ZGBookNav()
@property(nonatomic,weak)UIButton* backBtn;
@property(nonatomic,weak)UIButton* colBtn;

@property(nonatomic,weak)UILabel* nameLabel;
@end
@implementation ZGBookNav

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
  
        
        UIButton* backBtn=[[UIButton alloc]init];
        [backBtn setImage:[UIImage imageNamed:@"menubar_back"] forState:UIControlStateNormal];
        [self addSubview:backBtn];
        [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
        self.backBtn=backBtn;
        
        UIButton* colBtn=[[UIButton alloc]init];
        [colBtn setImage:[UIImage imageNamed:@"menubar_collection_selected"] forState:UIControlStateNormal];
        [self addSubview:colBtn];
        [colBtn addTarget:self action:@selector(colBtnClick) forControlEvents:UIControlEventTouchUpInside];
        self.colBtn=colBtn;
        
        
        
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

-(void)colBtnClick
{
    if ([self.delegate respondsToSelector:@selector(navBarWithBtnCol:)]) {
        [self.delegate navBarWithBtnCol:self];
    }
}



-(void)setName:(NSString *)name
{
    _name=[name copy];
    CGFloat viewWidth=[UIScreen mainScreen].bounds.size.width;
    self.backBtn.frame=CGRectMake(10, meTopGap, 30, 30);
    
    
    
    CGFloat colBtnW=30;
    CGFloat colBtnX=viewWidth-colBtnW-10;
    
    self.colBtn.frame=CGRectMake(colBtnX, meTopGap, colBtnW, 30);
    
    
    CGSize nameLabelSize=[name sizeWithFont:[UIFont systemFontOfSize:19]];
    CGFloat nameLableX=viewWidth*0.5-nameLabelSize.width*0.5;
    CGFloat nameLableY=meTopGap+4;
    
    self.nameLabel.frame=(CGRect){{nameLableX,nameLableY},nameLabelSize};
    self.nameLabel.text=_name;
    self.nameLabel.textColor=[UIColor whiteColor];
    
}

@end
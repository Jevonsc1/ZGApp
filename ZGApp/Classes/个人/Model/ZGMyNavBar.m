//
//  ZGMyNavBar.m
//  ZGApp
//
//  Created by Jevons on 15/2/2.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGMyNavBar.h"
@interface ZGMyNavBar()
@property(nonatomic,weak)UIButton* notifBtn;
@property(nonatomic,weak)UIButton* settingBtn;
@property(nonatomic,weak)UIButton* searchBtn;
@property(nonatomic,weak)UILabel* nameLabel;
@end
@implementation ZGMyNavBar
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        UIButton* notifBtn=[[UIButton alloc]init];
        [notifBtn setImage:[UIImage imageNamed:@"menubar_notificationcenter"] forState:UIControlStateNormal];
        [self addSubview:notifBtn];
        [notifBtn addTarget:self action:@selector(notifBtnClick) forControlEvents:UIControlEventTouchUpInside];
        self.notifBtn=notifBtn;
        
        UIButton* settingBtn=[[UIButton alloc]init];
        [settingBtn setImage:[UIImage imageNamed:@"menubar_setting"] forState:UIControlStateNormal];
        [self addSubview:settingBtn];
        [settingBtn addTarget:self action:@selector(settingBtnClick) forControlEvents:UIControlEventTouchUpInside];
        self.settingBtn=settingBtn;
        
        UIButton* searchBtn=[[UIButton alloc]init];
        [searchBtn setImage:[UIImage imageNamed:@"menubar_search"] forState:UIControlStateNormal];
        [self addSubview:searchBtn];
        [searchBtn addTarget:self action:@selector(searchBtnClick) forControlEvents:UIControlEventTouchUpInside];
        self.searchBtn=searchBtn;
        
        UILabel* nameLabel=[[UILabel alloc]init];
        [self addSubview:nameLabel];
        self.nameLabel=nameLabel;
    }
    return self;
}
-(void)notifBtnClick
{
    if ([self.delegate respondsToSelector:@selector(navBarWithBtnNotif:)]) {
        [self.delegate navBarWithBtnNotif:self];
    }
}

-(void)settingBtnClick
{
    if ([self.delegate respondsToSelector:@selector(navBarWithBtnSetting:)]) {
        [self.delegate navBarWithBtnSetting:self];
    }
}

-(void)searchBtnClick
{
    if ([self.delegate respondsToSelector:@selector(navBarWithBtnSearch:)]) {
        [self.delegate navBarWithBtnSearch:self];
    }
}

-(void)setName:(NSString *)name
{
    _name=[name copy];
    CGFloat viewWidth=[UIScreen mainScreen].bounds.size.width;
    self.notifBtn.frame=CGRectMake(10, meTopGap, 30, 30);
    
    CGFloat settingBtnX=CGRectGetMaxX(self.notifBtn.frame)+10;
    
    self.settingBtn.frame=CGRectMake(settingBtnX, meTopGap, 30, 30);
    
    CGFloat searchBtnW=30;
    CGFloat searchBtnX=viewWidth-searchBtnW-10;
    
    self.searchBtn.frame=CGRectMake(searchBtnX, meTopGap, searchBtnW, 30);
    
    
    CGSize nameLabelSize=[name sizeWithFont:[UIFont systemFontOfSize:19]];
    CGFloat nameLableX=viewWidth*0.5-nameLabelSize.width*0.5;
    CGFloat nameLableY=meTopGap+4;
    
    self.nameLabel.frame=(CGRect){{nameLableX,nameLableY},nameLabelSize};
    self.nameLabel.text=_name;
    self.nameLabel.textColor=[UIColor whiteColor];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

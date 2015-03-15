//
//  ZGUserHeaderView.m
//  ZGApp
//
//  Created by T on 15/3/4.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGUserHeaderView.h"
#import "ZGStarView.h"
#import "UIImageView+WebCache.h"
#import "UIImage+Cut.h"
#import "ZGMyTagsView.h"
#import "UIImage+TB.h"
#import "ZGTagFrame.h"
@interface ZGUserHeaderView()
@property(nonatomic,weak)UIImageView* iconView;
@property(nonatomic,weak)UILabel* detailText;
@property(nonatomic,weak)UIButton* sendBtn;

@property(nonatomic,weak)ZGStarView* starView;
@property(nonatomic,weak)UIImageView* sexView;
@property(nonatomic,weak)NSMutableArray* tagsView;
@end
@implementation ZGUserHeaderView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.userInteractionEnabled=YES;
        
        self.backgroundColor=Blue;
        
        UIImageView* iconView=[[UIImageView alloc]init];
        [self addSubview:iconView];
        self.iconView=iconView;
        
        
        UIImageView* sexView=[[UIImageView alloc]init];
        [self addSubview:sexView];
        self.sexView=sexView;
        
        UILabel* detailText=[[UILabel alloc]init];
        [self addSubview:detailText];
        self.detailText=detailText;
        
        
        UIButton* sendBtn=[[UIButton alloc]init];
        [sendBtn addTarget:self action:@selector(sendBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:sendBtn];
        self.sendBtn=sendBtn;
        
      
        
    }
    return self;
}



-(void)setTopF:(ZGHeaderFrame *)topF
{
    _topF=topF;
    
    
    self.iconView.frame=topF.iconViewF;
    //    [self.iconView setImageWithURL:[NSURL URLWithString:topF.user.iconUrl]];
    self.iconView.layer.cornerRadius=topF.iconViewF.size.width/2;
    self.iconView.layer.masksToBounds=YES;
    self.iconView.layer.borderWidth=1;
    self.iconView.layer.borderColor=[UIColor whiteColor].CGColor;
    
    //    self.iconView.image=[UIImage cutWithPic:topF.user.iconImage border:0.0 color:[UIColor whiteColor]];
    self.iconView.image=topF.user.iconImage;
    
    
    //    self.cameraView.layer.anchorPoint=CGPointMake(1.0, 1.0);
    //    self.cameraView.layer.position=CGPointMake(self.iconView.bounds.size.width, 30);
   
    
    
    ZGStarView* starView=[[ZGStarView alloc]init];
    starView.frame=topF.starViewF;
    starView.rank=topF.user.rank;
    [self addSubview:starView];
    
    self.sexView.frame=topF.sexViewF;
    if (topF.user.sex) {
        self.sexView.image=[UIImage imageNamed:@"page_user_sex_male"];
        
    }else
    {
        self.sexView.image=[UIImage imageNamed:@"page_user_sex_female"];
    }
    
    
    self.detailText.frame=topF.detailTextF;
    self.detailText.text=topF.user.userIntro;
    self.detailText.font=[UIFont systemFontOfSize:13];
    self.detailText.textColor=[UIColor whiteColor];
    
    
    ZGMyTagsView* tagsView=[[ZGMyTagsView alloc]init];
    ZGTagFrame* tagsF=[[ZGTagFrame alloc]init];
    tagsF.tagsAry=[NSArray arrayWithArray:topF.user.tags];
    tagsView.tagFrame=tagsF;
    tagsView.frame=CGRectMake(0, 0, tagsF.tagsViewWidth, 20);
    
    UIScrollView* tagScroll=[[UIScrollView alloc]init];
    tagScroll.frame=topF.tagsViewF;
    [tagScroll addSubview:tagsView];
    tagScroll.contentSize=CGSizeMake(tagsF.tagsViewWidth, 20);
    tagScroll.bounces=NO;
    tagScroll.showsHorizontalScrollIndicator = NO;
    //    tagsView.scrollEnabled=YES;
    //    tagsView.contentSize=CGSizeMake(30, tagsF.tagsViewWidth);
    [self addSubview:tagScroll];
    
    
    CGRect frame=topF.myColBtnF;
    frame.origin.x=([UIScreen mainScreen].bounds.size.width-frame.size.width)*0.5;
    self.sendBtn.frame=frame;
    [self.sendBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.sendBtn setFont:[UIFont systemFontOfSize:14]];
    [self.sendBtn setBackgroundImage:[UIImage resizedImageWithName:@"btn2"] forState:UIControlStateNormal];
    [self.sendBtn setTitle:@"发送消息" forState:UIControlStateNormal];
    [self.sendBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    
    self.viewHeight=CGRectGetMaxY(topF.myColBtnF)+10;
    
}
-(void)sendBtnClick
{
    
}
@end

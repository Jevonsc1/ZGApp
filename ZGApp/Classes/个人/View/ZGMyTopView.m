//
//  ZGMyTopView.m
//  ZGApp
//
//  Created by Jevons on 15/2/1.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGMyTopView.h"
#import "ZGStarView.h"
#import "UIImageView+WebCache.h"
#import "UIImage+Cut.h"
#import "ZGMyTagsView.h"
#import "UIImage+TB.h"
#import "ZGTagFrame.h"

#define meTopGap  30
@interface ZGMyTopView()<UIActionSheetDelegate>

@property(nonatomic,weak)UIImageView* iconView;
@property(nonatomic,weak)UIButton* cameraView;
@property(nonatomic,weak)UILabel* detailText;

@property(nonatomic,weak)ZGStarView* starView;
@property(nonatomic,weak)UIImageView* sexView;
@property(nonatomic,weak)NSMutableArray* tagsView;

@end
@implementation ZGMyTopView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.userInteractionEnabled=YES;
        
       
        
        UIImageView* iconView=[[UIImageView alloc]init];
        [self addSubview:iconView];
        self.iconView=iconView;
        
        UIButton* cameraView=[[UIButton alloc]init];
        [cameraView setImage:[UIImage imageNamed:@"page_user_editportrait"] forState:UIControlStateNormal];
        [self addSubview:cameraView];
        self.cameraView=cameraView;
        
        UIImageView* sexView=[[UIImageView alloc]init];
        [self addSubview:sexView];
        self.sexView=sexView;
        
        UILabel* detailText=[[UILabel alloc]init];
        [self addSubview:detailText];
        self.detailText=detailText;
        
        
        UIButton* myColBtn=[[UIButton alloc]init];
        [myColBtn addTarget:self action:@selector(colClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:myColBtn];
        self.myColBtn=myColBtn;
        
        UIButton* myFootstepBtn=[[UIButton alloc]init];
        [myFootstepBtn addTarget:self action:@selector(footstepClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:myFootstepBtn];
        self.myFootstepBtn=myFootstepBtn;
        
    }
    return self;
}



-(void)setTopF:(ZGMyTopViewFrame *)topF
{
    _topF=topF;
   
    
    self.iconView.frame=topF.iconViewF;
//    [self.iconView setImageWithURL:[NSURL URLWithString:topF.user.iconUrl]];
    self.iconView.layer.cornerRadius=topF.iconViewF.size.width/2;
    self.iconView.layer.masksToBounds=YES;
    self.iconView.layer.borderWidth=2;
    self.iconView.layer.borderColor=[UIColor whiteColor].CGColor;
    
//    self.iconView.image=[UIImage cutWithPic:topF.user.iconImage border:0.0 color:[UIColor whiteColor]];
    self.iconView.image=topF.user.iconImage;
    
    
//    self.cameraView.layer.anchorPoint=CGPointMake(1.0, 1.0);
//    self.cameraView.layer.position=CGPointMake(self.iconView.bounds.size.width, 30);
    self.cameraView.frame=CGRectMake(170, 61, 50, 50);
    [self.cameraView addTarget:self action:@selector(cameraViewClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
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
    
    
    self.myColBtn.frame=topF.myColBtnF;
    [self.myColBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.myColBtn setFont:[UIFont systemFontOfSize:14]];
    [self.myColBtn setBackgroundImage:[UIImage resizedImageWithName:@"btn2"] forState:UIControlStateNormal];
    [self.myColBtn setTitle:@"我的收藏" forState:UIControlStateNormal];
    [self.myColBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    
    
    
    self.myFootstepBtn.frame=topF.myFootstepBtnF;
     [self.myFootstepBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.myFootstepBtn setFont:[UIFont systemFontOfSize:14]];
    [self.myFootstepBtn setBackgroundImage:[UIImage resizedImageWithName:@"btn2"] forState:UIControlStateNormal];
    [self.myFootstepBtn setTitle:@"  我的足迹" forState:UIControlStateNormal];
    [self.myFootstepBtn setImage:[UIImage imageNamed:@"page_user_btn_favorite"] forState:UIControlStateNormal];
    
}
-(void)colClick
{
    if ([self.delegate respondsToSelector:@selector(topViewWithColBtn:)]) {

        [self.delegate topViewWithColBtn:self];
    }
}
-(void)footstepClick
{
    if ([self.delegate respondsToSelector:@selector(topViewWithFootStepBtn:)]) {
        [self.delegate topViewWithFootStepBtn:self];
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
    
   if ([self.delegate respondsToSelector:@selector(topViewWithCameraBtn:btn:)]) {
        [self.delegate topViewWithCameraBtn:self btn:buttonIndex];
        
        
    }
}


@end

//
//  ZGMyTopViewFrame.m
//  ZGApp
//
//  Created by Jevons on 15/2/1.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGMyTopViewFrame.h"



@implementation ZGMyTopViewFrame

-(void)setUser:(ZGUser *)user
{
    _user=user;
    
    CGFloat viewWidth=[UIScreen mainScreen].bounds.size.width;
    
    
    
    
    
    CGFloat iconViewH=100;
    CGFloat iconViewW=iconViewH;
    CGFloat iconViewX=viewWidth*0.5-iconViewW*0.5;
    CGFloat iconViewY=70;
    
    _iconViewF=CGRectMake(iconViewX, iconViewY, iconViewW, iconViewH);
    
    CGFloat starViewH=11;
    CGFloat starViewW=60;
    CGFloat starViewX=viewWidth*0.5-starViewW*0.5-5;
    CGFloat starViewY=CGRectGetMaxY(_iconViewF)+10;
    _starViewF=CGRectMake(starViewX, starViewY, starViewW, starViewH);
    
    
    CGFloat sexViewY=CGRectGetMaxY(_iconViewF)+8;
    CGFloat sexViewX=CGRectGetMaxX(_starViewF)+16;
    _sexViewF=CGRectMake(sexViewX, sexViewY, 14, 18);
  
    
    CGSize detailTextSize=[user.userIntro sizeWithFont:[UIFont systemFontOfSize:14]];
    CGFloat detailTextX=viewWidth*0.5-detailTextSize.width*0.5;
    CGFloat detailTextY=CGRectGetMaxY(_starViewF)+30;
    _detailTextF=(CGRect){{detailTextX,detailTextY},detailTextSize};
    
    
    CGFloat tagsViewH=30;
    CGFloat tagsViewW=160;
    CGFloat tagsViewX=(viewWidth-tagsViewW)*0.5;
    CGFloat tagsViewY=CGRectGetMaxY(_detailTextF)+25;
    _tagsViewF=CGRectMake(tagsViewX, tagsViewY, tagsViewW, tagsViewH);
    
    CGFloat btnWidth=(viewWidth-3*btnGap)/2;
    CGFloat btnH=30;
    CGFloat btnY=CGRectGetMaxY(_tagsViewF)+30;
    _myColBtnF=CGRectMake(btnGap, btnY, btnWidth, btnH);
    
    _myFootstepBtnF=CGRectMake((viewWidth+btnGap)*0.5, btnY, btnWidth, btnH);
    
    
    _viewHeight=CGRectGetMaxY(_myFootstepBtnF)+20;
    
    
}
@end

//
//  ZGStarView.m
//  ZGApp
//
//  Created by Jevons on 15/2/1.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGStarView.h"
#define gap 2
@interface ZGStarView()

@end

@implementation ZGStarView


-(instancetype)init
{
    if (self=[super init]) {
        for (int i=0; i< 5; i++) {
            UIImageView* star=[[UIImageView alloc]init];
            [self addSubview:star];
        }
    }
    return self;
}
-(void)setRank:(int)rank
{
    _rank=rank;
    int oneBig=starMaxNum/5;
    int whole=self.rank/oneBig;
    int half=(self.rank+oneBig/2)/oneBig-whole;
    CGFloat starW=self.frame.size.width/5;
    CGFloat starH=self.frame.size.height;
    CGFloat starY=0;
    for (int i=0; i<whole; i++) {
        UIImageView* star=self.subviews[i];
        star.image=[UIImage imageNamed:@"page_user_star_yellow"];
        star.frame=CGRectMake(i*(starW+gap), starY, starW, starH);
    }
    if (half) {
        UIImageView* star =self.subviews[whole];
        star.image=[UIImage imageNamed:@"page_user_star_half"];
        star.frame=CGRectMake(whole*(starW+gap), starY, starW, starH);
    }
    for (int i=(whole+half); i<5; i++) {
        UIImageView* star=self.subviews[i];
        star.image=[UIImage imageNamed:@"page_user_star_white"];
        star.frame=CGRectMake(i*(starW+gap), starY, starW, starH);
    }

}

@end

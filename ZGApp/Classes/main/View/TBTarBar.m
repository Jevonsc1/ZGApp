//
//  TBTarBar.m
//  TestBooking
//
//  Created by Jevons on 14/12/13.
//  Copyright (c) 2014年 Jevons. All rights reserved.
//

#import "TBTarBar.h"
#import "TBTabBarButtton.h"
@interface TBTarBar()
@property(nonatomic,weak)TBTabBarButtton* btn;
@end

@implementation TBTarBar
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self =[super initWithFrame:frame]) {
//        self.userInteractionEnabled=YES;
    }
    return  self;
}

-(void)addItem:(UITabBarItem *)item
{
    TBTabBarButtton* btn=[[TBTabBarButtton alloc]init];
    btn.item=item;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    for (UIView* view in self.subviews) {
        if (![view isKindOfClass:[UIControl class]]) {
            [view removeFromSuperview];
        }
    }

    NSInteger count=self.subviews.count;

    CGFloat btnY=0;
    CGFloat btnW=self.bounds.size.width/count;
    CGFloat btnH=self.bounds.size.height;
    for (int i=0; i<count; i++) {
        CGFloat btnX=i*btnW;
        TBTabBarButtton* btn=self.subviews[i];
        btn.frame=CGRectMake(btnX, btnY, btnW, btnH);
        btn.tag=i;
       
        if (i==0) {
            self.btn=btn;
            self.btn.selected=YES;
        }
    }
}
-(void)btnClick:(TBTabBarButtton*)btn
{
    self.btn.selected=NO;
    btn.selected=YES;
    if ([self.delegate respondsToSelector:@selector(tabBar:to:)]) {
        [self.delegate tabBar:self to:btn.tag];
    }
    self.btn=btn;
}


@end

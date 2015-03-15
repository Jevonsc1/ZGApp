//
//  LoginTopView.m
//  ZGApp
//
//  Created by Jevons on 15/2/7.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "LoginTopView.h"
@interface LoginTopView()
//@property(nonatomic,weak)UILabel* FriLabel;
//@property(nonatomic,weak)UILabel* SecLabel;
@property(nonatomic,weak)UIImageView* LogoView;
@end

@implementation LoginTopView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor=[UIColor clearColor];
        UIImageView* logoView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"page_log_logo"]];
        [self addSubview:logoView];

        self.LogoView=logoView;
   
        
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];

    self.LogoView.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);

    
}

@end

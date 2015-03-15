//
//  IMChatToolBar.m
//  ZGApp
//
//  Created by Jevons on 15/1/23.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "IMChatToolBar.h"
#import "UIImage+TB.h"
#define gap 5
@interface IMChatToolBar()<UITextViewDelegate>
@property(nonatomic,weak)UIButton* iconBtn;

@property(nonatomic,weak)UIButton* composeBtn;
@property(nonatomic,weak)UILabel* placeholderLabel;
@end
@implementation IMChatToolBar


-(instancetype)init
{
    if (self=[super init]) {
        self.backgroundColor=[UIColor whiteColor];
        
        UIButton* iconBtn=[[UIButton alloc]init];
        [iconBtn setImage:[UIImage imageNamed:@"page_naonow_talking_biaoqing"] forState:UIControlStateNormal];
        iconBtn.frame=CGRectMake(0, 0, 40, 40);
        [self addSubview:iconBtn];
        self.iconBtn=iconBtn;
        
        
        UIButton* composeBtn=[[UIButton alloc]init];
        NSString* sendStr=@"发送";
        [composeBtn setBackgroundImage:[UIImage resizedImageWithName:@"page_naonow_portrait_small"] forState:UIControlStateNormal];
        [composeBtn setTitle:sendStr forState:UIControlStateNormal];
        [composeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        composeBtn.titleLabel.font=[UIFont systemFontOfSize:13];;
        CGSize composeBtnSize=[sendStr sizeWithFont:[UIFont systemFontOfSize:25]];
        composeBtnSize.width+=2;
        CGFloat composeBtnX=320-composeBtnSize.width-gap;
        composeBtn.frame=(CGRect){{composeBtnX,gap},composeBtnSize};
        [composeBtn addTarget:self action:@selector(composeBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:composeBtn];
        self.composeBtn=composeBtn;
        
        UITextView* typingTV=[[UITextView alloc]init];
        typingTV.backgroundColor=JWColor(216, 216, 216);
//        [typingTV setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"page_naonow_talking_typebackground"]]];
        
        CGFloat typingTVX=CGRectGetMaxX(iconBtn.frame);
        CGFloat typingTVW=CGRectGetMinX(composeBtn.frame)-gap-typingTVX;
        typingTV.frame=CGRectMake(typingTVX, 5, typingTVW, 30);
        typingTV.delegate=self;
        typingTV.layer.cornerRadius=6;
        typingTV.layer.masksToBounds=YES;
        [self addSubview:typingTV];
        self.typingTV=typingTV;
        
    }
    return  self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.contentMode= UIViewContentModeCenter;
}
-(void)composeBtnClick
{
    if ([self.delegate respondsToSelector:@selector(toobarComposeBtnClick:)]) {
        [self.delegate toobarComposeBtnClick:self];
    }
}

@end

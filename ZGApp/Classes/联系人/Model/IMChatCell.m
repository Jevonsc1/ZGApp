//
//  IMChatCell.m
//  ZGApp
//
//  Created by Jevons on 15/1/24.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "IMChatCell.h"
#import "UIImage+TB.h"
#define gap 5
@interface IMChatCell()
@property(nonatomic,weak)UITextField* chatTextField;
@end
@implementation IMChatCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]){
        self.backgroundColor=[UIColor clearColor];
        
        
        UIButton *iconbtn=[[UIButton alloc]init];
        [iconbtn setImage:[UIImage imageNamed:@"user2"] forState:UIControlStateNormal];
        [self addSubview:iconbtn];
        
        UITextField* chatTextField=[[UITextField alloc]init];
        chatTextField.background=[UIImage resizedImageWithName:@"page_naonow_talking_blue_path"];
        chatTextField.textColor=[UIColor blackColor];
        chatTextField.userInteractionEnabled=NO;
       [self addSubview:chatTextField];
        self.chatTextField=chatTextField;
        }
    return self;
}
-(void)setData:(IMChatData *)data{
    _data=data;
    self.chatTextField.text=data.chatContent;
    CGSize contentSize=[self.chatTextField.text sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(200, MAXFLOAT)];
    self.chatTextField.frame=CGRectMake(self.frame.size.width-50-contentSize.width, gap, contentSize.width, contentSize.height);
    CGRect frame=self.frame;
    frame.size.height=contentSize.height;
    self.frame=frame;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    for (UIControl* view in self.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            view.frame=CGRectMake(self.frame.size.width-40-gap, self.frame.size.height-40-gap, 40, 40);
        }
       
       
    }
    
}


@end

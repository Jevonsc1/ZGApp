//
//  JWTextview.m
//  JeWeibo
//
//  Created by Jevons on 14/12/23.
//  Copyright (c) 2014年 Jevons. All rights reserved.
//

#import "ZGTextview.h"
#define ZGNotificationCenter [NSNotificationCenter defaultCenter]
@interface ZGTextview()
@property(nonatomic,weak)UILabel* placeholderLabel;
@end
@implementation ZGTextview
-(id)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        UILabel* placeholderLabel=[[UILabel alloc]init];
        placeholderLabel.textColor=[UIColor lightGrayColor];
        placeholderLabel.font=self.font;
        placeholderLabel.backgroundColor=[UIColor clearColor];
        placeholderLabel.hidden=YES;
        placeholderLabel.numberOfLines=0;
        [self insertSubview:placeholderLabel atIndex:0];
        self.placeholderLabel=placeholderLabel;
        [ZGNotificationCenter addObserver:self selector:@selector(DidchangeText) name:UITextViewTextDidChangeNotification object:self];
    }
    return self;
}
-(void)DidchangeText{
    self.placeholderLabel.hidden=(self.text.length!=0);
    
}
-(void)dealloc
{
    [ZGNotificationCenter removeObserver:self];
}
-(void)setPlaceholder:(NSString *)placeholder
{
    _placeholder=[placeholder copy];
    self.placeholderLabel.text=placeholder;
    
    if (placeholder.length) {
    self.placeholderLabel.hidden=NO;
    CGFloat placeholderX=5;
    CGFloat placeholderY=7;
    CGFloat maxW=self.frame.size.width-2*placeholderX;
    CGFloat maxH=self.frame.size.height-2*placeholderY;
    CGSize placeholderSize = [placeholder sizeWithFont:self.placeholderLabel.font constrainedToSize:CGSizeMake(maxW, maxH)];
        
        //如果沒有為self的frame賦值就會出錯
//    self.placeholderLabel.frame=CGRectMake(placeholderX, placeholderY, 320, 10);
    self.placeholderLabel.frame = CGRectMake(placeholderX, placeholderY, placeholderSize.width, placeholderSize.height);
    }
    else{
        self.placeholderLabel.hidden=YES;
    }
}
- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    self.placeholderLabel.font = font;
    self.placeholder = self.placeholder;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

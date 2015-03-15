//
//  ZGLoginTextField.m
//  ZGApp
//
//  Created by Jevons on 15/2/7.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGLoginTextField.h"
@interface ZGLoginTextField()

@end
@implementation ZGLoginTextField
+(instancetype)initWithLeftImage:(UIImage*)image title:(NSString*)title
{
    
    ZGLoginTextField* textField=[[ZGLoginTextField alloc]init];
    textField.titleStr=title;
    textField.leftIcon=image;

    
    return textField;
}
-(instancetype)init
{
    if (self=[super init]) {
        self.leftViewMode = UITextFieldViewModeAlways;
        self.clearButtonMode=UITextFieldViewModeWhileEditing;
        self.textAlignment = NSTextAlignmentCenter;
        
    }
    return self;
}
-(CGRect)leftViewRectForBounds:(CGRect)bounds
{
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    iconRect.origin.x += 10;// 右偏10

    return iconRect;
 
}
-(void)setLeftIcon:(UIImage *)leftIcon
{
    _leftIcon=leftIcon;
    UIImageView* imageView=[[UIImageView alloc]initWithImage:leftIcon];
    self.leftView=imageView;
}
-(void)setTitleStr:(NSString *)titleStr
{
    _titleStr=titleStr;
    self.placeholder=titleStr;
}
-(CGRect)placeholderRectForBounds:(CGRect)bounds
{
    CGRect placeRect = [super leftViewRectForBounds:bounds];
    placeRect.size=[self.titleStr sizeWithFont:[UIFont systemFontOfSize:17]];
    placeRect.origin.x=(ScreenviewWidth-placeRect.size.width-60)*0.5;
    placeRect.origin.y -=10;
    
    return placeRect;
}
@end

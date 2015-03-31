//
//  ZGBaceInfoTextField.m
//  ZGApp
//
//  Created by Jevons on 15/2/18.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGBaceInfoTextField.h"

@implementation ZGBaceInfoTextField
+(instancetype)initWithLeftTitle:(NSString *)leftTitle placeTitle:(NSString *)placeTitle
{
   
    
    ZGBaceInfoTextField* textField=[[ZGBaceInfoTextField alloc]init];
    textField.placeTitle=placeTitle;
    textField.leftTitle=leftTitle;
    
    return textField;
}
-(instancetype)init
{
    if (self=[super init]) {
        self.leftViewMode = UITextFieldViewModeAlways;
        self.clearButtonMode=UITextFieldViewModeWhileEditing;
        self.textAlignment = NSTextAlignmentLeft;
        
    }
    return self;
}
-(CGRect)leftViewRectForBounds:(CGRect)bounds
{
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    iconRect.origin=CGPointMake(10, 10);
    iconRect.size=[self.leftTitle sizeWithFont:[UIFont systemFontOfSize:13]];
    
    return iconRect;
    
}
-(void)setLeftTitle:(NSString *)leftTitle
{
    _leftTitle=[leftTitle copy];;
    UILabel* label=[[UILabel alloc]init];
    label.font=[UIFont systemFontOfSize:12];
     label.text=leftTitle;
    label.textColor=[UIColor lightGrayColor];
    self.leftView=label;
}
-(void)setPlaceTitle:(NSString *)placeTitle
{
    _placeTitle=[placeTitle copy];;
    self.placeholder=placeTitle;
}
-(CGRect)placeholderRectForBounds:(CGRect)bounds
{
    CGRect placeRect = [super leftViewRectForBounds:bounds];
    placeRect.size=[self.placeholder sizeWithFont:[UIFont systemFontOfSize:17]];
    placeRect.origin.x=(ScreenviewWidth-placeRect.size.width-60)*0.5;
    placeRect.origin.y -=10;
    
    return placeRect;
}
@end

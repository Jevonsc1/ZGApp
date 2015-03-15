//
//  UIBarButtonItem+TB.m
//  TestBooking
//
//  Created by Jevons on 14/12/19.
//  Copyright (c) 2014年 Jevons. All rights reserved.
//

#import "UIBarButtonItem+TB.h"

@implementation UIBarButtonItem (TB)

+(UIBarButtonItem*)setNormalImage:(NSString *)normal hightlighted:(NSString *)hightlighted target:(id)target action:(SEL)action
{
    UIButton* btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:hightlighted] forState:UIControlStateHighlighted];
    btn.frame=(CGRect){CGPointZero,btn.currentBackgroundImage.size};
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}
@end

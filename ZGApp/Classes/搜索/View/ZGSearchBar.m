//
//  ZGSearchBar.m
//  ZGApp
//
//  Created by Jevons on 15/1/22.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGSearchBar.h"
#import "UIImage+TB.h"

@implementation ZGSearchBar

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.background=[UIImage resizedImageWithName:@"tag1_middle"];
        
        
        UIImageView* imageIcon=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
        imageIcon.contentMode=UIViewContentModeCenter;
        imageIcon.frame=CGRectMake(0, 0, 30, 30);
        
        self.placeholder=@"Search";
        NSMutableDictionary* attr=[NSMutableDictionary dictionary];
        attr[NSFontAttributeName]=[UIFont systemFontOfSize:14];
        self.attributedPlaceholder=[[NSAttributedString alloc]initWithString:@"请输入搜索内容" attributes:attr];
        self.leftViewMode=UITextFieldViewModeAlways;
        self.leftView=imageIcon;
        self.clearButtonMode=YES;
        
        self.returnKeyType=UIReturnKeySearch;
        self.enablesReturnKeyAutomatically=YES;
    }
    return self;
}


@end

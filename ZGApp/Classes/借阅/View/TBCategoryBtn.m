//
//  TBCategoryBtn.m
//  TestBooking
//
//  Created by Jevons on 14/12/17.
//  Copyright (c) 2014年 Jevons. All rights reserved.
//

#import "TBCategoryBtn.h"
#import "UIImage+TB.h"

@implementation TBCategoryBtn
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.titleLabel.font=[UIFont systemFontOfSize:12];
        self.userInteractionEnabled=NO;
        //    [self.categoryBtn setTitle:@"0" forState:UIControlStateNormal];
        self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
        //这个地方的图片都只需要给小点就行
        [self setBackgroundImage:[UIImage resizedImageWithName:@"tag1"] forState:UIControlStateNormal];
//        self.contentMode=UIViewContentModeScaleAspectFit;
    }
    return self;
}
-(void)setCategory:(NSString *)category
{
    _category=[category copy];
    [self setTitle:category forState:UIControlStateNormal];
    CGRect frame=self.frame;
    CGFloat width=self.currentBackgroundImage.size.width;
    CGFloat height=self.currentBackgroundImage.size.width;
    if (category.length>1) {
        CGSize categorySize=[category sizeWithFont:self.titleLabel.font];
        width=categorySize.width+15;
    }
    frame.size.height=height;
    frame.size.width=width-3;
    self.frame=frame;
}

@end

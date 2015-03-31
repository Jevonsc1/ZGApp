//
//  ZGSendPhotosView.m
//  JeWeibo
//
//  Created by Jevons on 14/12/27.
//  Copyright (c) 2014年 Jevons. All rights reserved.
//

#import "ZGSendPhotosView.h"

@implementation ZGSendPhotosView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        
    }
    return self;
}

-(void)addPhoto:(UIImage *)image
{
    UIImageView* imageView=[[UIImageView alloc]init];
    imageView.image=image;
    [self addSubview:imageView];
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat imageW  =70;
    CGFloat imageH= imageW;
    int maxColmns=4;
    CGFloat magrin=(self.frame.size.width-maxColmns*imageW)/(maxColmns+1);
    for (int i=0; i<self.subviews.count; i++) {
        UIImageView* imageview=self.subviews[i];
        CGFloat imageX=(i%maxColmns)*(imageW+magrin)+magrin;
        CGFloat imageY=(i/maxColmns)*(imageH+magrin);
        imageview.frame=CGRectMake(imageX, imageY, imageW, imageH);
    }
}
-(NSArray *)totalNumberOfPhoto
{
    NSMutableArray* images=[NSMutableArray array];
    for (UIImageView* imageview in self.subviews) {
        [images addObject:imageview.image];
    }
    return images;
}
@end

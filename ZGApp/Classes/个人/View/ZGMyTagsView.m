//
//  ZGMyTagsView.m
//  ZGApp
//
//  Created by Jevons on 15/2/2.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGMyTagsView.h"
#import "ZGOneTag.h"
#import "UIImage+TB.h"
@interface ZGMyTagsView()
@property(nonatomic,assign)CGFloat curWidth;
@end

@implementation ZGMyTagsView


-(void)setTagFrame:(ZGTagFrame *)tagFrame
{
    _tagFrame=tagFrame;
    for (int i =0; i<tagFrame.tagFAry.count; i++) {
        UIButton* tagBtn=[[UIButton alloc]init];
        ZGOneTag* onetag=tagFrame.tagFAry[i];
        tagBtn.frame=onetag.tagF;
        NSString* tagstr=tagFrame.tagsAry[i];
        [tagBtn setTitle:tagstr forState:UIControlStateNormal];
        [tagBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        tagBtn.font=[UIFont systemFontOfSize:14];
        [tagBtn setBackgroundImage:[UIImage resizedImageWithName:@"page_user_tag"] forState:UIControlStateNormal];
        [self addSubview:tagBtn];
    
    }
    
}
@end

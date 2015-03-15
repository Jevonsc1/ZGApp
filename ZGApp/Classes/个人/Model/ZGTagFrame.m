//
//  ZGTagFrame.m
//  ZGApp
//
//  Created by Jevons on 15/2/2.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGTagFrame.h"
#import "ZGOneTag.h"
@interface ZGTagFrame()
@property(nonatomic,assign)CGFloat curWidth;
@end

@implementation ZGTagFrame
-(NSMutableArray *)tagFAry
{
    if (_tagFAry==nil) {
        _tagFAry=[NSMutableArray array];
    }
    return _tagFAry;
}
-(void)setTagsAry:(NSArray *)tagsAry
{
    _tagsAry=tagsAry;
    for (int i =0; i<tagsAry.count; i++) {
        NSString* tagstr=tagsAry[i];
        CGSize tagBtnSize=[tagstr sizeWithFont:[UIFont systemFontOfSize:18]];
        CGFloat tagBtnY=0;
        CGFloat tagBtnX;
        if (i==0) {
            tagBtnX=0;
            
        }
        else{
            tagBtnX=self.curWidth+12;
            
        }
        self.curWidth=tagBtnX+tagBtnSize.width;
        ZGOneTag* tagF=[[ZGOneTag alloc]init];
        tagF.tagF=CGRectMake(tagBtnX, tagBtnY, tagBtnSize.width+7, tagBtnSize.height);
        [self.tagFAry addObject:tagF];
    }
    self.tagsViewWidth=self.curWidth+12;
    
}

@end

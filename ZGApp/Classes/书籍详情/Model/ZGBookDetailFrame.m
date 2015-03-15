//
//  ZGBookDetailFrame.m
//  ZGApp
//
//  Created by Jevons on 15/1/27.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGBookDetailFrame.h"
#import "ZGBookTag.h"
#import "ZGTagRect.h"
@interface ZGBookDetailFrame()
@property(nonatomic,assign)CGFloat taglength;
@property(nonatomic,assign)CGFloat taghight;
@end

@implementation ZGBookDetailFrame
-(NSMutableArray *)tagsViewFArray
{
    if (_tagsViewFArray==nil) {
        _tagsViewFArray=[NSMutableArray array];
    }
    return _tagsViewFArray;
}

-(void)setBook:(ZGBook *)book
{
    _book=book;
    [self setupTop:book];
    [self setupBottom:book];
}
-(void)setupBottom:(ZGBook*)book
{
    CGFloat viewWidth=[UIScreen mainScreen].bounds.size.width;
    
    CGFloat bookSummaryX=BookDetailGap;
    CGFloat bookSummaryY=0;
    CGSize bookSummarySize=[book.summary sizeWithFont:[UIFont systemFontOfSize:18] constrainedToSize:CGSizeMake(viewWidth-2*BookDetailGap, 86)];
    _bookSummaryF=(CGRect){{bookSummaryX,bookSummaryY},bookSummarySize};
    
    CGFloat bookInfoBtnY= CGRectGetMaxY(_bookSummaryF);
    NSString* btnTilte=@"  书籍信息  ";
    CGSize btnSize=[btnTilte sizeWithFont:[UIFont systemFontOfSize:32]];
    _bookInfoBtnF=(CGRect){{(viewWidth-btnSize.width)*0.5,bookInfoBtnY},btnSize};
    
    CGFloat friLabelX=bookSummaryX;
    CGFloat friLabrlY=CGRectGetMaxY(_bookInfoBtnF)+BookDetailGap;
    NSString* frilabelText=@"看过好友";
    CGSize friLabelSize=[frilabelText sizeWithFont:[UIFont systemFontOfSize:17]];
    _friLabelF=(CGRect){{friLabelX,friLabrlY},friLabelSize};
    
    _bottomViewHeigth=CGRectGetMaxY(_friLabelF)+BookDetailGap;
}
-(void)setupTop:(ZGBook*)book
{
    CGFloat viewWidth=[UIScreen mainScreen].bounds.size.width;
    
    CGFloat topviewW=viewWidth;
    CGFloat topviewX=0;
    CGFloat topviewY=0;
    CGFloat topviewH=0;
    
    CGFloat bookimageViewX=BookDetailGap;
    CGFloat bookimageViewY=BookDetailGap+44;
    CGFloat bookimageViewW=67;
    CGFloat bookimageViewH=100;
    _bookImageViewF=CGRectMake(bookimageViewX, bookimageViewY, bookimageViewW, bookimageViewH);
    
    CGFloat bookTitleX=CGRectGetMaxX(_bookImageViewF)+BookDetailGap+20;
    CGFloat bookTitleY=bookimageViewY;
    CGSize bookTitleSize=[book.title sizeWithFont:[UIFont systemFontOfSize:17] constrainedToSize:CGSizeMake(viewWidth-3*BookDetailGap-bookimageViewW, MAXFLOAT)];
    _bookTitleF=(CGRect){{bookTitleX,bookTitleY},bookTitleSize};
    
    CGFloat tagViewW = viewWidth;
    
    for (int i=0; i<book.tags.count; i++) {
        ZGBookTag* tag=book.tags[i];
        NSString* string =[NSString stringWithFormat:@"%@      ",tag.name];
        CGSize tagSize=[string sizeWithFont:tagFont];
        CGFloat tagX=0.0;
        CGFloat tagY=0.0;
        if (i == 0) {
            tagX=bookTitleX;
            tagY=CGRectGetMaxY(_bookTitleF)+BookDetailGap;
        }
        else{
            if ((tagSize.width+self.taglength+BookDetailGap)>tagViewW) {
                tagX=bookTitleX;
                tagY=self.taghight+BookDetailGap;
            }
            else
            {
                tagX=self.taglength+BookDetailGap;
                tagY=self.taghight-tagSize.height;
            }
        }
        self.taglength=tagSize.width+tagX;
        self.taghight=tagSize.height+tagY;
        ZGTagRect* rect=[[ZGTagRect alloc]init];
        rect.tagX=tagX;
        rect.tagY=tagY;
        rect.tagW=tagSize.width;
        rect.tagH=tagSize.height;
        [self.tagsViewFArray addObject:rect];
    }
    
    CGFloat publisherLabelY=self.taghight+BookDetailGap;
    CGFloat publisherLabelX=bookTitleX;
    CGSize pushlisherLabelSize=[book.publisher sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(viewWidth-3*BookDetailGap-bookimageViewW, MAXFLOAT)];
    _publisherLabelF=(CGRect){{publisherLabelX,publisherLabelY},pushlisherLabelSize};
    
    if (CGRectGetMaxY(_bookImageViewF)>CGRectGetMaxY(_publisherLabelF)) {
        topviewH=CGRectGetMaxY(_bookImageViewF)+BookDetailGap;
        _topViewHeight=topviewH;
    }
    else{
        topviewH=CGRectGetMaxY(_publisherLabelF)+BookDetailGap;
        _topViewHeight=topviewH;
    }
    _topViewF=CGRectMake(topviewX, topviewY, topviewW, topviewH);
}
@end

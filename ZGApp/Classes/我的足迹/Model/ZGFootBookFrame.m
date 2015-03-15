//
//  ZGFootBookFrame.m
//  ZGApp
//
//  Created by Jevons on 15/3/3.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGFootBookFrame.h"
#define collectGap 15
@implementation ZGFootBookFrame
-(void)setBook:(ZGFootBook *)book
{
    //    CGFloat ScreenviewWidth=[UIScreen mainScreen].bounds.size.width;
    
    _book=book;
    
    
    
    CGFloat ColTimeX=collectGap+30;
    CGFloat ColTimeY=collectGap;
    CGSize ColTimeSize=[book.footTime sizeWithFont:[UIFont systemFontOfSize:13]];
    _ColTimeF=(CGRect){{ColTimeX,ColTimeY},ColTimeSize};
    
    CGFloat leftTopViewX=collectGap+10;
    CGFloat leftTopViewY=0;
    CGFloat leftTopViewW=16;
    CGFloat leftTopViewH=ColTimeSize.height+collectGap;
    _leftTopViewF=CGRectMake(leftTopViewX, leftTopViewY, leftTopViewW, leftTopViewH);
    
    
    
    CGFloat bookBGX=collectGap;
    CGFloat bookBGY=CGRectGetMaxY(_ColTimeF);
    CGFloat bookBGW=ScreenviewWidth-2*collectGap;
    
    
    CGFloat bookViewX=collectGap;
    CGFloat bookViewY=collectGap;
    CGFloat bookViewW=50;
    CGFloat bookViewH=70;
    _bookViewF=CGRectMake(bookViewX, bookViewY, bookViewW, bookViewH);
    
    CGFloat bookBGH=CGRectGetMaxY(_bookViewF)-bookBGY+4*collectGap;
    _BookBgF=CGRectMake(bookBGX, bookBGY, bookBGW, bookBGH);
    
    _cellHeight=CGRectGetMaxY(_BookBgF);
    
    
    CGFloat bookNameX=CGRectGetMaxX(_bookViewF)+collectGap;
    CGFloat bookNameY=bookViewY+collectGap;
    CGSize bookNameSize=[book.title sizeWithFont:[UIFont systemFontOfSize:17]];
    _bookNameF=(CGRect){{bookNameX,bookNameY},bookNameSize};
    
    CGFloat bookAuthorX=bookNameX;
    CGFloat bookAuthorY=CGRectGetMaxY(_bookNameF)+collectGap;
    CGSize bookAuthorSize=[book.author sizeWithFont:[UIFont systemFontOfSize:16]];
    _bookAuthorF=(CGRect){{bookAuthorX,bookAuthorY},bookAuthorSize};
    
    
    
}
@end

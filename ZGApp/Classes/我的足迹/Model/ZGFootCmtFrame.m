//
//  ZGFootCmtFrame.m
//  ZGApp
//
//  Created by Jevons on 15/3/3.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGFootCmtFrame.h"
#define collectGap 15
@implementation ZGFootCmtFrame
-(void)setComment:(ZGFootCmt *)comment
{
    _comment=comment;
    
    CGFloat ColTimeX=collectGap+30;
    CGFloat ColTimeY=collectGap;
    NSString* timeStr=[NSString stringWithFormat:@"%lld",comment.comment_time];
    CGSize ColTimeSize=[timeStr sizeWithFont:[UIFont systemFontOfSize:13]];
    _ColTimeF=(CGRect){{ColTimeX,ColTimeY},ColTimeSize};
    
    CGFloat leftTopViewX=collectGap+10;
    CGFloat leftTopViewY=0;
    CGFloat leftTopViewW=16;
    CGFloat leftTopViewH=ColTimeSize.height+collectGap;
    _leftTopViewF=CGRectMake(leftTopViewX, leftTopViewY, leftTopViewW, leftTopViewH);
    
    CGFloat commentBGX=collectGap;
    CGFloat commentBGY=CGRectGetMaxY(_ColTimeF);
    CGFloat commentBGW=ScreenviewWidth-2*collectGap;
    
    CGFloat iconViewX=collectGap;
    CGFloat iconViewY=collectGap;
    CGFloat iconViewW=30;
    CGFloat iconViewH=iconViewW;
    _iconViewF=CGRectMake(iconViewX, iconViewY, iconViewW, iconViewH);
    
    CGFloat AuthorNameX=CGRectGetMaxX(_iconViewF)+collectGap;
    CGFloat AuthorNameY=iconViewY+3;
    CGSize AuthorSize=[comment.send_name sizeWithFont:[UIFont systemFontOfSize:16]];
    _AuthorF=(CGRect){{AuthorNameX,AuthorNameY},AuthorSize};
    
    
    CGFloat ContentViewY;
    
    if (comment.title) {
        CGFloat commentTitleX=AuthorNameX;
        CGFloat commentTitleY=CGRectGetMaxY(_AuthorF)+collectGap*0.5;
        CGFloat commentTitleW=commentBGW-iconViewW-3*collectGap;
        CGSize commentTitleSize=[comment.title sizeWithFont:[UIFont systemFontOfSize:20] constrainedToSize:CGSizeMake(commentTitleW, MAXFLOAT)];
        _commentTitleF=CGRectMake(commentTitleX, commentTitleY, commentTitleW, commentTitleSize.height);
        
        ContentViewY=CGRectGetMaxY(_commentTitleF)+collectGap*0.5;
    }
    else{
        ContentViewY=CGRectGetMaxY(_AuthorF)+collectGap*0.5;
    }
    
    
    CGFloat ContentViewX=AuthorNameX;
    CGFloat ContentViewW=commentBGW-iconViewW-3*collectGap;
    CGSize ContentViewSize=[comment.content sizeWithFont:[UIFont systemFontOfSize:16] constrainedToSize:CGSizeMake(ContentViewW, 40)];
    _contentF=(CGRect){{ContentViewX,ContentViewY},ContentViewSize};
    
    
    CGFloat commentCountX=AuthorNameX;
    CGFloat commentCountY=CGRectGetMaxY(_contentF)+collectGap;
    CGFloat commentCountW=40;
    CGFloat commentCountH=20;
    _Comment_countF=CGRectMake(commentCountX, commentCountY, commentCountW, commentCountH);
    
    CGFloat likeCountX=commentBGW*0.35;
    CGFloat likeCountY=commentCountY;
    CGFloat likeCountW=commentCountW;
    CGFloat likeCountH=commentCountH;
    
    _Like_countF=CGRectMake(likeCountX, likeCountY, likeCountW, likeCountH);
    
    
    CGFloat bookNameX=commentBGW*0.6;
    CGFloat bookNameY=commentCountY+3;
    CGSize bookNameSize=[comment.book_name sizeWithFont:[UIFont systemFontOfSize:13] constrainedToSize:CGSizeMake(commentBGW*0.5, MAXFLOAT)];
    _bookNameF=CGRectMake(bookNameX, bookNameY, bookNameSize.width, bookNameSize.height);
    
    CGFloat commentBGH=CGRectGetMaxY(_bookNameF)+collectGap;
    _CommentBgF=CGRectMake(commentBGX, commentBGY, commentBGW, commentBGH);
    
    _cellHeight=CGRectGetMaxY(_CommentBgF);
    
    
    
}
@end

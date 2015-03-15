//
//  ZGNofCellFrame.m
//  ZGApp
//
//  Created by Jevons on 15/1/29.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGNofCellFrame.h"

@implementation ZGNofCellFrame
-(void)setCelldata:(ZGNofCellData *)celldata
{
    _celldata=celldata;
    CGFloat viewWidth=[UIScreen mainScreen].bounds.size.width;
    
    CGFloat iconX=NotificationGap;
    CGFloat iconY=NotificationGap;
    CGFloat iconW=viewWidth/5-NotificationGap;
    CGFloat iconH=iconW;
    
    _iconF=CGRectMake(iconX, iconY, iconW, iconH);
    
    
    CGFloat nameX=CGRectGetMaxX(_iconF);
    CGFloat nameY=iconY;
    CGSize nameSize=[celldata.name sizeWithFont:cellnameFont];
    _nameF=(CGRect){{nameX,nameY},nameSize};
    
    if (celldata.style==cellIconStyleAddFri) {
        NSString *str=@"接受";
        CGSize rightBtnSize=[str sizeWithFont:[UIFont systemFontOfSize:25]];
        _rightBtnSize=rightBtnSize;
        
        CGFloat detailTextX=nameX;
        CGFloat detailTextY=CGRectGetMaxY(_nameF)+NotificationGap*0.2;
        CGFloat conWidth=viewWidth-iconW-rightBtnSize.width-3*NotificationGap;
        CGSize detailTextSize=[celldata.detailText sizeWithFont:celldetailFont constrainedToSize:CGSizeMake(conWidth, MAXFLOAT)];
        _detailTextF=(CGRect){{detailTextX,detailTextY},detailTextSize};
        
        _cellHeight=CGRectGetMaxY(_detailTextF)+NotificationGap;
        
        _rightBtnCenter=CGPointMake(viewWidth-10-rightBtnSize.width*0.5, _cellHeight*0.5);
        
        
    }
    else
    {
        NSString *str=@" 新";
        CGSize righttBtnSize=[str sizeWithFont:[UIFont systemFontOfSize:16]];
        _rightBtnSize=righttBtnSize;
        
        CGFloat detailTextX=nameX;
        CGFloat detailTextY=CGRectGetMaxY(_nameF)+NotificationGap*0.2;
        CGFloat conWidth=viewWidth-iconW-righttBtnSize.width-3*NotificationGap;
        CGSize detailTextSize=[celldata.detailText sizeWithFont:celldetailFont constrainedToSize:CGSizeMake(conWidth, MAXFLOAT)];
        _detailTextF=(CGRect){{detailTextX,detailTextY},detailTextSize};
        
        _cellHeight=CGRectGetMaxY(_detailTextF)+NotificationGap;
        
        _rightBtnCenter=CGPointMake(viewWidth-10-righttBtnSize.width*0.5, _cellHeight*0.5);
    }
    
    
}

@end

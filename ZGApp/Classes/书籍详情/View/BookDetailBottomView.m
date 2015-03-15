//
//  BookDetailBottomView.m
//  ZGApp
//
//  Created by Jevons on 15/1/28.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "BookDetailBottomView.h"
#import "UIImage+TB.h"
#import "ZGBook.h"
@interface BookDetailBottomView()
@property(nonatomic,weak)UILabel* bookSummary;
@property(nonatomic,weak)UIButton* DisplayBtn;
@property(nonatomic,weak)UIButton* BookInfoBtn;
@property(nonatomic,strong)NSMutableArray* FriArray;
@property(nonatomic,weak)UIButton* Frilabel;
@end

@implementation BookDetailBottomView
-(NSMutableArray *)FriArray
{
    if (_FriArray==nil) {
        _FriArray=[NSMutableArray array];
    }
    return _FriArray;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        
        UILabel* bookSummary=[[UILabel alloc]init];
        bookSummary.numberOfLines=0;
        [self addSubview:bookSummary];
        self.bookSummary=bookSummary;
        
        
        UIButton* DisplayBtn=[[UIButton alloc]init];
        [self addSubview:DisplayBtn];
        self.DisplayBtn=DisplayBtn;
        
        UIButton* BookInfoBtn=[[UIButton alloc]init];
        [self addSubview:BookInfoBtn];
        self.BookInfoBtn=BookInfoBtn;
        
        UIButton* FriLabel=[[UIButton alloc]init];
        [self addSubview:FriLabel];
        self.Frilabel=FriLabel;
        
    }
    return self;
}
-(void)setDetailFrame:(ZGBookDetailFrame *)DetailFrame
{
    _DetailFrame=DetailFrame;
    ZGBook* book=DetailFrame.book;
    
    self.bookSummary.text=[NSString stringWithFormat:@"   %@",book.summary];
    self.bookSummary.frame=DetailFrame.bookSummaryF;
    self.bookSummary.font=summaryFont;
    
    [self.BookInfoBtn setTitle:@"书籍信息" forState:UIControlStateNormal];
    [self.BookInfoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.BookInfoBtn.frame=DetailFrame.bookInfoBtnF;
    [self.BookInfoBtn setFont:[UIFont systemFontOfSize:14]];
    [self.BookInfoBtn setBackgroundImage:[UIImage resizedImageWithName:@"btn3"] forState:UIControlStateNormal];
    
    [self.Frilabel setTitle:@"看过好友" forState:UIControlStateNormal];
    [self.Frilabel setFont:[UIFont systemFontOfSize:14]];
    [self.Frilabel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.Frilabel.frame=DetailFrame.friLabelF;
    [self.Frilabel setBackgroundImage:[UIImage resizedImageWithName:@"tag2"] forState:UIControlStateNormal];
}
@end

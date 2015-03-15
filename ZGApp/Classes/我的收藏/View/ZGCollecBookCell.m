//
//  ZGCollecBookCell.m
//  ZGApp
//
//  Created by Jevons on 15/2/6.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//
//page_user_portraitbackground
#import "ZGCollecBookCell.h"
#import "UIImage+TB.h"
#import "UIImageView+WebCache.h"
@interface ZGCollecBookCell()
@property(nonatomic,weak)UIImageView* bookBG;
@property(nonatomic,weak)UILabel* bookName;
@property(nonatomic,weak)UILabel* bookAuthor;
@property(nonatomic,weak)UILabel* ColTime;
@property(nonatomic,weak)UIImageView* bookView;
@end

@implementation ZGCollecBookCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor=[UIColor clearColor];
        UILabel* ColTime=[[UILabel alloc]init];
        [self.contentView addSubview:ColTime];
        self.ColTime=ColTime;
        
        UIImageView* bookBG=[[UIImageView alloc]init];
        [self.contentView addSubview:bookBG];
        self.bookBG=bookBG;
        
        UIImageView* bookView=[[UIImageView alloc]init];
        [self.bookBG addSubview:bookView];
        self.bookView=bookView;
        
        UILabel* bookName=[[UILabel alloc]init];
        [self.bookBG addSubview:bookName];
        self.bookName=bookName;
        
        
        UILabel * bookAuthor=[[UILabel alloc]init];
        [self.bookBG addSubview:bookAuthor];
        self.bookAuthor=bookAuthor;
        
    }
    return self;
}
-(void)setBookF:(ZGColBookFrame *)bookF
{
    _bookF=bookF;
    
    self.ColTime.textColor=[UIColor whiteColor];
    self.ColTime.text=bookF.book.ColTime;
    self.ColTime.frame=bookF.ColTimeF;
    self.ColTime.font=[UIFont systemFontOfSize:13];
    
    //page_user_portraitbackground 使用失败 替换为btn2
     self.bookBG.image=[UIImage resizedImageWithName:@"btn2"];
    self.bookBG.frame=bookF.BookBgF;
    
    
    [self.bookView setImageWithURL:[NSURL URLWithString:bookF.book.images.small] placeholderImage:[UIImage imageNamed:@"book_blank"]];
    self.bookView.frame=bookF.bookViewF;
    
    self.bookName.text=bookF.book.title;
    self.bookName.frame=bookF.bookNameF;
    
    self.bookAuthor.text=bookF.book.author;
    self.bookAuthor.frame=bookF.bookAuthorF;
    self.bookAuthor.font=[UIFont systemFontOfSize:16];
    
    
}


@end

//
//  ZGBookComCell.m
//  ZGApp
//
//  Created by Jevons on 15/2/8.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGBookComCell.h"
#import "UIImage+TB.h"
@interface ZGBookComCell()
@property(nonatomic,weak)UIImageView* iconView;
@property(nonatomic,weak)UIImageView* titleBg;
@property(nonatomic,weak)UILabel* AuthorLabel;
@property(nonatomic,weak)UIImageView* cmtBG;
@property(nonatomic,weak)UILabel* Coltime;
@property(nonatomic,weak)UILabel* cmtContent;
@property(nonatomic,weak)UILabel* cmtTitle;
@property(nonatomic,weak)UIButton* cmtCount;
@property(nonatomic,weak)UIButton* likeCount;
@property(nonatomic,weak)UIButton* bookName;
@end
@implementation ZGBookComCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor=[UIColor clearColor];
        UILabel* Coltime=[[UILabel alloc]init];
        [self.contentView addSubview:Coltime];
        self.Coltime=Coltime;
        
        UIImageView* cmtBg=[[UIImageView alloc]init];
        [self.contentView addSubview:cmtBg];
        self.cmtBG=cmtBg;
        
        UIImageView* titleBg=[[UIImageView alloc]init];
        [self.cmtBG addSubview:titleBg];
        self.titleBg=titleBg;
        
        UIImageView* iconView=[[UIImageView alloc]init];
        [self.cmtBG addSubview:iconView];
        self.iconView=iconView;
        
      
        UILabel* AuthorLabel=[[UILabel alloc]init];
        [self.cmtBG addSubview:AuthorLabel];
        self.AuthorLabel=AuthorLabel;
        
        UILabel* cmtTitle=[[UILabel alloc]init];
        [self.titleBg addSubview:cmtTitle];
        self.cmtTitle=cmtTitle;
        
        
        UILabel* cmtContent=[[UILabel alloc]init];
        [self.cmtBG addSubview:cmtContent];
        self.cmtContent=cmtContent;
        
        
        UIButton* cmtCount=[[UIButton alloc]init];
        [self.cmtBG addSubview:cmtCount];
        self.cmtCount=cmtCount;
        
        UIButton* likeCount=[[UIButton alloc]init];
        [self.cmtBG addSubview:likeCount];
        self.likeCount=likeCount;
        
        UIButton* bookName=[[UIButton alloc]init];
        [self.cmtBG addSubview:bookName];
        self.bookName=bookName;
        
        
        
    }
    return  self;
}
-(void)setCommentFrame:(ZGBookComFrame *)commentFrame
{
    _commentFrame=commentFrame;
    self.Coltime.textColor=[UIColor whiteColor];
    self.Coltime.font=[UIFont systemFontOfSize:13];
    self.Coltime.text=[NSString stringWithFormat:@"%lld",commentFrame.comment.comment_time];
    self.Coltime.frame=commentFrame.ColTimeF;
    
    self.cmtBG.frame=commentFrame.CommentBgF;
    self.cmtBG.image=[UIImage resizedImageWithName:@"btn2"];
    
    self.iconView.frame=commentFrame.iconViewF;
    self.iconView.image=[UIImage imageNamed:@"user2"];
    
    self.AuthorLabel.text=commentFrame.comment.send_name;
    self.AuthorLabel.font=[UIFont systemFontOfSize:16];
    self.AuthorLabel.frame=commentFrame.AuthorF;
 
    if (commentFrame.comment.title) {

        self.cmtTitle.text=commentFrame.comment.title;
        CGFloat titleW=commentFrame.commentTitleF.size.width;
        CGFloat titleH=commentFrame.commentTitleF.size.height;
        self.cmtTitle.frame=CGRectMake(5, 0, titleW, titleH);
        self.cmtTitle.font=[UIFont systemFontOfSize:16];
       
        
        self.titleBg.frame=commentFrame.commentTitleF;
        self.titleBg.image=[UIImage resizedImageWithName:@"shuping_title"];
        self.titleBg.hidden=NO;
    }
    else{
        self.titleBg.hidden=YES;
    }
    self.cmtContent.frame=commentFrame.contentF;
    self.cmtContent.text=commentFrame.comment.content;
    self.cmtContent.font=[UIFont systemFontOfSize:16];
    self.cmtContent.numberOfLines=2;
    
    self.cmtCount.font=[UIFont systemFontOfSize:13];
    self.cmtCount.frame=commentFrame.Comment_countF;
    [self.cmtCount setTitle:[NSString stringWithFormat:@"  %lld",commentFrame.comment.comment_count] forState:UIControlStateNormal];
    [self.cmtCount setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.cmtCount setImage:[UIImage imageNamed:@"shuping_pinglun"] forState:UIControlStateNormal];
    
    self.likeCount.font=[UIFont systemFontOfSize:13];
    self.likeCount.frame=commentFrame.Like_countF;
    [self.likeCount setTitle:[NSString stringWithFormat:@"  %lld",commentFrame.comment.like_count] forState:UIControlStateNormal];
    [self.likeCount setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.likeCount setImage:[UIImage imageNamed:@"shuping_zan"] forState:UIControlStateNormal];
    
    self.bookName.font=[UIFont systemFontOfSize:13];
    self.bookName.frame=commentFrame.bookNameF;
    [self.bookName setTitle:commentFrame.comment.book_name forState:UIControlStateNormal];
    [self.bookName setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];

    
}

@end

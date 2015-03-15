//
//  TBFriTableViewCell.m
//  TestBooking
//
//  Created by Jevons on 14/12/15.
//  Copyright (c) 2014年 Jevons. All rights reserved.
//

#import "TBFriTableViewCell.h"
#import "TBCellModel.h"
#import "UIImage+TB.h"
#import "TBCategoryBtn.h"
#define gap 3
@interface TBFriTableViewCell()

@property(nonatomic,weak)UIImageView* bookpicView;
@property(nonatomic,weak)UILabel* authorLabel;
@property(nonatomic,weak)TBCategoryBtn* categoryBtn;
@property(nonatomic,weak)UILabel* friendnameLabel;
@property(nonatomic,weak)UILabel* booknameLabel;
@property(nonatomic,weak)UIButton* firView;
@end
@implementation TBFriTableViewCell
+(instancetype)cellWithTable:(UITableView *)tableView
{
    static NSString* ID=@"fri";
    TBFriTableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[TBFriTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    return cell;
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
       
        [self setup];
    }
    return self;
}

-(void)setup
{
   
    
    
    UIImageView* bookpic=[[UIImageView alloc]init];
//    [bookpic setImage:[UIImage imageNamed:@"bookpic"]];
    [self addSubview:bookpic];
    self.bookpicView= bookpic;
    
    UILabel* bookname=[[UILabel alloc]init];
    bookname.text=@"解忧杂货店";
    bookname.font=[UIFont systemFontOfSize:15];
    [self addSubview:bookname];
    self.booknameLabel=bookname;
    
    UILabel* authorname=[[UILabel alloc]init];
    authorname.textColor=[UIColor grayColor];
    authorname.font=[UIFont systemFontOfSize:16];
    [self addSubview:authorname];
    self.authorLabel=authorname;
    
    UIButton* friView=[[UIButton alloc]init];
    [friView setTitle:@"看过好友" forState:UIControlStateNormal];
    [friView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    friView.titleLabel.font=[UIFont systemFontOfSize:12];
    [friView setBackgroundImage:[UIImage resizedImageWithName:@"tag2_circle"] forState:UIControlStateNormal];
    [self addSubview:friView];
    friView.enabled=NO;
    self.firView=friView;
    
    UILabel* friname=[[UILabel alloc]init];
    friname.font=[UIFont systemFontOfSize:15];
    friname.textColor=[UIColor grayColor];
    [self addSubview:friname];
    self.friendnameLabel=friname;
    
//    UIButton* category=[[UIButton alloc]init];
//    category.titleLabel.font=[UIFont systemFontOfSize:12];
//    category.userInteractionEnabled=NO;
////    [self.categoryBtn setTitle:@"0" forState:UIControlStateNormal];
//    category.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
//    [category setBackgroundImage:[UIImage resizedImageWithName:@"tag1_circle"] forState:UIControlStateNormal];
   
    TBCategoryBtn* category=[[TBCategoryBtn alloc]init];
   [self addSubview:category];
    self.categoryBtn= category;
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGSize booknameSize=(CGSize)[self.booknameLabel.text sizeWithFont:[UIFont systemFontOfSize:15]];
    self.booknameLabel.frame=(CGRect){{80,gap},booknameSize};
    
   
    CGFloat authorX=80;
    CGFloat authorY=CGRectGetMaxY(self.booknameLabel.frame)+gap;
    CGSize authorSize=(CGSize)[self.cellmodel.author sizeWithFont:[UIFont systemFontOfSize:16]];
    self.authorLabel.frame=(CGRect){{authorX,authorY},authorSize};
    
    CGFloat friViewX=80;
    CGFloat friViewY=CGRectGetMaxY(self.authorLabel.frame)+gap+2;
    NSString* str=@"看过好友";
    CGSize friViewSize=(CGSize)[str sizeWithFont:[UIFont systemFontOfSize:14]];
    
    self.firView.frame=(CGRect){{friViewX,friViewY},friViewSize};
    
    CGFloat friendnameLabelX=CGRectGetMaxX(self.firView.frame)+gap;
    CGFloat friendnameLabelY=friViewY;
    CGSize friendnameLabelSize=(CGSize)[self.friendnameLabel.text sizeWithFont:[UIFont systemFontOfSize:15]];
    self.friendnameLabel.frame=(CGRect){{friendnameLabelX,friendnameLabelY},friendnameLabelSize};
   
//    CGFloat categoryY=gap+5;
//    NSString* st=@"10";
//    CGSize categorySize=(CGSize)[st sizeWithFont:[UIFont systemFontOfSize:12]];
//    CGFloat categoryX=270;
//    CGFloat categoryW=categorySize.width;
//    CGFloat categoryH=categorySize.height;
//    self.categoryBtn.frame=CGRectMake(categoryX, categoryY, categoryW, categoryH);
    
//    self.categoryBtn.frame=CGRectMake(260, gap, 50, 20);
   
    
}

-(void)setCellmodel:(TBCellModel *)cellmodel
{
    _cellmodel=cellmodel;
    self.imageView.image=[UIImage imageNamed:cellmodel.bookpic];
//    self.bookpicView.image=[UIImage imageNamed:cellmodel.bookpic];
    self.booknameLabel.text=cellmodel.bookname;
    self.authorLabel.text=cellmodel.author;
    int count=cellmodel.friendname.count;
    if (count>1) {
        self.friendnameLabel.text=[NSString stringWithFormat:@"%@等%d位",cellmodel.friendname[0],count];
    }
    else{
       self.friendnameLabel.text=cellmodel.friendname[0];
    }
//    [self.categoryBtn setTitle:cellmodel.category forState:UIControlStateNormal];
    self.categoryBtn.category=cellmodel.category;
    CGFloat categoryY = gap;
    CGFloat categoryX = self.frame.size.width - self.categoryBtn.frame.size.width - 20;
    CGRect badgeF = self.categoryBtn.frame;
    badgeF.origin.x = categoryX;
    badgeF.origin.y = categoryY;
    self.categoryBtn.frame = badgeF;
}


@end

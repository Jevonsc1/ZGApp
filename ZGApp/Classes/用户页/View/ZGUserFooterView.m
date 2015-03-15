//
//  ZGUserFooterView.m
//  ZGApp
//
//  Created by T on 15/3/4.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGUserFooterView.h"
#import "ZGUserTwoShelf.h"
#import "ZGUserOneShelf.h"
#import "ZGBook.h"
#import "UIImageView+WebCache.h"
#import "UIImage+TB.h"
#define shelfHight 140
#define btnGap 15
#define topGap 20
@interface ZGUserFooterView()
@property(nonatomic,weak)UILabel* toplabel;
@property(nonatomic,weak)UIButton* AllBtn;
@property(nonatomic,weak)UIButton* CmtBtn;
@property(nonatomic,strong)NSMutableArray* shelfArray;
@end
@implementation ZGUserFooterView

-(NSMutableArray *)shelfArray{
    if (_shelfArray==nil) {
        _shelfArray=[NSMutableArray array];
    }
    return _shelfArray;
}

-(void)setBookArray:(NSMutableArray *)bookArray
{
    _bookArray=bookArray;
    self.backgroundColor=[UIColor whiteColor];
    int colNum;
    int lastColNum;
    int rowNum;
    UILabel* toplabel=[[UILabel alloc]init];
    toplabel.text=@"可借阅书籍";
    toplabel.font=[UIFont systemFontOfSize:10];
    self.toplabel=toplabel;
    [self addSubview:toplabel];
    
    if (ScreenviewWidth==414)
    {
        colNum=4;
        lastColNum=(int)(bookArray.count-1)%colNum;
       
        rowNum=(int)(bookArray.count-1)/colNum+1;
      
        
         for (int i=0; i<rowNum; i++)
        {
           
            if (i!= rowNum-1) {
                [self addTwoshelfWithI:i bookArray:bookArray];
            }
            else{
                [self addTwoshelfWithLast:lastColNum i:i bookArray:bookArray];
            }
            
        }
        
    }
    else{
            colNum=3;
            lastColNum=(int)(bookArray.count-1)%colNum;
        
           rowNum=(int)(bookArray.count-1)/colNum+1;
    
        for (int i=0; i<rowNum; i++)
        {
            
            if (i!= rowNum-1) {
                [self addOneshelfWithI:i bookArray:bookArray];
            }
            else{
                [self addOneshelfWithLast:lastColNum i:i bookArray:bookArray];
            }
            
        }
        
        
    }
        
    UIButton* Allbtn=[[UIButton alloc]init];
    [Allbtn setTitle:@"全部订单" forState:UIControlStateNormal];
    [Allbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [Allbtn setBackgroundImage:[UIImage resizedImageWithName:@""] forState:UIControlStateNormal];
    
    self.AllBtn=Allbtn;
    [self addSubview:Allbtn];
    
    UIButton* Cmtbtn=[[UIButton alloc]init];
    [Cmtbtn setTitle:@"全部评论" forState:UIControlStateNormal];
    [Cmtbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [Cmtbtn setBackgroundImage:[UIImage resizedImageWithName:@""] forState:UIControlStateNormal];
    
    self.CmtBtn=Cmtbtn;
    [self addSubview:Cmtbtn];
    
    CGFloat shelfMaxY;
    if ([self.shelfArray[0] isKindOfClass:[ZGUserOneShelf class]]) {
        ZGUserOneShelf* shelf=[self.shelfArray lastObject];
        shelfMaxY =CGRectGetMaxY(shelf.frame)+30;
    }
    else{
        ZGUserTwoShelf* shelf=[self.shelfArray lastObject];
        shelfMaxY =CGRectGetMaxY(shelf.frame)+30;
    }
    
    CGFloat btnW=(ScreenviewWidth-3*btnGap)/2;
    self.AllBtn.frame=CGRectMake(btnGap, shelfMaxY, btnW, 30);
    self.CmtBtn.frame=CGRectMake(btnGap*2+btnW, shelfMaxY, btnW, 30);
    
    self.viewHeight=CGRectGetMaxY(self.AllBtn.frame)+20;
}

-(void)addTwoshelfWithI:(int)i  bookArray:(NSMutableArray*)array{
    NSArray* xibArray=[[NSBundle mainBundle] loadNibNamed:@"ZGUserTwoShelf" owner:nil options:nil];
    ZGUserTwoShelf* shelf=[xibArray firstObject];
    ZGBook* book1=array[i*4];
    [shelf.bookView1 setImageWithURL:[NSURL URLWithString:book1.images.small] placeholderImage:[UIImage imageNamed:@"book_blank"]] ;
    shelf.bookName1.text=book1.title;
   

    ZGBook* book2=array[i*4+1];
    [shelf.bookView2 setImageWithURL:[NSURL URLWithString:book2.images.small] placeholderImage:[UIImage imageNamed:@"book_blank"]] ;
    shelf.bookName2.text=book2.title;
 
    
    ZGBook* book3=array[i*4+2];
    [shelf.bookView3 setImageWithURL:[NSURL URLWithString:book3.images.small] placeholderImage:[UIImage imageNamed:@"book_blank"]] ;
    shelf.bookName3.text=book3.title;
    
    
    ZGBook* book4=array[i*4+3];
    [shelf.bookView4 setImageWithURL:[NSURL URLWithString:book4.images.small] placeholderImage:[UIImage imageNamed:@"book_blank"]] ;
    shelf.bookName4.text=book4.title;
    
    shelf.bookshelfView.image=[UIImage resizedImageWithName:@""];
    shelf.frame=CGRectMake(0, i*shelfHight+topGap, self.frame.size.width, shelfHight);
    [self.shelfArray addObject:shelf];
    [self addSubview:shelf];
}


-(void)addTwoshelfWithLast:(int)last i:(int)i bookArray:(NSMutableArray*)array{
    NSArray* xibArray=[[NSBundle mainBundle] loadNibNamed:@"ZGUserTwoShelf" owner:nil options:nil];
    ZGUserTwoShelf* shelf=[xibArray firstObject];
    if (last>-1) {
        ZGBook* book1=array[i*4];
        [shelf.bookView1 setImageWithURL:[NSURL URLWithString:book1.images.small] placeholderImage:[UIImage imageNamed:@"book_blank"]] ;
        shelf.bookName1.text=book1.title;
    }
    
    
    if (last>0) {
        ZGBook* book2=array[i*4+1];
    [shelf.bookView2 setImageWithURL:[NSURL URLWithString:book2.images.small] placeholderImage:[UIImage imageNamed:@"book_blank"]] ;
    shelf.bookName2.text=book2.title;
    
    }
    
    if (last>1) {
    
    ZGBook* book3=array[i*4+2];
    [shelf.bookView3 setImageWithURL:[NSURL URLWithString:book3.images.small] placeholderImage:[UIImage imageNamed:@"book_blank"]] ;
    shelf.bookName3.text=book3.title;
  
    }
    if (last>2) {
  
    ZGBook* book4=array[i*4+3];
    [shelf.bookView4 setImageWithURL:[NSURL URLWithString:book4.images.small] placeholderImage:[UIImage imageNamed:@"book_blank"]] ;
    shelf.bookName4.text=book4.title;
    }
    shelf.bookshelfView.image=[UIImage resizedImageWithName:@""];
    shelf.frame=CGRectMake(0, i*shelfHight+topGap, self.frame.size.width, shelfHight);
    [self.shelfArray addObject:shelf];
    
    [self addSubview:shelf];
}


-(void)addOneshelfWithI:(int)i  bookArray:(NSMutableArray*)array{
    NSArray* xibArray=[[NSBundle mainBundle] loadNibNamed:@"ZGUserOneShelf" owner:nil options:nil];
    ZGUserOneShelf* shelf=[xibArray firstObject];
    ZGBook* book1=array[i*3];
    [shelf.bookView1 setImageWithURL:[NSURL URLWithString:book1.images.small] placeholderImage:[UIImage imageNamed:@"book_blank"]] ;
    shelf.bookName1.text=book1.title;
    
    
    
    ZGBook* book2=array[i*3+1];
    [shelf.bookView2 setImageWithURL:[NSURL URLWithString:book2.images.small] placeholderImage:[UIImage imageNamed:@"book_blank"]] ;
    shelf.bookName2.text=book2.title;
    
    
    ZGBook* book3=array[i*3+2];
    [shelf.bookView3 setImageWithURL:[NSURL URLWithString:book3.images.small] placeholderImage:[UIImage imageNamed:@"book_blank"]] ;
    shelf.bookName3.text=book3.title;
    
    
    shelf.bookShelfView.image=[UIImage resizedImageWithName:@"page_user_bookshelf"];
    shelf.frame=CGRectMake(0, i*shelfHight+topGap, self.frame.size.width, shelfHight);
    [self.shelfArray addObject:shelf];
    [self addSubview:shelf];
}


-(void)addOneshelfWithLast:(int)last i:(int)i bookArray:(NSMutableArray*)array{
    NSArray* xibArray=[[NSBundle mainBundle] loadNibNamed:@"ZGUserOneShelf" owner:nil options:nil];
    ZGUserOneShelf* shelf=[xibArray firstObject];
    if (last>-1) {
        ZGBook* book1=array[i*3];
        [shelf.bookView1 setImageWithURL:[NSURL URLWithString:book1.images.small] placeholderImage:[UIImage imageNamed:@"book_blank"]] ;
        shelf.bookName1.text=book1.title;
    }
    
    
    if (last>0) {
        ZGBook* book2=array[i*3+1];
        [shelf.bookView2 setImageWithURL:[NSURL URLWithString:book2.images.small] placeholderImage:[UIImage imageNamed:@"book_blank"]] ;
        shelf.bookName2.text=book2.title;
        
    }
    
    if (last>1) {
        
        ZGBook* book3=array[i*3+2];
        [shelf.bookView3 setImageWithURL:[NSURL URLWithString:book3.images.small] placeholderImage:[UIImage imageNamed:@"book_blank"]] ;
        shelf.bookName3.text=book3.title;
        
    }
   
    shelf.bookShelfView.image=[UIImage resizedImageWithName:@"page_user_bookshelf"];
    shelf.frame=CGRectMake(0, i*shelfHight+topGap, self.frame.size.width, shelfHight);
    [self.shelfArray addObject:shelf];
    
    [self addSubview:shelf];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.toplabel.frame=CGRectMake(5, 0, 50, 20);
    
    
    
}
@end

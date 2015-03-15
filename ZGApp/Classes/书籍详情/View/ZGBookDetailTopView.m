//
//  ZGBookDetailTopView.m
//  ZGApp
//
//  Created by Jevons on 15/1/26.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGBookDetailTopView.h"
#import "UIImage+ImageEffects.h"

#import "ZGBookDetailBtnView.h"
#import "UIImageView+WebCache.h"
#import "ZGBookTag.h"
#import "ZGTagRect.h"
#import "UIImage+TB.h"
@interface ZGBookDetailTopView()
@property(nonatomic,weak)UIImageView* bookView;
@property(nonatomic,weak)UILabel* bookTitle;
@property(nonatomic,strong)NSMutableArray* tagArray;
@property(nonatomic,weak)UILabel* publishLabel;
@property(nonatomic,weak)ZGBookDetailBtnView* btnView;
@end
@implementation ZGBookDetailTopView
-(NSMutableArray *)tagArray
{
    if (_tagArray==nil) {
        _tagArray=[NSMutableArray array];
    }
    return _tagArray;
}
-(void)setDetailframe:(ZGBookDetailFrame *)Detailframe
{
    _Detailframe=Detailframe;
//    [self setImageWithURL:[NSURL URLWithString: Detailframe.book.images.small]];
//    self.image=[self.image applyBlurWithRadius:BlurWithRadius tintColor:[UIColor clearColor] saturationDeltaFactor:2.0f maskImage:nil];
    self.backgroundColor=[UIColor clearColor];
    [self setupTopView];
    
    
}
-(void)setupTopView
{
    ZGBook* book=self.Detailframe.book;

    
    self.bookView.frame=self.Detailframe.bookImageViewF;
    [self.bookView setImageWithURL:[NSURL URLWithString:book.images.small]];
    
    self.bookTitle.frame=self.Detailframe.bookTitleF;
    self.bookTitle.text=book.title;
    
    for (int i=0; i<book.tags.count; i++) {
        ZGTagRect* rect=self.Detailframe.tagsViewFArray[i];
        ZGBookTag* tagname=book.tags[i];
        UIButton* tag=[[UIButton alloc]init];
        [tag setTitle:tagname.name forState:UIControlStateNormal];
        [tag setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        tag.frame=CGRectMake(rect.tagX, rect.tagY, rect.tagW, rect.tagH);
        [tag setBackgroundImage:[UIImage resizedImageWithName:@"btn4" left:0.45 top:0.5] forState:UIControlStateNormal];
        [tag setFont:[UIFont systemFontOfSize:14]];
        [self addSubview:tag];
    }
    
    self.publishLabel.frame=self.Detailframe.publisherLabelF;
    self.publishLabel.text=book.publisher;
    self.publishLabel.font=[UIFont systemFontOfSize:14];
    
    
    self.frame=self.Detailframe.topViewF;
    
    
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.userInteractionEnabled=YES;
        
        UIImageView* bookview=[[UIImageView alloc]init];
        [self addSubview:bookview];
        self.bookView=bookview;
        
        UILabel* bookTitle=[[UILabel alloc]init];
        [self addSubview:bookTitle];
        self.bookTitle=bookTitle;
        
        UILabel* publishLabel=[[UILabel alloc]init];
        [self addSubview:publishLabel];
        self.publishLabel=publishLabel;
    }
    return self;
}


@end

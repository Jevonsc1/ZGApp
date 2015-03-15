//
//  ZGBookDetailBtnView.m
//  ZGApp
//
//  Created by Jevons on 15/1/26.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGBookDetailBtnView.h"
#import "UIImage+TB.h"
#import "UIImageView+WebCache.h"
#import "UIImage+ImageEffects.h"
@interface ZGBookDetailBtnView()
@property(nonatomic,strong)NSMutableArray* btnArray;
@end

@implementation ZGBookDetailBtnView
-(void)setBook:(ZGBook *)book
{
    _book=book;
//    [self setImageWithURL:[NSURL URLWithString:book.images.small]];
//    self.image=[self.image applyBlurWithRadius:BlurWithRadius tintColor:[UIColor clearColor] saturationDeltaFactor:2.0 maskImage:nil];
    self.backgroundColor=[UIColor clearColor];
}

-(NSMutableArray *)btnArray
{
    if (_btnArray==nil) {
        _btnArray=[NSMutableArray array];
    }
    return _btnArray;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor=[UIColor clearColor];
        self.userInteractionEnabled=YES;
        UIButton* btn1=[[UIButton alloc]init];
        [btn1 setTitle:@"借阅" forState:UIControlStateNormal];
        btn1.titleLabel.font=[UIFont systemFontOfSize:13];
        [btn1 setBackgroundImage:[UIImage resizedImageWithName:@"btn1"] forState:UIControlStateNormal];
        [self addSubview:btn1];
        [self.btnArray addObject:btn1];
        
        UIButton* btn2=[[UIButton alloc]init];
        [btn2 setTitle:@"我已经看过" forState:UIControlStateNormal];
        [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn2.titleLabel.font=[UIFont systemFontOfSize:13];
        [btn2 setBackgroundImage:[UIImage resizedImageWithName:@"btn2"] forState:UIControlStateNormal];
        [self addSubview:btn2];
        [self.btnArray addObject:btn2];
        
        
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger btnCount=self.btnArray.count;
    CGFloat btnW=(self.frame.size.width-(btnCount+1)*BookDetailGap)/btnCount;
    CGFloat btnY=15;
    CGFloat btnH=self.frame.size.height-2*btnY;
    
    for (int i=0; i<btnCount; i++) {
        UIButton* btn=self.btnArray[i];
        CGFloat btnX=i*(btnW+BookDetailGap)+BookDetailGap;
        btn.frame=CGRectMake(btnX, btnY, btnW, btnH);
    }
   
}

@end

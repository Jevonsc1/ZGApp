//
//  ZGSegementView.m
//  ZGApp
//
//  Created by Jevons on 15/1/26.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGSegementView.h"
#import "UIImage+TB.h"
#define bottomViewHight 4
@interface ZGSegementView()
@property(nonatomic,weak)UIButton* curBtn;
@property(nonatomic,weak)UIButton* bottomView1;
@property(nonatomic,weak)UIButton* bottomView2;
@property(nonatomic,strong)NSMutableArray* btnArray;
@property(nonatomic,strong)NSMutableArray* dividerArray;
@property(nonatomic,weak)UIButton* bottomView;
@property(nonatomic,weak)UIButton* bookBtn;
@property(nonatomic,weak)UIButton* userBtn;
@end
@implementation ZGSegementView

-(NSMutableArray*)btnArray
{
    if (_btnArray==nil) {
        _btnArray=[NSMutableArray array];
    }
    return _btnArray;
}
-(NSMutableArray*)dividerArray
{
    if (_dividerArray==nil) {
        _dividerArray=[NSMutableArray array];
    }
    return _dividerArray;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor=[UIColor whiteColor];
        self.userInteractionEnabled=YES;
        self.bookBtn= [self addBtnTitle:@"书籍" btnTag:0];
        [self.bookBtn addTarget:self action:@selector(bookBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        self.userBtn= [self addBtnTitle:@"用户" btnTag:1];
        [self.userBtn addTarget:self action:@selector(userBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addDivider];
        [self addDivider];
        [self addButtomView];
        [self bookBtnClick:self.bookBtn];
    }
    return self;
}
-(void)bookBtnClick:(UIButton*)btn;
{
    [self.curBtn setSelected:NO];
    [self.bookBtn setSelected:YES];
    self.curBtn=self.bookBtn;
    
    self.bottomView1.backgroundColor=Blue;
    self.bottomView2.backgroundColor=JWColor(216, 216, 216);
    
    if ([self.delegate respondsToSelector:@selector(segView:btnTag:)]) {
        [self.delegate segView:self btnTag:btn.tag];
    }
}
-(void)userBtnClick:(UIButton*)btn;
{
    
    [self.curBtn setSelected:NO];
    [self.userBtn setSelected:YES];
    self.curBtn=self.userBtn;
    
    self.bottomView1.backgroundColor=JWColor(216, 216, 216);
    self.bottomView2.backgroundColor=Blue;
    
    if ([self.delegate respondsToSelector:@selector(segView:btnTag:)]) {
        [self.delegate segView:self btnTag:btn.tag];
    }
}
-(void)addButtomView
{
    UIButton* bottomView=[[UIButton alloc]init];
    bottomView.userInteractionEnabled=NO;
    bottomView.backgroundColor=JWColor(216, 216, 216);
    [self addSubview:bottomView];
    self.bottomView=bottomView;
    
    CGFloat distance=self.frame.size.width/2.0;
    CGFloat bottomW=100;
    CGFloat bottomX=(ScreenviewWidth-2*bottomW)/4.0;
    
    UIButton* bottomSubView1=[[UIButton alloc]init];
    bottomSubView1.userInteractionEnabled=NO;
    bottomSubView1.backgroundColor=JWColor(66, 181, 247);
    bottomSubView1.frame=CGRectMake(bottomX, 0, bottomW, bottomViewHight);
    [self.bottomView addSubview:bottomSubView1];
    self.bottomView1=bottomSubView1;
    
    
    UIButton* bottomSubView2=[[UIButton alloc]init];
    bottomSubView2.userInteractionEnabled=NO;
    bottomSubView2.backgroundColor=JWColor(216, 216, 216);
    bottomSubView2.frame=CGRectMake(bottomX+distance, 0, bottomW, bottomViewHight);
    [self.bottomView addSubview:bottomSubView2];
    self.bottomView2=bottomSubView2;
}

-(UIButton*)addBtnTitle:(NSString*)title btnTag:(int)btnTag
{
    UIButton* btn=[[UIButton alloc]init];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateHighlighted];
    btn.titleLabel.font=[UIFont systemFontOfSize:13];
    btn.adjustsImageWhenHighlighted=NO;
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:Blue forState:UIControlStateSelected];
    btn.titleEdgeInsets= UIEdgeInsetsMake(0, 10, 0, 0);
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    btn.tag=btnTag;
    [self.btnArray addObject:btn];
    [self addSubview:btn];
    return btn;
}
-(void)addDivider
{
    UIImageView* divider=[[UIImageView alloc]init];
    [divider setImage:[UIImage imageNamed:@"tag2_middle"]];
    [self.dividerArray addObject:divider];
    [self addSubview:divider];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    NSInteger btnCount=self.btnArray.count;
    CGFloat btnW=self.frame.size.width/btnCount;
    CGFloat btnH=self.frame.size.height;
    CGFloat btnY=0;
    for (int i=0; i<btnCount; i++) {
        UIButton* btn=self.btnArray[i];
        CGFloat btnX=i*btnW;
        btn.frame=CGRectMake(btnX, btnY, btnW, btnH);
    }
    
    NSInteger dividerCount=self.dividerArray.count;
    for (int  i=0; i<dividerCount; i++) {
        UIImageView* divider=self.dividerArray[i];
        CGFloat dividerX=(i+1)*btnW;
        divider.frame=CGRectMake(dividerX, btnY+10, 1, 20);
        
    }
    CGFloat viewX=0;
    CGFloat viewY=self.frame.size.height-bottomViewHight;
    CGFloat viewH=bottomViewHight;
    CGFloat viewW=self.frame.size.width;
    self.bottomView.frame=CGRectMake(viewX, viewY, viewW, viewH);
    
}
@end

//
//  ZGMySegView.m
//  ZGApp
//
//  Created by Jevons on 15/2/2.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGMySegView.h"
#import "UIImage+TB.h"
#define bottomViewHight 4
@interface ZGMySegView()
@property(nonatomic,strong)NSMutableArray* btnArray;
@property(nonatomic,strong)NSMutableArray* dividerArray;
@property(nonatomic,weak)UIButton* bottomView;
@property(nonatomic,weak)UIButton* bookBtn;
@property(nonatomic,weak)UIButton* userBtn;
@property(nonatomic,weak)UIButton* curBtn;
@property(nonatomic,weak)UIButton* bottomSubView1;
@property(nonatomic,weak)UIButton* bottomSubView2;
@property(nonatomic,weak)UIView* topView;
@property(nonatomic,weak)UIView* botView;
@end

@implementation ZGMySegView
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
        
        UIView* topView=[[UIView alloc]init];
        topView.backgroundColor=[UIColor whiteColor];
        self.topView=topView;
        [self addSubview:topView];
        
        UIView* bottomView=[[UIView alloc]init];
        bottomView.backgroundColor=[UIColor whiteColor];
        self.botView=bottomView;
        [self addSubview:bottomView];
        
        self.bookBtn= [self addBtnTitle:@"我的书单"];
        self.bookBtn.tag=1;
        self.userBtn= [self addBtnTitle:@"我的订单"];
        self.userBtn.tag=2;
        [self.bookBtn addTarget:self action:@selector(bookBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.userBtn addTarget:self action:@selector(userBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        [self addDivider];
        [self addDivider];
        [self addButtomView];
        [self bookBtnClick:self.bookBtn];
    }
    return self;
}
-(void)addButtomView
{
    UIButton* bottomView=[[UIButton alloc]init];
    bottomView.userInteractionEnabled=NO;
    bottomView.backgroundColor=JWColor(216, 216, 216);
    [self.botView addSubview:bottomView];
    self.bottomView=bottomView;
    
    CGFloat distance=self.frame.size.width/2.0;
    
    UIButton* bottomSubView1=[[UIButton alloc]init];
    bottomSubView1.userInteractionEnabled=NO;
    bottomSubView1.backgroundColor=JWColor(66, 181, 247);
    bottomSubView1.frame=CGRectMake((self.frame.size.width-200)*0.25, 0, 100, bottomViewHight);
    [self.bottomView addSubview:bottomSubView1];
    self.bottomSubView1=bottomSubView1;
    
    
    UIButton* bottomSubView2=[[UIButton alloc]init];
    bottomSubView2.userInteractionEnabled=NO;
    bottomSubView2.backgroundColor=JWColor(216, 216, 216);
    bottomSubView2.frame=CGRectMake((self.frame.size.width-200)*0.25+distance, 0, 100, bottomViewHight);
    [self.bottomView addSubview:bottomSubView2];
    self.bottomSubView2=bottomSubView2;
}

-(UIButton*)addBtnTitle:(NSString*)title
{
    UIButton* btn=[[UIButton alloc]init];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font=[UIFont systemFontOfSize:13];
    btn.adjustsImageWhenHighlighted=NO;
    [btn setTitleColor:JWColor(66, 181, 247) forState:UIControlStateSelected];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleEdgeInsets= UIEdgeInsetsMake(0, 10, 0, 0);
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    [self.btnArray addObject:btn];
    [self.botView addSubview:btn];
    return btn;
}
-(void)addDivider
{
    UIImageView* divider=[[UIImageView alloc]init];
    [divider setImage:[UIImage imageNamed:@"tag2_middle"]];
    [self.dividerArray addObject:divider];
    [self.botView addSubview:divider];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
    
    self.topView.frame=CGRectMake(0, 0, self.frame.size.width, 40);
    self.botView.frame=CGRectMake(0, CGRectGetMaxY(self.topView.frame), self.frame.size.width, 45);
    
    
    NSInteger btnCount=self.btnArray.count;
    CGFloat btnW=self.frame.size.width/btnCount;
    CGFloat btnH=self.botView.frame.size.height;
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
    CGFloat viewY=self.botView.frame.size.height-bottomViewHight;
    CGFloat viewH=bottomViewHight;
    CGFloat viewW=self.frame.size.width;
    self.bottomView.frame=CGRectMake(viewX, viewY, viewW, viewH);
    
}

-(void)bookBtnClick:(UIButton*)btn
{
    [self.curBtn setSelected:NO];
    [btn setSelected:YES];
    self.curBtn=btn;
    
    self.bottomSubView1.backgroundColor=JWColor(66, 181, 247);
    self.bottomSubView2.backgroundColor=JWColor(216, 216, 216);
    if ([self.delegate respondsToSelector:@selector(ZGMySegView:btn:)]) {
        [self.delegate ZGMySegView:self btn:btn.tag];
    }
}
-(void)userBtnClick:(UIButton*)btn
{
    [self.curBtn setSelected:NO];
    [btn setSelected:YES];
    
    
    self.bottomSubView2.backgroundColor=JWColor(66, 181, 247);
    self.bottomSubView1.backgroundColor=JWColor(216, 216, 216);
    if ([self.delegate respondsToSelector:@selector(ZGMySegView:btn:)]) {
        [self.delegate ZGMySegView:self btn:btn.tag];
    }
    self.curBtn=btn;
}


@end

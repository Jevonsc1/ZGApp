//
//  ZGColBottomView.m
//  ZGApp
//
//  Created by Jevons on 15/2/6.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGColBottomView.h"
@interface ZGColBottomView()
@property(nonatomic,weak)UIButton* seleAllBtn;
@property(nonatomic,weak)UIButton* deleBtn;
@end
@implementation ZGColBottomView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]){
        self.backgroundColor=[UIColor whiteColor];
        self.userInteractionEnabled=YES;
        
        UIButton* selectAllBtn=[[UIButton alloc]init];
        [selectAllBtn setTitle:@"全选" forState:UIControlStateNormal];
        [selectAllBtn setTitleColor:Blue forState:UIControlStateNormal];
        [selectAllBtn addTarget:self action:@selector(seleAllClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:selectAllBtn];
        self.seleAllBtn=selectAllBtn;
        
        UIButton* deleBtn=[[UIButton alloc]init];
        [deleBtn setTitle:@"删除" forState:UIControlStateNormal];
        [deleBtn setTitleColor:Blue forState:UIControlStateNormal];
        [deleBtn addTarget:self action:@selector(deleClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:deleBtn];
        self.deleBtn=deleBtn;
        
        
    }
    return self;
}
-(void)seleAllClick
{
    if ([self.delegate respondsToSelector:@selector(bottomViewWithSeleAll:)]) {
        [self.delegate bottomViewWithSeleAll:self];
    }
}

-(void)deleClick
{
    if ([self.delegate respondsToSelector:@selector(bottomViewWithDele:)]) {
        [self.delegate bottomViewWithDele:self];
    }
}
-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat SBtnX=10;
    CGFloat SBtnY=15;
    NSString* ALLstr=@"全选";
    CGSize SBtnSize=[ALLstr sizeWithFont:[UIFont systemFontOfSize:18]];
    self.seleAllBtn.frame=(CGRect){{SBtnX,SBtnY},SBtnSize};
    
    
    NSString* DelStr=@"删除";
    CGSize DBtnSize=[DelStr sizeWithFont:[UIFont systemFontOfSize:18]];
    CGFloat DBtnX=ScreenviewWidth-DBtnSize.width-10;
    CGFloat DBtnY=15;
    self.deleBtn.frame=(CGRect){{DBtnX,DBtnY},DBtnSize};
    
}
@end

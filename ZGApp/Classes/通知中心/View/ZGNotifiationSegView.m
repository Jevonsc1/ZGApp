//
//  ZGNotifiationSegView.m
//  ZGApp
//
//  Created by Jevons on 15/1/29.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGNotifiationSegView.h"
#import "UIImage+TB.h"

@interface ZGNotifiationSegView()
@property(nonatomic,strong)NSMutableArray* btnArray;
@end

@implementation ZGNotifiationSegView
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
        self.backgroundColor=Blue;
        self.userInteractionEnabled=YES;
        
        [self addBtnWithTitle:@"全部"];
        [self addBtnWithTitle:@"订单"];
        [self addBtnWithTitle:@"好友"];
        [self addBtnWithTitle:@"书单"];
        [self addBtnWithTitle:@"书评"];
        [self btnClick:self.btnArray[0]];
        
    }
    return self;
}
-(void)addBtnWithTitle:(NSString*)title
{
    SegmentBtn* btn=[[SegmentBtn alloc]init];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font=[UIFont systemFontOfSize:13];
    [btn setBackgroundImage:nil forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:Blue forState:UIControlStateSelected];
    [btn setBackgroundImage:[UIImage resizedImageWithName:@"btn9"] forState:UIControlStateSelected];
    [self addSubview:btn];
    [self.btnArray addObject:btn];
    
}

-(void)btnClick:(SegmentBtn*)btn
{
    self.curBtn.selected=NO;
    btn.selected=YES;
    
    if ([self.delegate respondsToSelector:@selector(segmentView:button:)]) {
        [self.delegate segmentView:self button:btn.tag];
    }
    self.curBtn=btn;
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger btnCount=self.btnArray.count;
    CGFloat btnW=(self.frame.size.width-(btnCount+1)*BookDetailGap)/btnCount;
    CGFloat btnY=4;
    CGFloat btnH=self.frame.size.height-8;
    
    for (int i=0; i<btnCount; i++) {
        SegmentBtn* btn=self.btnArray[i];
        CGFloat btnX=i*(btnW+BookDetailGap)+BookDetailGap;
        btn.frame=CGRectMake(btnX, btnY, btnW, btnH);
        btn.tag=i;
    }

}
@end

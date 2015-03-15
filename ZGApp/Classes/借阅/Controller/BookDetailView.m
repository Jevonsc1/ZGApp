//
//  TestTableView.m
//  ZGApp
//
//  Created by Jevons on 14/12/20.
//  Copyright (c) 2014年 Jevons. All rights reserved.
//

#import "BookDetailView.h"
@interface BookDetailView()
@property(nonatomic,assign)CGPoint curPos;
@end
@implementation BookDetailView

-(CGPoint)posWithTouches:(NSSet*)touches
{
   UITouch* touch=[touches anyObject];
   CGPoint pos=[touch locationInView:self];
   return pos;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.curPos=CGPointZero;
    NSLog(@"%f",self.curPos.y);
    [self setNeedsDisplay];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint pos=[self posWithTouches:touches];
    self.distance=pos.y;
//    NSLog(@"%f",self.distance);
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint pos=[self posWithTouches:touches];
    NSLog(@"%f",pos.y);
    [self setNeedsDisplay];
}
-(void)drawRect:(CGRect)rect
{
   
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

//
//  ZGOrderView.m
//  ZGApp
//
//  Created by Jevons on 15/2/27.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGOrderView.h"
#import "UIImageView+WebCache.h"
#import "UIImage+TB.h"
#import "ZGOrderSenderFourBottomView.h"
#define OrderBtnGap 15
@interface ZGOrderView()
@property(nonatomic,assign)CGFloat bottomY;

@end


@implementation ZGOrderView
-(void)setOrder:(ZGOrder *)order
{
    _order=order;
    [self.bookView setImageWithURL:[NSURL URLWithString:order.book.images.small] placeholderImage:[UIImage imageNamed:@"book_blank"]];
    self.bookAuthor.text=order.book.author;
    self.bookName.text=order.book.title;
    
    [self mamufature:self.senderIcon];
    [self mamufature:self.reciverIcon];
    
    [self mamufaturePointForProcess:self.PointOne];
    [self mamufaturePoint:self.PointTwo];
    [self mamufaturePoint:self.PointThree];
    [self mamufaturePoint:self.PointFour];
    [self mamufaturePoint:self.PointFive];
    
    [self mamufaturePointForProcess:self.BigPoint1];
    [self mamufaturePointForProcess:self.BigPoint2];
    [self mamufaturePointForProcess:self.BigPoint3];
    [self mamufaturePointForProcess:self.BigPoint4];
    [self mamufaturePointForProcess:self.BigPoint5];
    
    self.LineOne.backgroundColor=JWColor(221, 221, 221);
    self.LineTwo.backgroundColor=JWColor(221, 221, 221);
    self.LineThree.backgroundColor=JWColor(221, 221, 221);
    self.LineFour.backgroundColor=JWColor(221, 221, 221);
    
    self.bottomY=CGRectGetMaxY(self.senderName.frame)+30;
    
    ZGOrderStatusType type=order.status;
    switch (type) {
        case ZGOrderStatusTypeSenderOne:{
            self.TimeOne.text=order.orderDate1;
            self.BigPoint1.hidden=NO;
            
            UIButton* refuseBtn=[[UIButton alloc]init];
            [refuseBtn setTitle:@"拒绝申请" forState:UIControlStateNormal];
            [refuseBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [refuseBtn setBackgroundImage:[UIImage resizedImageWithName:@"page_borrowing_btn_gray"] forState:UIControlStateNormal];
            refuseBtn.titleLabel.font=[UIFont systemFontOfSize:12];
            [self addSubview:refuseBtn];
            
            UIButton *agreeBtn=[[UIButton alloc]init];
            [agreeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [agreeBtn setTitle:@"同意借阅并添加好友" forState:UIControlStateNormal];
            agreeBtn.titleLabel.font=[UIFont boldSystemFontOfSize:12];
            
            [agreeBtn setBackgroundImage:[UIImage resizedImageWithName:@"page_borrowing_btn_orange"] forState:UIControlStateNormal];
            [self addSubview:agreeBtn];
            
            CGFloat btnW=(self.frame.size.width-3*OrderBtnGap)/2;
            CGFloat btnH=30;
            
            refuseBtn.frame=CGRectMake(OrderBtnGap, self.bottomY, btnW, btnH);
            agreeBtn.frame=CGRectMake(OrderBtnGap*2+btnW, self.bottomY, btnW, btnH);
        }
            break;
        case ZGOrderStatusTypeSenderTwo:{
            self.TimeOne.text=order.orderDate1;
            self.TimeTwo.text=order.orderDate2;
            self.BigPoint2.hidden=NO;
            self.StatusTwo.hidden=NO;
            self.StatusTwo.font=[UIFont systemFontOfSize:13];
            self.LineOne.backgroundColor=Blue;
            UIButton* touchBtn=[[UIButton alloc]init];
            [touchBtn setTitle:@"  联系对方" forState:UIControlStateNormal];
            [touchBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [touchBtn setBackgroundImage:[UIImage resizedImageWithName:@"page_borrowing_btn_gray"] forState:UIControlStateNormal];
            touchBtn.titleLabel.font=[UIFont systemFontOfSize:12];
//            [refuseBtn setImage:[UIImage imageNamed:@"shuping_pinglun" ] forState:UIControlStateNormal];
            [self addSubview:touchBtn];
            
            UIButton *lendBtn=[[UIButton alloc]init];
            [lendBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [lendBtn setTitle:@"已借出" forState:UIControlStateNormal];
            lendBtn.titleLabel.font=[UIFont boldSystemFontOfSize:12];
            
            [lendBtn setBackgroundImage:[UIImage resizedImageWithName:@"page_borrowing_btn_orange"] forState:UIControlStateNormal];
            [self addSubview:lendBtn];
            
            CGFloat btnW=(self.frame.size.width-3*OrderBtnGap)/2;
            CGFloat btnH=30;
            
            touchBtn.frame=CGRectMake(OrderBtnGap, self.bottomY, btnW, btnH);
            lendBtn.frame=CGRectMake(OrderBtnGap*2+btnW, self.bottomY, btnW, btnH);
        }
            break;
        case ZGOrderStatusTypeSenderThree:{
            self.TimeOne.text=order.orderDate1;
            self.TimeTwo.text=order.orderDate2;
            self.TimeThree.text=order.orderDate3;
            self.BigPoint3.hidden=NO;
            self.StatusTwo.hidden=NO;
            self.StatusThree.hidden=NO;
            self.StatusThree.font=[UIFont systemFontOfSize:13];
            self.LineOne.backgroundColor=Blue;
            self.LineTwo.backgroundColor=Blue;
            self.senderBadge.hidden=YES;
            self.reciverBadge.hidden=NO;
            [self mamufaturePointForProcess:self.PointTwo];
            
            UIButton* touchBtn=[[UIButton alloc]init];
            [touchBtn setTitle:@"  联系对方" forState:UIControlStateNormal];
            [touchBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [touchBtn setBackgroundImage:[UIImage resizedImageWithName:@"page_borrowing_btn_gray"] forState:UIControlStateNormal];
            touchBtn.titleLabel.font=[UIFont systemFontOfSize:12];
            //            [refuseBtn setImage:[UIImage imageNamed:@"shuping_pinglun" ] forState:UIControlStateNormal];
            [self addSubview:touchBtn];
            CGFloat btnW=(self.frame.size.width-3*OrderBtnGap)/2;
            CGFloat btnH=30;
            touchBtn.frame=CGRectMake((self.frame.size.width-btnW)*0.5, self.bottomY, btnW, btnH);
            
        }
            break;
        case ZGOrderStatusTypeSenderFour:{
            self.TimeOne.text=order.orderDate1;
            self.TimeTwo.text=order.orderDate2;
            self.TimeThree.text=order.orderDate3;
            self.TimeFour.text=order.orderDate4;
            self.BigPoint4.hidden=NO;
            self.StatusTwo.hidden=NO;
            self.StatusThree.hidden=NO;
            self.StatusFour.hidden=NO;
            self.StatusFour.font=[UIFont systemFontOfSize:13];
            self.LineOne.backgroundColor=Blue;
            self.LineTwo.backgroundColor=Blue;
            self.LineThree.backgroundColor=Blue;
            self.senderBadge.hidden=YES;
            self.reciverBadge.hidden=NO;
            [self mamufaturePointForProcess:self.PointTwo];
            [self mamufaturePointForProcess:self.PointThree];
            
            NSArray* viewArray=[[NSBundle mainBundle]loadNibNamed:@"ZGOrderSenderFourBottomView" owner:nil options:nil];
            
            ZGOrderSenderFourBottomView* send4bottom=[viewArray firstObject];
            send4bottom.frame= CGRectMake(0, self.bottomY-20, self.frame.size.width, 130);
            [self addSubview:send4bottom];
            
            [send4bottom.Contact setBackgroundImage:[UIImage resizedImageWithName:@"page_borrowing_btn_gray"] forState:UIControlStateNormal];
            [send4bottom.ComfirmReturn setBackgroundImage:[UIImage resizedImageWithName:@"page_borrowing_btn_orange"] forState:UIControlStateNormal];
            
        }
            break;
        case ZGOrderStatusTypeSenderFive:{
            
        }
            break;
        case ZGOrderStatusTypeReciverOne:{
            self.TimeOne.text=order.orderDate1;
            self.StatusOne.font=[UIFont systemFontOfSize:13];
            self.BigPoint1.hidden=NO;
            
            UIButton* touchBtn=[[UIButton alloc]init];
            [touchBtn setTitle:@"取消申请" forState:UIControlStateNormal];
            [touchBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [touchBtn setBackgroundImage:[UIImage resizedImageWithName:@"page_borrowing_btn_gray"] forState:UIControlStateNormal];
            touchBtn.titleLabel.font=[UIFont systemFontOfSize:12];
            //            [refuseBtn setImage:[UIImage imageNamed:@"shuping_pinglun" ] forState:UIControlStateNormal];
            [self addSubview:touchBtn];
            CGFloat btnW=(self.frame.size.width-3*OrderBtnGap)/2;
            CGFloat btnH=30;
            touchBtn.frame=CGRectMake((self.frame.size.width-btnW)*0.5, self.bottomY, btnW, btnH);

            
        }
            break;
        case ZGOrderStatusTypeReciverCancel:{
            self.TimeOne.text=order.orderDate1;
            self.TimeFive.text=order.orderDate5;
            
            self.StatusFive.hidden=NO;
            self.StatusFive.font=[UIFont systemFontOfSize:13];
            self.BigPoint5.hidden=NO;
            
            UILabel* cancelLabel=[[UILabel alloc]init];
            cancelLabel.text=@"     对方取消你的借阅申请。";
            cancelLabel.font=[UIFont systemFontOfSize:13];
            cancelLabel.textColor=[UIColor blackColor];
            [self addSubview:cancelLabel];
            
            CGFloat labelW=200;
            CGFloat labelH=30;
            cancelLabel.frame=CGRectMake((self.frame.size.width-labelW)*0.5, self.bottomY, labelW, labelH);
        }
            break;
        case ZGOrderStatusTypeReciverZero:
            break;
        case ZGOrderStatusTypeReciverTwo:{
            self.LineOne.backgroundColor=Blue;
            self.BigPoint2.hidden=NO;
            self.StatusTwo.hidden=NO;
            self.StatusTwo.font=[UIFont systemFontOfSize:13];
            self.TimeOne.text=order.orderDate1;
            self.TimeTwo.text=order.orderDate2;
            
            UIButton* touchBtn=[[UIButton alloc]init];
            [touchBtn setTitle:@"  联系对方" forState:UIControlStateNormal];
            [touchBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [touchBtn setBackgroundImage:[UIImage resizedImageWithName:@"page_borrowing_btn_gray"] forState:UIControlStateNormal];
            touchBtn.titleLabel.font=[UIFont systemFontOfSize:12];
            //            [refuseBtn setImage:[UIImage imageNamed:@"shuping_pinglun" ] forState:UIControlStateNormal];
            [self addSubview:touchBtn];
            CGFloat btnW=(self.frame.size.width-3*OrderBtnGap)/2;
            CGFloat btnH=30;
            touchBtn.frame=CGRectMake((self.frame.size.width-btnW)*0.5, self.bottomY, btnW, btnH);
            

            
            
        }
            break;
        case ZGOrderStatusTypeReciverThree:{
            
            self.TimeOne.text=order.orderDate1;
            self.TimeTwo.text=order.orderDate2;
            self.TimeThree.text=order.orderDate3;
            [self mamufaturePointForProcess:self.PointTwo];
            
            self.BigPoint3.hidden=NO;
            self.StatusTwo.hidden=NO;
            self.StatusThree.hidden=NO;
            self.StatusThree.font=[UIFont systemFontOfSize:13];
            self.LineOne.backgroundColor=Blue;
            self.LineTwo.backgroundColor=Blue;
            
            self.senderBadge.hidden=YES;
            self.reciverBadge.hidden=NO;
            
            UIButton* touchBtn=[[UIButton alloc]init];
            [touchBtn setTitle:@"  联系对方" forState:UIControlStateNormal];
            [touchBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [touchBtn setBackgroundImage:[UIImage resizedImageWithName:@"page_borrowing_btn_gray"] forState:UIControlStateNormal];
            touchBtn.titleLabel.font=[UIFont systemFontOfSize:12];
            //            [refuseBtn setImage:[UIImage imageNamed:@"shuping_pinglun" ] forState:UIControlStateNormal];
            [self addSubview:touchBtn];
            
            UIButton *lendBtn=[[UIButton alloc]init];
            [lendBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [lendBtn setTitle:@"已还书" forState:UIControlStateNormal];
            lendBtn.titleLabel.font=[UIFont boldSystemFontOfSize:12];
            
            [lendBtn setBackgroundImage:[UIImage resizedImageWithName:@"page_borrowing_btn_orange"] forState:UIControlStateNormal];
            [self addSubview:lendBtn];
            
            CGFloat btnW=(self.frame.size.width-3*OrderBtnGap)/2;
            CGFloat btnH=30;
            
            touchBtn.frame=CGRectMake(OrderBtnGap, self.bottomY, btnW, btnH);
            lendBtn.frame=CGRectMake(OrderBtnGap*2+btnW, self.bottomY, btnW, btnH);
            
        }
            break;
        case ZGOrderStatusTypeReciverFour:{
            self.TimeOne.text=order.orderDate1;
            self.TimeTwo.text=order.orderDate2;
            self.TimeThree.text=order.orderDate3;
            self.TimeFour.text=order.orderDate4;
            [self mamufaturePointForProcess:self.PointTwo];
            [self mamufaturePointForProcess:self.PointThree];
            self.BigPoint4.hidden=NO;
            self.StatusTwo.hidden=NO;
            self.StatusThree.hidden=NO;
            self.StatusFour.hidden=NO;
            self.StatusFour.font=[UIFont systemFontOfSize:13];
            self.LineOne.backgroundColor=Blue;
            self.LineTwo.backgroundColor=Blue;
            self.LineThree.backgroundColor=Blue;
           
            UIButton* touchBtn=[[UIButton alloc]init];
            [touchBtn setTitle:@"  联系对方" forState:UIControlStateNormal];
            [touchBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [touchBtn setBackgroundImage:[UIImage resizedImageWithName:@"page_borrowing_btn_gray"] forState:UIControlStateNormal];
            touchBtn.titleLabel.font=[UIFont systemFontOfSize:12];
            //            [refuseBtn setImage:[UIImage imageNamed:@"shuping_pinglun" ] forState:UIControlStateNormal];
            [self addSubview:touchBtn];
            CGFloat btnW=(self.frame.size.width-3*OrderBtnGap)/2;
            CGFloat btnH=30;
            touchBtn.frame=CGRectMake((self.frame.size.width-btnW)*0.5, self.bottomY, btnW, btnH);

        }
            break;
        case ZGOrderStatusTypeReciverFive:
            break;
        default:
            break;
    }
}
-(void)mamufature:(UIView*)view
{
    view.layer.cornerRadius=view.frame.size.width/2;
    view.layer.masksToBounds=YES;
}
-(void)mamufaturePoint:(UIImageView*)point
{
    point.layer.cornerRadius=point.frame.size.width/2;
    point.layer.masksToBounds=YES;
    point.layer.borderWidth=2;
    point.layer.borderColor=JWColor(221, 221, 221).CGColor;
}
-(void)mamufaturePointForProcess:(UIImageView*)point
{
    point.layer.borderWidth=0;
    point.layer.cornerRadius=point.frame.size.width/2;
    point.layer.masksToBounds=YES;
    point.layer.backgroundColor=Blue.CGColor;
}



@end

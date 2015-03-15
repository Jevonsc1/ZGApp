//
//  ZGNotificationCell.m
//  ZGApp
//
//  Created by Jevons on 15/1/29.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGNotificationCell.h"
#import "UIImageView+WebCache.h"
#import "UIImage+TB.h"
#import "UIImage+Cut.h"
@interface ZGNotificationCell()
@property(nonatomic,weak)UIButton* rightBtn;
@property(nonatomic,weak)UILabel* detailText;
@property(nonatomic,weak)UILabel* nameLabel;
@property(nonatomic,weak)UILabel* acceptedLabel;
@property(nonatomic,weak)UIImageView* addImg;
@end
@implementation ZGNotificationCell
+(instancetype)initWithTableview:(UITableView *)tableview
{
    
    static NSString* ID=@"cell";
    ZGNotificationCell* cell=[tableview dequeueReusableCellWithIdentifier:ID];
    
    if (cell==nil) {
        cell=[[ZGNotificationCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIButton* rightBtn=[[UIButton alloc]init];
        [self addSubview:rightBtn];
        self.rightBtn=rightBtn;
        
        UILabel* detailText=[[UILabel alloc]init];
        [self addSubview:detailText];
        self.detailText=detailText;
        
        UILabel* nameLabel=[[UILabel alloc]init];
        [self addSubview:nameLabel];
        self.nameLabel=nameLabel;
        
        UILabel* acceptedLabel=[[UILabel alloc]init];
        acceptedLabel.text=@"已接受";
        acceptedLabel.font=[UIFont systemFontOfSize:14];
        acceptedLabel.textColor=[UIColor grayColor];
       [self addSubview:acceptedLabel];
        self.acceptedLabel=acceptedLabel;
        
        UIImage* img=[UIImage imageNamed:@"page_messagescenter_friends"];
        UIImageView* addImg=[[UIImageView alloc]initWithImage:img];
        [self.imageView addSubview:addImg];
        self.addImg=addImg;
    }
    return self;
}
-(void)setCellFrame:(ZGNofCellFrame *)cellFrame
{
    _cellFrame=cellFrame;
    
    self.acceptedLabel.hidden=YES;
    self.addImg.hidden=YES;
    
    self.imageView.frame=cellFrame.iconF;
    
    self.nameLabel.text=cellFrame.celldata.name;
    self.nameLabel.frame=cellFrame.nameF;
    
    self.detailText.text=cellFrame.celldata.detailText;
    self.detailText.textColor=[UIColor grayColor];
    self.detailText.frame=cellFrame.detailTextF;
    self.detailText.font=celldetailFont;
    self.detailText.numberOfLines=0;
    
    self.rightBtn.frame=CGRectMake(0, 0, cellFrame.rightBtnSize.width, cellFrame.rightBtnSize.height);
    self.rightBtn.center=cellFrame.rightBtnCenter;
    
    switch (cellFrame.celldata.style) {
        case cellIconStyleOrder:{
            self.imageView.image=[UIImage resizedImageWithName:@"page_messagescenter_dingdan"];
            [self.rightBtn setTitle:@"新" forState:UIControlStateNormal];
            [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"page_naonow_remind"] forState:UIControlStateNormal];
            [self.rightBtn addTarget:self action:@selector(newClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.rightBtn setFont:[UIFont systemFontOfSize:14]];
           
        }  break;
           
        case cellIconStyleAddFri:{
            [self.imageView setImageWithURL:[NSURL URLWithString:cellFrame.celldata.IconUrl] placeholderImage:[UIImage imageNamed:@"page_messagescenter_shuping"]];
//            self.imageView.image=[UIImage cutCircleWithPic:self.imageView.image];
            
            self.addImg.hidden=NO;
            self.addImg.layer.anchorPoint=CGPointMake(1.0, 1.0);
            self.addImg.layer.position=CGPointMake(self.imageView.bounds.size.width*0.85, self.imageView.bounds.size.height*0.85);
            
            
            [self.rightBtn setTitle:@"接受" forState:UIControlStateNormal];
            [self.rightBtn setBackgroundImage:[UIImage resizedImageWithName:@"btn8"] forState:UIControlStateNormal];
            [self.rightBtn addTarget:self action:@selector(addClick:) forControlEvents:UIControlEventTouchUpInside];
            self.acceptedLabel.frame=self.rightBtn.frame;
            
        }
            break;
        case cellIconStyleBooklist:{
            self.imageView.image=[UIImage imageNamed:@"page_messagescenter_book"];
            
            [self.rightBtn setTitle:@"新" forState:UIControlStateNormal];
            [self.rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"page_naonow_remind"] forState:UIControlStateNormal];
            [self.rightBtn addTarget:self action:@selector(newClick:) forControlEvents:UIControlEventTouchUpInside];
             [self.rightBtn setFont:[UIFont systemFontOfSize:14]];
        }
            break;
        case cellIconStyleComment:{
            self.imageView.image=[UIImage imageNamed:@"page_messagescenter_shuping"];
            
            [self.rightBtn setTitle:@"新" forState:UIControlStateNormal];
            [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"page_naonow_remind"] forState:UIControlStateNormal];
            [self.rightBtn addTarget:self action:@selector(newClick:) forControlEvents:UIControlEventTouchUpInside];
             [self.rightBtn setFont:[UIFont systemFontOfSize:14]];
        }
            break;
        default:
            break;
    }
   
}
-(void)addClick:(UIButton*)btn
{
    btn.hidden=YES;
    self.acceptedLabel.hidden=NO;
    
}
-(void)newClick:(UIButton*)btn
{
   btn.hidden=YES;
}

@end

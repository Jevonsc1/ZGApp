//
//  ZGOrderView.h
//  ZGApp
//
//  Created by Jevons on 15/2/27.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZGBook.h"
#import "ZGOrder.h"

@interface ZGOrderView : UIView
@property(nonatomic,strong)ZGOrder* order;

@property (weak, nonatomic) IBOutlet UIImageView *bookView;

@property (weak, nonatomic) IBOutlet UILabel *bookName;
@property (weak, nonatomic) IBOutlet UILabel *bookAuthor;
@property (weak, nonatomic) IBOutlet UIButton *WriteCommentBtn;


@property (weak, nonatomic) IBOutlet UIImageView *PointOne;
@property (weak, nonatomic) IBOutlet UIImageView *PointTwo;
@property (weak, nonatomic) IBOutlet UIImageView *PointThree;
@property (weak, nonatomic) IBOutlet UIImageView *PointFour;
@property (weak, nonatomic) IBOutlet UIImageView *PointFive;
@property (weak, nonatomic) IBOutlet UIImageView *senderBadge;
@property (weak, nonatomic) IBOutlet UIImageView *reciverBadge;

@property (weak, nonatomic) IBOutlet UIImageView *LineOne;
@property (weak, nonatomic) IBOutlet UIImageView *LineTwo;
@property (weak, nonatomic) IBOutlet UIImageView *LineThree;
@property (weak, nonatomic) IBOutlet UIImageView *LineFour;
@property (weak, nonatomic) IBOutlet UIImageView *BigPoint1;
@property (weak, nonatomic) IBOutlet UIImageView *BigPoint2;
@property (weak, nonatomic) IBOutlet UIImageView *BigPoint3;
@property (weak, nonatomic) IBOutlet UIImageView *BigPoint4;
@property (weak, nonatomic) IBOutlet UIImageView *BigPoint5;

@property (weak, nonatomic) IBOutlet UILabel *StatusOne;
@property (weak, nonatomic) IBOutlet UILabel *StatusTwo;
@property (weak, nonatomic) IBOutlet UILabel *StatusThree;
@property (weak, nonatomic) IBOutlet UILabel *StatusFour;
@property (weak, nonatomic) IBOutlet UILabel *StatusFive;
@property (weak, nonatomic) IBOutlet UILabel *TimeOne;
@property (weak, nonatomic) IBOutlet UILabel *TimeTwo;
@property (weak, nonatomic) IBOutlet UILabel *TimeThree;
@property (weak, nonatomic) IBOutlet UILabel *TimeFour;
@property (weak, nonatomic) IBOutlet UILabel *TimeFive;

@property (weak, nonatomic) IBOutlet UIButton *senderIcon;
@property (weak, nonatomic) IBOutlet UIButton *reciverIcon;
@property (weak, nonatomic) IBOutlet UIImageView *arrowView;

@property (weak, nonatomic) IBOutlet UILabel *senderName;
@property (weak, nonatomic) IBOutlet UILabel *reciverName;



@end

//
//  ZGMyBookOrderCell.m
//  ZGApp
//
//  Created by Jevons on 15/3/3.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGMyBookOrderCell.h"
#import "UIImageView+WebCache.h"
/**
 *   ZGOrderStatusTypeReciverOne,
 ZGOrderStatusTypeReciverZero,
 ZGOrderStatusTypeReciverCancel,
 ZGOrderStatusTypeReciverTwo,
 ZGOrderStatusTypeReciverThree,
 ZGOrderStatusTypeReciverFour,
 ZGOrderStatusTypeReciverFive
 */
@implementation ZGMyBookOrderCell
-(void)setOrder:(ZGOrder *)order
{
    _order=order;
    [self.bookView setImageWithURL:[NSURL URLWithString:order.book.images.small] placeholderImage:[UIImage imageNamed:@"book_blank"]];
    self.bookName.text=order.book.title;
    self.bookUser.text=order.Opposite.userName;
    switch (order.status) {
        case ZGOrderStatusTypeReciverZero:{
            self.bookStatus.text=@"已发送借阅申请";
        }
            
            break;
        case ZGOrderStatusTypeReciverOne:{
            self.bookStatus.text=@"待对方借出";
        }
            
            break;
        case  ZGOrderStatusTypeReciverTwo:{
            self.bookStatus.text=@"待归还";
        }
            
            break;
        case ZGOrderStatusTypeReciverThree:{
            self.bookStatus.text=@"待对方确认归还";
        }
            
            break;
        case ZGOrderStatusTypeReciverFour:{
                self.bookStatus.text=@"已归还";
            }
            
            break;
            
        default:
            break;
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

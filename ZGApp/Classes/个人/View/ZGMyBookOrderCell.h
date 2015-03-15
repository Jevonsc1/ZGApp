//
//  ZGMyBookOrderCell.h
//  ZGApp
//
//  Created by Jevons on 15/3/3.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZGOrder.h"
@interface ZGMyBookOrderCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bookView;
@property (weak, nonatomic) IBOutlet UILabel *bookName;
@property (weak, nonatomic) IBOutlet UILabel *bookUser;
@property (weak, nonatomic) IBOutlet UILabel *bookStatus;
@property(nonatomic,strong)ZGOrder* order;

@end

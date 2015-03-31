//
//  ZGBookDetailComCell.h
//  ZGApp
//
//  Created by Jevons on 15/3/31.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZGBookComment.h"

@interface ZGBookDetailComCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *comSchoolLabel;
@property (weak, nonatomic) IBOutlet UIButton *zanBtn;
@property (weak, nonatomic) IBOutlet UIButton *comBtn;
@property (strong,nonatomic)ZGBookComment *comment;
+(instancetype)initWithTableView:(UITableView*)tableView;
@end

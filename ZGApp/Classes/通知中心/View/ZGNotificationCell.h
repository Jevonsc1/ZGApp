//
//  ZGNotificationCell.h
//  ZGApp
//
//  Created by Jevons on 15/1/29.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZGNofCellFrame.h"
@interface ZGNotificationCell : UITableViewCell
+(instancetype)initWithTableview:(UITableView *)tableview;
@property(nonatomic,strong)ZGNofCellFrame* cellFrame;

@end

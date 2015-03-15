//
//  TBFriTableViewCell.h
//  TestBooking
//
//  Created by Jevons on 14/12/15.
//  Copyright (c) 2014年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TBCellModel;

@interface TBFriTableViewCell : UITableViewCell

@property(nonatomic,weak)TBCellModel* cellmodel;


+(instancetype)cellWithTable:(UITableView*)tableView;
@end

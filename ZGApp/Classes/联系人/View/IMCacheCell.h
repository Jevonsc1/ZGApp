//
//  IMCacheCell.h
//  ZGApp
//
//  Created by Jevons on 15/1/20.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "imCacheData.h"
@interface IMCacheCell : UITableViewCell

@property(nonatomic,copy)NSString* date;

@property(nonatomic,assign)CGFloat cellHight;

@property(nonatomic,strong)imCacheData* model;

+(instancetype)initWithTableView:(UITableView*)tableView;

@end

//
//  ZGUserController.h
//  ZGApp
//
//  Created by T on 15/3/4.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZGUser.h"
@interface ZGUserController : UITableViewController
@property(nonatomic,strong)ZGUser* user;
@property(nonatomic,strong)NSMutableArray* bookArray;
@end

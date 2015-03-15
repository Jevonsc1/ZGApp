//
//  IMChatCell.h
//  ZGApp
//
//  Created by Jevons on 15/1/24.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMChatData.h"
@interface IMChatCell : UITableViewCell
@property(nonatomic,strong)IMChatData* data;
@property(nonatomic,assign)CGFloat cellhight;

@end

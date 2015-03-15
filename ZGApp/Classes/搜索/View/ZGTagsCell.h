//
//  ZGTagsCell.h
//  ZGApp
//
//  Created by Jevons on 15/2/7.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZGTags.h"
@class ZGTagsCell;
@protocol ZGTagsCellDelegate<NSObject>
@optional
-(void)tagscell:(ZGTagsCell*)ZGTagsCell withBtnTitle:(NSString*)title;
@end

@interface ZGTagsCell : UITableViewCell
@property(nonatomic,strong)ZGTags* tags;
+(instancetype)cellWithTable:(UITableView*)tableView;
@property(nonatomic,weak)id<ZGTagsCellDelegate> delegate;
@end

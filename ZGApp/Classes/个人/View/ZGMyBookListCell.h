//
//  ZGMyBookListCell.h
//  ZGApp
//
//  Created by Jevons on 15/3/3.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZGBookList.h"

@interface ZGMyBookListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bookView;
@property (weak, nonatomic) IBOutlet UILabel *bookName;
@property (weak, nonatomic) IBOutlet UILabel *bookAuthor;
@property (weak, nonatomic) IBOutlet UIButton *selectBtn;
@property (weak, nonatomic) IBOutlet UILabel *btnStatus;
@property(nonatomic,strong)ZGBookList* booklist;
- (IBAction)btnSelect:(id)sender;

@end

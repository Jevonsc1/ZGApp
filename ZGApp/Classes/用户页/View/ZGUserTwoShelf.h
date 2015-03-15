//
//  ZGUserTwoShelf.h
//  ZGApp
//
//  Created by Jevons on 15/3/4.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZGUserTwoShelf : UIView
@property (weak, nonatomic) IBOutlet UIImageView *bookView1;
@property (weak, nonatomic) IBOutlet UIImageView *bookView2;
@property (weak, nonatomic) IBOutlet UIImageView *bookView3;
@property (weak, nonatomic) IBOutlet UIImageView *bookView4;
@property (weak, nonatomic) IBOutlet UIImageView *bookshelfView;
@property (weak, nonatomic) IBOutlet UILabel *bookName1;
@property (weak, nonatomic) IBOutlet UILabel *bookName2;
@property (weak, nonatomic) IBOutlet UILabel *bookName3;
@property (weak, nonatomic) IBOutlet UILabel *bookName4;

@end

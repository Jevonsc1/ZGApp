//
//  ZGMyTagCell.h
//  ZGApp
//
//  Created by Jevons on 15/3/6.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZGMyTagCell : UITableViewCell
@property(nonatomic,strong)NSArray* tagArray;
@property(nonatomic,weak)UILabel* mylabel;
@property(nonatomic,weak)UIImageView* myimageView;

@property(nonatomic,assign)CGFloat cellHeight;
@end

//
//  ZGBookComFrame.h
//  ZGApp
//
//  Created by Jevons on 15/2/8.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ZGBookCmt.h"
@interface ZGBookComFrame : NSObject
@property(nonatomic,strong)ZGBookCmt* comment;
@property(nonatomic,assign)CGFloat cellHeight;
@property(nonatomic,assign)CGRect ColTimeF;
@property(nonatomic,assign)CGRect CommentBgF;
@property(nonatomic,assign)CGRect iconViewF;
@property(nonatomic,assign)CGRect commentTitleF;
@property(nonatomic,assign)CGRect contentF;
@property(nonatomic,assign)CGRect AuthorF;
@property(nonatomic,assign)CGRect Comment_countF;
@property(nonatomic,assign)CGRect Like_countF;
@property(nonatomic,assign)CGRect bookNameF;
@property (assign, nonatomic) BOOL isChecked;

@end

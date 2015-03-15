//
//  ZGFootCmtFrame.h
//  ZGApp
//
//  Created by Jevons on 15/3/3.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZGFootCmt.h"
#import <UIKit/UIKit.h>
@interface ZGFootCmtFrame : NSObject
@property(nonatomic,strong)ZGFootCmt* comment;
@property(nonatomic,assign)CGFloat cellHeight;
@property(nonatomic,assign)CGRect leftTopViewF;
@property(nonatomic,assign)CGRect ColTimeF;
@property(nonatomic,assign)CGRect CommentBgF;
@property(nonatomic,assign)CGRect iconViewF;
@property(nonatomic,assign)CGRect commentTitleF;
@property(nonatomic,assign)CGRect contentF;
@property(nonatomic,assign)CGRect AuthorF;
@property(nonatomic,assign)CGRect Comment_countF;
@property(nonatomic,assign)CGRect Like_countF;
@property(nonatomic,assign)CGRect bookNameF;
@end

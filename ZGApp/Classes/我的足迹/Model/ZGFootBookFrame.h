//
//  ZGFootBookFrame.h
//  ZGApp
//
//  Created by Jevons on 15/3/3.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ZGFootBook.h"
@interface ZGFootBookFrame : NSObject
@property(nonatomic,strong)ZGFootBook* book;
@property(nonatomic,assign)CGFloat cellHeight;
@property(nonatomic,assign)CGRect leftTopViewF;
@property(nonatomic,assign)CGRect ColTimeF;
@property(nonatomic,assign)CGRect BookBgF;
@property(nonatomic,assign)CGRect bookViewF;
@property(nonatomic,assign)CGRect bookNameF;
@property(nonatomic,assign)CGRect bookAuthorF;
@end

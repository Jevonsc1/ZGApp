//
//  ZGColBookFrame.h
//  ZGApp
//
//  Created by Jevons on 15/2/6.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ZGCollectBook.h"
@interface ZGColBookFrame : NSObject
@property(nonatomic,strong)ZGCollectBook* book;
@property(nonatomic,assign)CGFloat cellHeight;
@property(nonatomic,assign)CGRect ColTimeF;
@property(nonatomic,assign)CGRect BookBgF;
@property(nonatomic,assign)CGRect bookViewF;
@property(nonatomic,assign)CGRect bookNameF;
@property(nonatomic,assign)CGRect bookAuthorF;
@property(nonatomic,assign)BOOL isChecked;

@end

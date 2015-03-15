//
//  ZGBookDetailFrame.h
//  ZGApp
//
//  Created by Jevons on 15/1/27.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ZGBook.h"

@interface ZGBookDetailFrame : NSObject
@property(nonatomic,strong)ZGBook* book;

@property(nonatomic,assign,readonly)CGRect topViewF;
@property(nonatomic,assign,readonly)CGFloat topViewHeight;
@property(nonatomic,assign,readonly)CGRect bookImageViewF;
@property(nonatomic,assign,readonly)CGRect bookTitleF;
@property(nonatomic,strong)NSMutableArray* tagsViewFArray;
@property(nonatomic,assign,readonly)CGRect publisherLabelF;

@property(nonatomic,assign,readonly)CGFloat bottomViewHeigth;
@property(nonatomic,assign,readonly)CGRect bookSummaryF;
@property(nonatomic,assign,readonly)CGRect displayBtnF;
@property(nonatomic,assign,readonly)CGRect bookInfoBtnF;
@property(nonatomic,assign,readonly)CGRect friLabelF;
@property(nonatomic,strong)NSMutableArray* friViewArray;






@end

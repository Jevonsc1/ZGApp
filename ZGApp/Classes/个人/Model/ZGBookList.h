//
//  ZGBookList.h
//  ZGApp
//
//  Created by Jevons on 15/3/3.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZGBook.h"

@interface ZGBookList : NSObject
@property(nonatomic,assign)int bookstatus;
@property(nonatomic,strong)ZGBook* book;
@end

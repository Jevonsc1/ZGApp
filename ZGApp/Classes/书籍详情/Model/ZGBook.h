//
//  ZGBook.h
//  ZGApp
//
//  Created by Jevons on 15/1/26.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookPic.h"
@interface ZGBook : NSObject
@property(nonatomic,strong)BookPic* images;
@property(nonatomic,copy)NSString* title;
@property(nonatomic,copy)NSString* publisher;
@property(nonatomic,strong)NSArray* tags;
@property(nonatomic,copy)NSString* author;
@property(nonatomic,copy)NSString* summary;
@property(nonatomic,copy)NSString* book_id;
@property(nonatomic,copy)NSString* isbn13;
@property(nonatomic,copy)NSString* isbn10;
@end

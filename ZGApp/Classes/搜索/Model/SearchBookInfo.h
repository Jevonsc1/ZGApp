//
//  SearchBookInfo.h
//  ZGApp
//
//  Created by Jevons on 15/1/22.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookPic.h"
@interface SearchBookInfo : NSObject
@property(nonatomic,copy)NSString* author;
@property(nonatomic,copy)NSString* title;
@property(nonatomic,strong)BookPic* images;
@end

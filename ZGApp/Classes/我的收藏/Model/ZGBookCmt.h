//
//  ZGBookCmt.h
//  ZGApp
//
//  Created by Jevons on 15/2/8.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZGBookCmt : NSObject
@property(nonatomic,assign)long long comment_id;
@property(nonatomic,assign)long long book_id;
@property(nonatomic,assign)long long sender_id;
@property(nonatomic,copy)NSString* send_name;
@property(nonatomic,assign)long long rec_id;
@property(nonatomic,copy)NSString* title;
@property(nonatomic,copy)NSString* content;
@property(nonatomic,assign)long long like_count;
@property(nonatomic,assign)long long comment_time;
@property(nonatomic,assign)long long comment_count;
@property(nonatomic,copy)NSString* book_name;

@end

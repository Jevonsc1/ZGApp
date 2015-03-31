//
//  ZGBookComment.h
//  ZGApp
//
//  Created by Jevons on 15/3/31.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZGBookComment : NSObject
@property(nonatomic,copy)NSString *commentAuthor;
@property(nonatomic,assign)BOOL isComSchool;
@property(nonatomic,copy)NSString *date;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,assign)int zanNum;
@property(nonatomic,assign)int comNum;


@end

//
//  TBCellModel.h
//  TestBooking
//
//  Created by Jevons on 14/12/15.
//  Copyright (c) 2014年 Jevons. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBCellModel : NSObject
@property(nonatomic,copy)NSString* bookname;
@property(nonatomic,copy)NSString* author;
@property(nonatomic,copy)NSString* category;
@property(nonatomic,strong)NSArray* friendname;
@property(nonatomic,copy)NSString* bookpic;
+(instancetype)initWithDict:(NSDictionary*)dict;

@end

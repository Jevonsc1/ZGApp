//
//  TBCellModel.m
//  TestBooking
//
//  Created by Jevons on 14/12/15.
//  Copyright (c) 2014年 Jevons. All rights reserved.
//

#import "TBCellModel.h"

@implementation TBCellModel
+(instancetype)initWithDict:(NSDictionary *)dict
{
   return  [[self alloc]initWithDict:dict];
}
-(instancetype)initWithDict:(NSDictionary*)dict
{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
@end

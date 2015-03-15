//
//  ZGBookResult.m
//  ZGApp
//
//  Created by Jevons on 15/1/25.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGBookResult.h"
#import "MJExtension.h"
#import "ZGBook.h"
@implementation ZGBookResult
-(NSDictionary *)objectClassInArray
{
    return @{@"books":[ZGBook class]};
}
@end

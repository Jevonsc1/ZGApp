//
//  ZGBook.m
//  ZGApp
//
//  Created by Jevons on 15/1/26.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGBook.h"
#import "MJExtension.h"
#import "ZGBookTag.h"
@implementation ZGBook
-(NSDictionary *)objectClassInArray
{
    return @{@"tags":[ZGBookTag class]};
}
@end

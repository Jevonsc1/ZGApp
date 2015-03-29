//
//  ZGAccount.m
//  ZGApp
//
//  Created by JJ on 15/3/29.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGAccount.h"

@interface ZGAccount ()


@end

@implementation ZGAccount

+ (instancetype)accountWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

/**
 *  从文件中解析对象的时候调
 */
- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        self.token = [decoder decodeObjectForKey:@"token"];
        self.user_id = [decoder decodeInt64ForKey:@"user_id"];
        self.user_name = [decoder decodeObjectForKey:@"user_name"];
    }
    return self;
}

/**
 *  将对象写入文件的时候调用
 */
- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.token forKey:@"token"];
    [encoder encodeObject:self.user_name forKey:@"user_name"];
    [encoder encodeInt64:self.user_id forKey:@"user_id"];
}

@end

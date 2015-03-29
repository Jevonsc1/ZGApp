//
//  ZGAccount.h
//  ZGApp
//
//  Created by JJ on 15/3/29.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZGAccount : NSObject <NSCoding>

@property(nonatomic, copy) NSString * user_name;
@property(nonatomic, assign) long long user_id;
@property(nonatomic, copy) NSString * token;


+ (instancetype)accountWithDict:(NSDictionary*)dict;
- (instancetype)initWithDict:(NSDictionary*)dict;

@end

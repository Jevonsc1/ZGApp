//
//  ZGUserDetailParam.h
//  ZGApp
//
//  Created by JJ on 15/3/29.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZGUserDetailParam : NSObject

@property(nonatomic, assign)long long user_id;
@property(nonatomic, copy)NSString * token;
@property(nonatomic, copy)NSString * name;
@property(nonatomic, copy)NSString * introduction;
@property(nonatomic, assign)int sex;

@end

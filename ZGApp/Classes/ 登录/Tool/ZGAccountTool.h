//
//  ZGAccountTool.h
//  ZGApp
//
//  Created by JJ on 15/3/29.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZGAccount.h"
#import "ZGAccountRegParam.h"
#import "ZGUserDetailParam.h"


@interface ZGAccountTool : NSObject

+ (void)regiserWithParams:(ZGAccountRegParam*)param success:(void (^)(ZGAccount* account))success failure:(void (^)(NSError *error))failure;

+ (void)saveAccount:(ZGAccount*)account;

+ (ZGAccount*)getAccount;

+ (void)setUserDetail:(ZGUserDetailParam*)param success:(void(^)(id json))success failure:(void(^)(NSError *error))failure;

@end

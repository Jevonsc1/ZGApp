//
//  ZGAccountTool.m
//  ZGApp
//
//  Created by JJ on 15/3/29.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGAccountTool.h"
#import "MJExtension.h"
#import "ZGHttpTool.h"

#define ZGAccountFile [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.data"]


@implementation ZGAccountTool

+ (void)regiserWithParams:(ZGAccountRegParam *)param success:(void (^)(ZGAccount *))success failure:(void (^)(NSError *))failure {
    NSDictionary * paramDict = param.keyValues;
    NSString *url = @"http://120.24.81.123/zhigeng/index.php?c=login&m=register";
//    [ZGHttpTool getWithURL:url params:params
//                   success:^(id json){
//                       NSLog(@"%@", json);
//                   }failure:^(NSError *error){
//                       NSLog(@"err");
//                   }];
        [ZGHttpTool getWithURL:url params:paramDict success:^(id json) {
            // 缓存
//            [IWStatusCacheTool addStatuses:json[@"statuses"]];
            
            // 传递了block
            if (success) {
                ZGAccount * account=[ZGAccount objectWithKeyValues:json];
                NSLog(@"%@", json);
                success(account);
            }
            
        } failure:^(NSError *error) {
            if (failure) {
                failure(error);
            }
        }];
}

+ (void)setUserDetail:(ZGUserDetailParam *)param success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    NSString * url = @"http://120.24.81.123/zhigeng/index.php?c=user&m=setUserDetail";
    NSDictionary * paramDict = param.keyValues;
    [ZGHttpTool getWithURL:url params:paramDict success:^(id json) {
        // 缓存
        //            [IWStatusCacheTool addStatuses:json[@"statuses"]];
        
        // 传递了block
        if (success) {
            //                NSLog(@"%@", json);
            success(json);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)saveAccount:(ZGAccount *)account {
    [NSKeyedArchiver archiveRootObject:account toFile:ZGAccountFile];
}


+ (ZGAccount *)getAccount {
    ZGAccount * account = [NSKeyedUnarchiver unarchiveObjectWithFile:ZGAccountFile];
    return account;
}

@end
















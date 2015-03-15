//
//  imCacheData.h
//  ZGApp
//
//  Created by Jevons on 15/1/20.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface imCacheData : NSObject
@property(nonatomic,copy)NSString* icon;
@property(nonatomic,copy)NSString* name;
@property(nonatomic,copy)NSString* message;
@property(nonatomic,copy)NSString* date;
@property(nonatomic,assign)NSNumber* badgeNum;
@end

//
//  ZGOrder.h
//  ZGApp
//
//  Created by Jevons on 15/3/2.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZGBook.h"
#import "ZGUser.h"
typedef enum{
    ZGOrderStatusTypeSenderOne,
    ZGOrderStatusTypeSenderTwo,
    ZGOrderStatusTypeSenderThree,
    ZGOrderStatusTypeSenderFour,
    ZGOrderStatusTypeSenderFive,
    ZGOrderStatusTypeReciverOne,
    ZGOrderStatusTypeReciverZero,
    ZGOrderStatusTypeReciverCancel,
    ZGOrderStatusTypeReciverTwo,
    ZGOrderStatusTypeReciverThree,
    ZGOrderStatusTypeReciverFour,
    ZGOrderStatusTypeReciverFive
}ZGOrderStatusType;

@interface ZGOrder : NSObject
@property(nonatomic,copy)NSString* orderDate1;
@property(nonatomic,copy)NSString* orderDate2;
@property(nonatomic,copy)NSString* orderDate3;
@property(nonatomic,copy)NSString* orderDate4;
@property(nonatomic,copy)NSString* orderDate5;
@property(nonatomic,strong)ZGUser* Opposite;
@property(nonatomic,strong)ZGBook* book;
@property(nonatomic,assign)ZGOrderStatusType status;

@end

//
//  ZGNofCellData.h
//  ZGApp
//
//  Created by Jevons on 15/1/29.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum{
    cellIconStyleOrder,
    cellIconStyleAddFri,
    cellIconStyleBooklist,
    cellIconStyleComment,
}cellIconStyle;

@interface ZGNofCellData : NSObject
@property(nonatomic,copy)NSString* IconUrl;
@property(nonatomic,copy)NSString* name;
@property(nonatomic,copy)NSString* detailText;
@property(nonatomic,assign)cellIconStyle style;

@end

//
//  ZGUser.h
//  ZGApp
//
//  Created by Jevons on 15/2/1.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZGUser : NSObject

@property(nonatomic,copy)NSString* userName;
@property(nonatomic,copy)NSString* userIntro;
@property(nonatomic,strong)NSArray* tags;
@property(nonatomic,assign)BOOL sex;
@property(nonatomic,assign)int rank;
@property(nonatomic,strong)UIImage* iconImage;

@end

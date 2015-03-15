//
//  ZGTags.h
//  ZGApp
//
//  Created by Jevons on 15/2/7.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ZGTags : NSObject
@property(nonatomic,copy)NSString* tagTitle;
@property(nonatomic,strong)NSArray* tagArray;
@property(nonatomic,assign)CGFloat cellHeight;
@end

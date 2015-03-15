//
//  TBTarBar.h
//  TestBooking
//
//  Created by Jevons on 14/12/13.
//  Copyright (c) 2014年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TBTarBar;
@protocol  TBTarBarDelegate<NSObject>

@optional
-(void)tabBar:(TBTarBar*)tabBar to:(int)to;

@end
@interface TBTarBar : UIView

-(void)addItem:(UITabBarItem*)item;
@property(nonatomic,weak) id<TBTarBarDelegate> delegate;

@end

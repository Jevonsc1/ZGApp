//
//  ZGBookNav.h
//  ZGApp
//
//  Created by Jevons on 15/3/8.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZGBookNav;
@protocol ZGBookNavDelegate<NSObject>

@optional
-(void)navBarWithBtnBack:(ZGBookNav*)navBar;
-(void)navBarWithBtnCol:(ZGBookNav*)navBar;


@end
@interface ZGBookNav : UIView

@property(nonatomic,copy)NSString* name;
@property(nonatomic,weak)id<ZGBookNavDelegate> delegate;

@end
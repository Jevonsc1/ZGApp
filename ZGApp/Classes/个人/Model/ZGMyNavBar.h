//
//  ZGMyNavBar.h
//  ZGApp
//
//  Created by Jevons on 15/2/2.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZGMyNavBar;
@protocol ZGMyNavBarDelegate<NSObject>

@optional
-(void)navBarWithBtnNotif:(ZGMyNavBar*)navBar;
-(void)navBarWithBtnSetting:(ZGMyNavBar*)navBar;
-(void)navBarWithBtnSearch:(ZGMyNavBar*)navBar;

@end
@interface ZGMyNavBar : UIView
@property(nonatomic,copy)NSString* name;
@property(nonatomic,weak)id<ZGMyNavBarDelegate> delegate;

@end

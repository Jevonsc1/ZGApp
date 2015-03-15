//
//  ZGUserNav.h
//  ZGApp
//
//  Created by Jevons on 15/3/7.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZGUserNav;
@protocol ZGUserNavDelegate<NSObject>

@optional
-(void)navBarWithBtnBack:(ZGUserNav*)navBar;
-(void)navBarWithBtnSetting:(ZGUserNav*)navBar;


@end
@interface ZGUserNav : UIView

 @property(nonatomic,copy)NSString* name;
 @property(nonatomic,weak)id<ZGUserNavDelegate> delegate;

@end

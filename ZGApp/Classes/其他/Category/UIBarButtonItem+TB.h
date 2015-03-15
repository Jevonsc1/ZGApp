//
//  UIBarButtonItem+TB.h
//  TestBooking
//
//  Created by Jevons on 14/12/19.
//  Copyright (c) 2014年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (TB)
+(UIBarButtonItem*)setNormalImage:(NSString*)normal hightlighted:(NSString*)hightlighted target:(id)target action:(SEL)action;
@end

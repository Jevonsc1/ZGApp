//
//  UIImage+TB.h
//  TestBooking
//
//  Created by Jevons on 14/12/16.
//  Copyright (c) 2014年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (TB)
+ (UIImage *)resizedImageWithName:(NSString *)name;
+ (UIImage *)resizedImageWithName:(NSString *)name left:(float)left top:(float)top;
@end

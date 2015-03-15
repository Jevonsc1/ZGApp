//
//  UIImage+TB.m
//  TestBooking
//
//  Created by Jevons on 14/12/16.
//  Copyright (c) 2014年 Jevons. All rights reserved.
//

#import "UIImage+TB.h"

@implementation UIImage (TB)

+ (UIImage *)resizedImageWithName:(NSString *)name
{
    UIImage *image = [self imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}

+ (UIImage *)resizedImageWithName:(NSString *)name left:(float)left top:(float)top
{
    UIImage *image = [self imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width*left topCapHeight:image.size.height*top];
}

@end
